package octopus;

import octopus.native.NativeApi.MyHtmlCollection;
import cpp.Pointer;

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
 * Collection of nodes
 */
class NodeCollection {
	/**
	 * Native collection
	 */
	var nativeCollection:Pointer<MyHtmlCollection>;

	/**
	 * Parent tree
	 */
	final tree:HtmlTree;

	/**
	 * Length of collection
	 */
	public var length(get, null):Int;

	function get_length():Int {
		return nativeCollection.ptr.length;
	}

	/**
	 * Create from native collection
	 * @param native
	 */
	@:allow(octopus.HtmlNode)
	static function fromNative(native:Pointer<MyHtmlCollection>, tree:HtmlTree) {
		var res = new NodeCollection(tree);
		res.nativeCollection = native;
		return res;
	}

	/**
	 * Private constructor
	 */
	function new(tree:HtmlTree) {
		this.tree = tree;
	}

	/**
	 * Return node by index
	 */
	public inline function get(idx:Int) {
		var native = nativeCollection.ptr.list[idx];
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
}
