package octopus;

import cpp.SizeT;
import cpp.RawPointer;
import octopus.native.NativeApi;
import octopus.native.MyHtmlTagId;

/**
 * Tree of HtmlNodes
 */
class HtmlTree {
    /**
     * Native tree
     */
    @:allow(octopus.HtmlNode)
    var nativeTree:RawPointer<MyHtmlTree>;

	/**
	 * Root html node
	 */
	public var htmlNode(get, never):HtmlNode;

	function get_htmlNode():HtmlNode {
		var native = NativeApi.myhtml_tree_get_node_html(nativeTree);
		return HtmlNode.fromNative(native, this);
	}

    /**
	 * Create from native node
	 */
    @:allow(octopus.HtmlParser)
	static function fromNative(native:RawPointer<MyHtmlTree>) {
		var res = new HtmlTree();
		res.nativeTree = native;
		return res;
	}

    /**
     * Private constructor
     */
    function new() {}

    /**
	 * Return tag id by tag name
	 * @param name
	 * @return HtmlTagId
	 */
	public function getTagIdByName(name:String):MyHtmlTagId {
		var tagId = NativeApi.myhtml_tag_id_by_name(nativeTree, name, name.length);
		return tagId;
	}

    /**
	 * Return nodes by tag id
	 * @param tagId
	 * @return NodeCollection
	 */
	public function getNodesByTagId(tagId:MyHtmlTagId):NodeCollection {
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

	/**
	 * Find nodes by css selectors
	 */
	public function findByCss(selectors:String):NodeCollection {
		return htmlNode.findByCss(selectors);
	}
}