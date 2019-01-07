package octopus;

import octopus.native.NativeApi;

/**
 * Parser of html
 */
class HtmlParser {
	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Parse html text to HtmlTree
	 * @return HtmlTree
	 */
	public function parse(text:String):HtmlTree {
        // TODO: free resources
		var myhtml = NativeApi.myhtml_create();
		var status = NativeApi.myhtml_init(myhtml, MyHTML_OPTIONS_DEFAULT, 1, 0);
		var tree = NativeApi.myhtml_tree_create();
		status = NativeApi.myhtml_tree_init(tree, myhtml);
		status = NativeApi.myhtml_parse(tree, MyENCODING_UTF_8, text, text.length);
		return HtmlTree.fromNative(tree);
	}
}
