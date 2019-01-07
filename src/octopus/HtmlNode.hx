package octopus;

import cpp.Native;
import octopus.native.NativeApi;
import octopus.native.NativeApi.MyHtmlTreeNode;
import cpp.RawPointer;
import cpp.Pointer;
import octopus.native.MyHtmlTagId;
using Lambda;

/**
 * Iterate over child nodes
 */
class ChildNodeIterator {
	/**
	 * Root node
	 */
	final root:HtmlNode;

	/**
	 * Next node
	 */
	var nextNode:HtmlNode;

	/**
	 * Constructor
	 */
	public function new(root:HtmlNode) {
		this.root = root;
	}

	/**
	 * Has next node
	 */
	public function hasNext() {
		nextNode = nextNode == null ? nextNode = root.child : nextNode = nextNode.next;
		return nextNode == null ? false : true;
	}

	/**
	 * Next node
	 */
	public function next() {
		return nextNode;
	}
}

/**
 * Iterator over nodes
 */
class NodeIterator {
	/**
	 * Stack
	 */
	final stack:Array<HtmlNode>;

	/**
	 * Current node
	 */
	var current:HtmlNode;

	/**
	 * Constructor
	 */
	public function new(root:HtmlNode) {
		stack = new Array<HtmlNode>();
		stack.push(root);
	}

	/**
	 * Has next node
	 */
	public function hasNext():Bool {
		if (current == null) {
			current = stack[0];
			return true;
		}

		while (stack.length > 0) {
			if (current != null) {
				current = current.child;
				if (current != null) {
					stack.push(current);
					return true;
				}
			} else {
				current = stack.pop().next;
				if (current != null) {
					stack.push(current);
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Next node
	 */
	public function next():HtmlNode {
		return current;
	}
}

/**
 * Html node
 */
class HtmlNode {
    /**
	 * Native tree node
	 */
	var nativeNode:RawPointer<MyHtmlTreeNode>;

    /**
     * Parent tree
     */
    final tree:HtmlTree;

    /**
	 * Create from native node
	 * @param native
	 */
	@:allow(octopus.HtmlTree)
	@:allow(octopus.NodeCollection)
	static function fromNative(native:RawPointer<MyHtmlTreeNode>, tree:HtmlTree) {
		var res = new HtmlNode(tree);
		res.nativeNode = native;
		return res;
	}

    /**
	 * Html tag id
	 */
	public var tagId(get, never):MyHtmlTagId;

	function get_tagId():MyHtmlTagId {
		return NativeApi.myhtml_node_tag_id(nativeNode);
	}

	/**
	 * Html tag name
	 */
	public var tagName(get, never):String;

	function get_tagName():String {
		var bytes = NativeApi.myhtml_tag_name_by_id(tree.nativeTree, tagId, null);
		if (bytes == null)
			return null;
		return bytes.toString();
	}

    /**
	 * Get text of node
	 */
	public var text(get, never):String;

	function get_text():String {
		var txtNode:HtmlNode = null;
		if (tagId == MyHTML_TAG__TEXT) {
			txtNode = this;
		} else {
			txtNode = childs.find(x -> x.tagId == MyHTML_TAG__TEXT);
		}

        if (txtNode == null)
            return null;

		var bytes = NativeApi.myhtml_node_text(txtNode.nativeNode, null);
		if (bytes == null)
			return null;
		var text = bytes.toString();
		return text;
	}

    /**
	 * Child node
	 */
	public var child(get, never):HtmlNode;

	function get_child():HtmlNode {
		var native = NativeApi.myhtml_node_child(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Last child node
	 */
	public var lastChild(get, never):HtmlNode;

	function get_lastChild():HtmlNode {
		var native = NativeApi.myhtml_node_last_child(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Next node
	 */
	public var next(get, never):HtmlNode;

	function get_next():HtmlNode {
		var native = NativeApi.myhtml_node_next(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Prev node
	 */
	public var prev(get, never):HtmlNode;

	function get_prev():HtmlNode {
		var native = NativeApi.myhtml_node_prev(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * All childs
	 */
	public var childs(get, never):Iterable<HtmlNode>;

	function get_childs():Iterable<HtmlNode> {
		return {
			iterator: () -> new ChildNodeIterator(this)
		}
	}

    /**
	 * Iterate over all child nodes
	 */
	public var nodes(get, never):Iterable<HtmlNode>;

	function get_nodes():Iterable<HtmlNode> {
		return {
			iterator: () -> new NodeIterator(this)
		}
	}

    /**
	 * Constructor
	 */
	public function new(tree:HtmlTree) {
        this.tree = tree;
    }

	/**
	 * Get attribute value by key
	 * @param key 
	 */
	public function getAttributeValue(key:String):String {
		var nativeAttr = NativeApi.myhtml_attribute_by_key(nativeNode, key, key.length);
		if (nativeAttr == null)
			return null;
		var res = NodeAttribute.fromNative(nativeAttr);
		return res.value;
	}

    /**
	 * Get inner text
	 */
	public function getInnerText(delimiter:String = " "):String {
		var nodes = getNodesByTagId(MyHTML_TAG__TEXT);
		return nodes.map(x -> x.text).join(delimiter);
	}

    /**
	 * Return nodes by tag id
	 * @param tagId
	 * @return NodeCollection
	 */
	public function getNodesByTagId(tagId:MyHtmlTagId):NodeCollection {
        var pstatus:RawPointer<MyStatus> = null;
        var collectionRaw = NativeApi.myhtml_get_nodes_by_tag_id_in_scope(tree.nativeTree, null, nativeNode, tagId, pstatus);
        var collection = Pointer.fromRaw(collectionRaw);
		return NodeCollection.fromNative(collection, tree);
	}

	/**
	 * Return nodes by tag name
	 * @param name
	 * @return NodeCollection
	 */
	public function getNodesByTagName(name:String):NodeCollection {
        var tagId = tree.getTagIdByName(name);
		return getNodesByTagId(tagId);
	}

	/**
	 * Find nodes by css selectors
	 */
	public function findByCss(selectors:String):NodeCollection {
		// TODO: check status

		var css = NativeApi.mycss_create();
		var status = NativeApi.mycss_init(css);
		var entry = NativeApi.mycss_entry_create();
		status = NativeApi.mycss_entry_init(css, entry);
		var finder = NativeApi.modest_finder_create_simple();

		var entrySelector = NativeApi.mycss_entry_selectors(entry);
		var selectorsList = NativeApi.mycss_selectors_parse(entrySelector, MyENCODING_UTF_8, selectors, selectors.length, null);

		var collection:RawPointer<MyHtmlCollection> = null;
		var collectionAddr = RawPointer.addressOf(collection);
		NativeApi.modest_finder_by_selectors_list(finder, nativeNode, selectorsList, collectionAddr);
		var nativeCollection = Pointer.fromRaw(collection);
		var res = NodeCollection.fromNative(nativeCollection, tree);

		NativeApi.mycss_selectors_list_destroy(entrySelector, selectorsList, true);
		NativeApi.modest_finder_destroy(finder, true);
		NativeApi.mycss_entry_destroy(entry, true);
		NativeApi.mycss_destroy(css, true);

		return res;
	}
}