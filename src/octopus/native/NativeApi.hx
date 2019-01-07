package octopus.native;

import cpp.Pointer;
import cpp.SizeT;
import cpp.ConstCharStar;
import octopus.native.Include;
import cpp.RawPointer;

@:native("mystatus_t")
@:include("myhtml/myhtml.h")
extern class MyStatus {}

@:native("myhtml_t")
@:include("myhtml/myhtml.h")
extern class MyHtml {}

@:native("myhtml_tree_t")
@:include("myhtml/myhtml.h")
extern class MyHtmlTree {}

@:native("myhtml_tree_node_t")
@:include("myhtml/myhtml.h")
extern class MyHtmlTreeNode {}

@:native("myhtml_tree_attr_t")
@:include("myhtml/myhtml.h")
extern class MyHtmlTreeAttr {}

@:native("myhtml_collection_t")
@:include("myhtml/myhtml.h")
extern class MyHtmlCollection {
	public var list:RawPointer<RawPointer<MyHtmlTreeNode>>;
	public var size:Int;
	public var length:Int;
}

@:native("mycss_t")
@:include("mycss/mycss.h")
extern class MyCss {}

@:native("mycss_entry_t")
@:include("mycss/mycss.h")
extern class MyCssEntry {}

@:native("mycss_selectors_t")
@:include("mycss/selectors/init.h")
extern class MyCssSelectors {}

@:native("mycss_selectors_list_t")
@:include("mycss/selectors/init.h")
extern class MyCssSelectorsList {}

@:native("modest_finder_t")
@:include("modest/finder/finder.h")
extern class ModestFinder {}

@:include("myhtml/myhtml.h")
@:include("mycss/mycss.h")
@:include("modest/finder/finder.h")
@:include("ycss/selectors/init.h")
@:native("NativeApi")
extern class NativeApi {
	@:native("myhtml_create")
	public static function myhtml_create():RawPointer<MyHtml>;
	@:native("myhtml_init")
	public static function myhtml_init(myhtml:RawPointer<MyHtml>, opt:MyHtmlOptions, thread_count:Int, queue_size:Int):MyStatus;
	@:native("myhtml_tree_create")
	public static function myhtml_tree_create():RawPointer<MyHtmlTree>;
	@:native("myhtml_tree_init")
	public static function myhtml_tree_init(tree:RawPointer<MyHtmlTree>, myhtml:RawPointer<MyHtml>):MyStatus;
	@:native("myhtml_parse")
	public static function myhtml_parse(tree:RawPointer<MyHtmlTree>, encoding:MyEncoding, html:ConstCharStar, len:Int):MyStatus;
	
	// Tree
	@:native("myhtml_tree_get_node_html")
	public static function myhtml_tree_get_node_html(tree:RawPointer<MyHtmlTree>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_get_nodes_by_tag_id_in_scope")
	public static function myhtml_get_nodes_by_tag_id_in_scope(tree:RawPointer<MyHtmlTree>, collection:RawPointer<MyHtmlCollection>,
		node:RawPointer<MyHtmlTreeNode>, tag_id:MyHtmlTagId, status:RawPointer<MyStatus>):RawPointer<MyHtmlCollection>;
	@:native("myhtml_tag_name_by_id")
	public static function myhtml_tag_name_by_id(tree:RawPointer<MyHtmlTree>, tag_id:MyHtmlTagId, length:RawPointer<SizeT>):ConstCharStar;
	@:native("myhtml_tag_id_by_name")
	public static function myhtml_tag_id_by_name(tree:RawPointer<MyHtmlTree>, tag_name:ConstCharStar, length:SizeT):MyHtmlTagId;

	// Node
	@:native("myhtml_node_tag_id")
	public static function myhtml_node_tag_id(node:RawPointer<MyHtmlTreeNode>):MyHtmlTagId;
	@:native("myhtml_node_next")
	public static function myhtml_node_next(node:RawPointer<MyHtmlTreeNode>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_node_prev")
	public static function myhtml_node_prev(node:RawPointer<MyHtmlTreeNode>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_node_parent")
	public static function myhtml_node_parent(node:RawPointer<MyHtmlTreeNode>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_node_child")
	public static function myhtml_node_child(node:RawPointer<MyHtmlTreeNode>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_node_last_child")
	public static function myhtml_node_last_child(node:RawPointer<MyHtmlTreeNode>):RawPointer<MyHtmlTreeNode>;
	@:native("myhtml_node_text")
	public static function myhtml_node_text(node:RawPointer<MyHtmlTreeNode>, length:RawPointer<SizeT>):ConstCharStar;
	@:native("myhtml_attribute_by_key")
	public static function myhtml_attribute_by_key(node:RawPointer<MyHtmlTreeNode>, key:ConstCharStar, length:SizeT):RawPointer<MyHtmlTreeAttr>;

	// Attribute
	@:native("myhtml_attribute_value")
	public static function myhtml_attribute_value(attr:RawPointer<MyHtmlTreeAttr>, length:RawPointer<SizeT>):ConstCharStar;

	// Mycss
	@:native("mycss_create")
	public static function mycss_create():RawPointer<MyCss>;
	@:native("mycss_init")
	public static function mycss_init(mycss:RawPointer<MyCss>):MyStatus;
	@:native("mycss_entry_create")
	public static function mycss_entry_create():RawPointer<MyCssEntry>;
	@:native("mycss_entry_init")
	public static function mycss_entry_init(mycss:RawPointer<MyCss>, entry:RawPointer<MyCssEntry>):MyStatus;
	@:native("mycss_entry_selectors")
	public static function mycss_entry_selectors(entry:RawPointer<MyCssEntry>):RawPointer<MyCssSelectors>;
	@:native("mycss_selectors_parse")
	public static function mycss_selectors_parse(selectors:RawPointer<MyCssSelectors>, encoding:MyEncoding, data:ConstCharStar, data_size:SizeT, status:RawPointer<MyStatus>):RawPointer<MyCssSelectorsList>;
	@:native("mycss_selectors_list_destroy")
	public static function mycss_selectors_list_destroy(selectors:RawPointer<MyCssSelectors>, selector_list:RawPointer<MyCssSelectorsList>, self_destroy:Bool):RawPointer<MyCssSelectorsList>;
	@:native("mycss_entry_destroy")
	public static function mycss_entry_destroy(entry:RawPointer<MyCssEntry>, self_destroy:Bool):RawPointer<MyCssEntry>;
	@:native("mycss_destroy")
	public static function mycss_destroy(mycss:RawPointer<MyCss>, self_destroy:Bool):RawPointer<MyCss>;

	// Modest
	@:native("modest_finder_create_simple")
	public static function modest_finder_create_simple():RawPointer<ModestFinder>;
	@:native("modest_finder_by_selectors_list")
	public static function modest_finder_by_selectors_list(finder:RawPointer<ModestFinder>, scope_node:RawPointer<MyHtmlTreeNode>, selector_list:RawPointer<MyCssSelectorsList>, collection:RawPointer<RawPointer<MyHtmlCollection>>):MyStatus;
	@:native("modest_finder_destroy")
	public static function modest_finder_destroy(finder:RawPointer<ModestFinder>, self_destroy:Bool):RawPointer<ModestFinder>;

}
