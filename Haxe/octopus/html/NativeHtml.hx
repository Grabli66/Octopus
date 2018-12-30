package octopus.html;

/**
 * Native html ctx
 */
typedef NativeHtml = hl.Abstract<"HtmlCtx">;

/**
 * Native html tree
 */
typedef NativeHtmlTree = hl.Abstract<"HtmlTree">;

/**
 * Native html tree node
 */
typedef NativeHtmlTreeNode = hl.Abstract<"html_tree_node">;

/**
 * Native html tree
 */
typedef NativeCollection = hl.Abstract<"NodeCollection">;

/**
 * Native html api
 */
@:hlNative("octopus")
class NativeHtmlApi {
    /**
     * Create html ctx
     * @return NativeHtmlCtx
     */
    public static function html_create_ctx():NativeHtml {
        return null;
    }

    /**
     * Parse html to tree
     * @return NativeHtmlCtx
     */
    public static function html_parse_string(ctx:NativeHtml, data:hl.Bytes, len:Int):NativeHtmlTree {
        return null;
    }

    /**
     * Return tree html node
     * @param ctx 
     */
    public static function html_get_tree_html_node(ctx:NativeHtmlTree):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Return tag name by tag id
     */
    public static function html_get_tagname_by_tagid(ctx:NativeHtmlTree,tagId:Int):hl.Bytes {
        return null;
    }

    /**
     * Return tag id by tag name
     */
    public static function html_get_tagid_by_tagname(ctx:NativeHtmlTree,tagName:hl.Bytes, len:Int):Int {
        return 0;
    }

    /**
     * Find nodes by css selectors and return collection
     */
    public static function html_find_by_css(node:NativeHtmlTreeNode, data:hl.Bytes, len:Int):NativeCollection {
        return null;
    }

    /**
     * Get nodes by tag id
     * @return NativeCollection
     */
    public static function html_get_nodes_by_tagid(node:NativeHtmlTreeNode, tagId:Int):NativeCollection {
        return null;
    }

    /**
     * Return node child
     */
    public static function html_node_child(node:NativeHtmlTreeNode):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Return node last child
     */
    public static function html_node_last_child(node:NativeHtmlTreeNode):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Return node next
     */
    public static function html_node_next(node:NativeHtmlTreeNode):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Return node prev
     */
    public static function html_node_prev(node:NativeHtmlTreeNode):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Return node tag id
     */
    public static function html_get_node_tag(node:NativeHtmlTreeNode):Int {
        return 0;
    }

    /**
     * Return collection length
     * @param col 
     * @return Int
     */
    public static function html_get_collection_length(col:NativeCollection):Int {
        return 0;
    }

    /**
     * Return node from collection by index
     * @param col 
     * @return Int
     */
    public static function html_get_node_from_collection(col:NativeCollection, idx:Int):NativeHtmlTreeNode {
        return null;
    }

    /**
     * Get node text
     * @param col 
     * @return hl.Bytes
     */
    public static function html_get_node_text(col:NativeHtmlTreeNode):hl.Bytes {
        return null;
    }
}