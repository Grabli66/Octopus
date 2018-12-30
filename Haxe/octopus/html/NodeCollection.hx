package octopus.html;

import octopus.html.NativeHtml.NativeHtmlApi;
import octopus.html.NativeHtml.NativeCollection;

/**
 * Node collection iterator
 */
class NodeCollectionIterator {
	/**
	 * Collection
	 */
	var collection:NodeCollection;

	/**
	 * Current position in collection
	 */
	var currentPos = 0;

	/**
	 * Constructor
	 * @param collection
	 */
	public function new(collection:NodeCollection) {
		this.collection = collection;
	}

	/**
	 * Has next node
	 */
	public function hasNext():Bool {
        return currentPos < collection.length;
    }

	/**
	 * Next node
	 */
	public function next():HtmlNode {
		return collection.get(currentPos++);
	}
}

/**
 * Node collection
 */
class NodeCollection {
	/**
	 * Native collection
	 */
	var nativeCollection:NativeCollection;

	/**
	 * Parent tree
	 */
	final tree:HtmlTree;

	/**
	 * Length of collection
	 */
	public var length(get, null):Int;

    function get_length():Int {
        return NativeHtmlApi.html_get_collection_length(nativeCollection);
    }

	/**
	 * Create from native collection
	 * @param native
	 */
    @:allow(octopus.html.HtmlNode)
	static function fromNative(native:NativeCollection, tree:HtmlTree) {
		var res = new NodeCollection(tree);
		res.nativeCollection = native;
		return res;
	}

	/**
	 * Constructor
	 */
	function new(tree:HtmlTree) {
		this.tree = tree;
	}

	/**
	 * Return node by index
	 */
	public inline function get(idx:Int) {
        var native = NativeHtmlApi.html_get_node_from_collection(nativeCollection, idx);
        if (native == null)
            return null;
        var res = HtmlNode.fromNative(native, tree);
		return res;
	}

	/**
	 * [Description]
	 * @return Iterator<HtmlNode>
	 */
	public function iterator():Iterator<HtmlNode> {
        return new NodeCollectionIterator(this);
    }

    /**
     * To array
     * @return Array<HtmlNode>
     */
    public function toArray():Array<HtmlNode> {
        return [for (n in this) n];
    }
}
