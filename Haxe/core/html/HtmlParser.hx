package core.html;

import core.html.NativeHtml.NativeHtmlApi;

/**
 * Html parser
 */
class HtmlParser {
    /**
     * Native html ctx
     */
    var htmlCtx:NativeHtml;

    /**
     * Constructor
     */
    public function new() {
        htmlCtx = NativeHtmlApi.html_create_ctx();
    }

    /**
     * Parse html string
     * @param data 
     */
    public function parse(data:String):HtmlTree {
        var len = 0;
        var bytes = @:privateAccess data.bytes.utf16ToUtf8(0, len);
        var nativeTree = NativeHtmlApi.html_parse_string(htmlCtx, bytes, len);
        return HtmlTree.fromNative(nativeTree);
    }
}