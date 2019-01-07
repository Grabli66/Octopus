package octopus;

import octopus.native.NativeApi;
import octopus.native.NativeApi.MyHtmlTreeAttr;
import cpp.RawPointer;

/**
 * Attribute with key and value
 */
class NodeAttribute {
    /**
     * Native attribute
     */
    var nativeAttribute:RawPointer<MyHtmlTreeAttr>;

    public var value(get, never):String;

    function get_value():String {
        var bytes = NativeApi.myhtml_attribute_value(nativeAttribute, null);
        if (bytes == null)
            return null;
        return bytes.toString();
    }

    /**
     * Create attribute from native
     */
    @:allow(octopus.HtmlNode)
    static function fromNative(native:RawPointer<MyHtmlTreeAttr>):NodeAttribute {
        var res = new NodeAttribute();
        res.nativeAttribute = native;
        return res;
    }

    /**
     * Constructor
     */
    private function new() {}
}