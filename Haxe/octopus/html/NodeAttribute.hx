package octopus.html;

import octopus.html.NativeHtml.NativeHtmlApi;
import octopus.html.NativeHtml.NativeAttribute;
/**
 * Attribute with key and value
 */
class NodeAttribute {
    /**
     * Native attribute
     */
    var nativeAttribute:NativeAttribute;

    public var value(get, never):String;

    function get_value():String {
        var bytes = NativeHtmlApi.html_get_attribute_value(nativeAttribute);
        if (bytes == null)
            return null;
        var text = @:privateAccess String.fromUTF8(bytes);
        return text;
    }

    /**
     * Create attribute from native
     */
    @:allow(octopus.html.HtmlNode)
    static function fromNative(native:NativeAttribute):NodeAttribute {
        var res = new NodeAttribute();
        res.nativeAttribute = native;
        return res;
    }

    /**
     * Constructor
     */
    private function new() {}
}