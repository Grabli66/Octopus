package core.html;

import core.html.HtmlNode.NodeIterator;
import core.html.NativeHtml.NativeHtmlApi;
import core.html.NativeHtml.NativeHtmlTree;

/**
 * Html tree with nodes
 */
class HtmlTree {
	/**
	 * Native html tree
	 */
	var nativeTree:NativeHtmlTree;

	/**
	 * Create tree from native
	 * @param native
	 */
	@:allow(core.html.HtmlParser)
	static function fromNative(native:NativeHtmlTree):HtmlTree {
		var res = new HtmlTree();
		res.nativeTree = native;
		return res;
	}

	// Root html node
	public var htmlNode(get, never):HtmlNode;

	function get_htmlNode():HtmlNode {
		var native = NativeHtmlApi.html_get_tree_html_node(nativeTree);
		return HtmlNode.fromNative(native, this);
	}

	/**
	 * All nodes
	 */
	public var nodes(get, never):Iterable<HtmlNode>;

	function get_nodes():Iterable<HtmlNode> {
		return htmlNode.nodes;
	}

	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Return tag name by tag id
	 * @param tagId
	 */
	public function getTagNameById(tagId:HtmlTagId) {
		var bytes = NativeHtmlApi.html_get_tagname_by_tagid(nativeTree, tagId);
		if (bytes == null)
			return null;
		var text = @:privateAccess String.fromUTF8(bytes);
		return text;
	}

	/**
	 * Return tag id by tag name
	 * @param name
	 * @return HtmlTagId
	 */
	public function getTagIdByName(name:String):HtmlTagId {
		var len = 0;
		var bytes = @:privateAccess name.bytes.utf16ToUtf8(0, len);
		var tagId = NativeHtmlApi.html_get_tagid_by_tagname(nativeTree, bytes, len);
		return tagId;
	}

	/**
	 * Find nodes by css selectors
	 */
	public function findByCss(data:String):NodeCollection {
		if (htmlNode == null)
			return null;

		return htmlNode.findByCss(data);
	}

	/**
	 * Return nodes by tag id
	 * @param tagId
	 * @return NodeCollection
	 */
	public function getNodesByTagId(tagId:HtmlTagId):NodeCollection {
		return htmlNode.getNodesByTagId(tagId);
	}

	/**
	 * Return nodes by tag name
	 * @param name
	 * @return NodeCollection
	 */
	public function getNodesByTagName(name:String):NodeCollection {
		return htmlNode.getNodesByTagName(name);
	}
}
