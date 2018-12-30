package octopus.html;

import octopus.html.NativeHtml.NativeHtmlApi;
import octopus.html.NativeHtml.NativeHtmlTreeNode;

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
 * Node of html tree
 */
class HtmlNode {
	/**
	 * Native tree node
	 */
	var nativeNode:NativeHtmlTreeNode;

    /**
     * Parent tree
     */
    final tree:HtmlTree;

	/**
	 * Create from native node
	 * @param native
	 */
	@:allow(octopus.html.HtmlTree)
	@:allow(octopus.html.NodeCollection)
	static function fromNative(native:NativeHtmlTreeNode, tree:HtmlTree) {
		var res = new HtmlNode(tree);
		res.nativeNode = native;
		return res;
	}

	/**
	 * Get text of node
	 */
	public var text(get, never):String;

	function get_text():String {
		var txtNode:HtmlNode = null;
		if (tagId == TAG__TEXT) {
			txtNode = this;
		} else {
			txtNode = childs.find(x -> x.tagId == TAG__TEXT);
		}

        if (txtNode == null)
            return null;

		var bytes = NativeHtmlApi.html_get_node_text(txtNode.nativeNode);
		if (bytes == null)
			return null;
		var text = @:privateAccess String.fromUTF8(bytes);
		return text;
	}

	/**
	 * html tag id
	 */
	public var tagId(get, never):HtmlTagId;

	function get_tagId():HtmlTagId {
		return NativeHtmlApi.html_get_node_tag(nativeNode);
	}

    /**
     * Tag name
     */
    public var tagName(get, never):String;

    function get_tagName():String {
        return tree.getTagNameById(tagId);
    }

	/**
	 * Child node
	 */
	public var child(get, never):HtmlNode;

	function get_child():HtmlNode {
		var native = NativeHtmlApi.html_node_child(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Last child node
	 */
	public var lastChild(get, never):HtmlNode;

	function get_lastChild():HtmlNode {
		var native = NativeHtmlApi.html_node_last_child(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Next node
	 */
	public var next(get, never):HtmlNode;

	function get_next():HtmlNode {
		var native = NativeHtmlApi.html_node_next(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
	}

	/**
	 * Prev node
	 */
	public var prev(get, never):HtmlNode;

	function get_prev():HtmlNode {
		var native = NativeHtmlApi.html_node_prev(nativeNode);
		if (native == null)
			return null;
		return HtmlNode.fromNative(native, tree);
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
	 * All childs
	 */
	public var childs(get, never):Iterable<HtmlNode>;

	function get_childs():Iterable<HtmlNode> {
		return {
			iterator: () -> new ChildNodeIterator(this)
		}
	}

	/**
	 * Constructor
	 */
	public function new(tree:HtmlTree) {
        this.tree = tree;
    }

	/**
	 * Find nodes by css selectors
	 * @param data
	 * @return Array<HtmlNode>
	 */
	public function findByCss(data:String):NodeCollection {
		var len = 0;
		var bytes = @:privateAccess data.bytes.utf16ToUtf8(0, len);
		var nativeCollection = NativeHtmlApi.html_find_by_css(nativeNode, bytes, len);
		var res = NodeCollection.fromNative(nativeCollection, tree);
		return res;
	}

	/**
	 * Return nodes by tag id
	 * @param tagId
	 * @return NodeCollection
	 */
	public function getNodesByTagId(tagId:HtmlTagId):NodeCollection {
		var native = NativeHtmlApi.html_get_nodes_by_tagid(nativeNode, tagId);
		if (native == null)
			return null;

		var res = NodeCollection.fromNative(native, tree);
		return res;
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
	 * Get inner text
	 */
	public function getInnerText(delimiter:String = " "):String {
		var nodes = getNodesByTagId(TAG__TEXT);
		return nodes.map(x -> x.text).join(delimiter);
	}
}
