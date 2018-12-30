import hl.Bytes;

private typedef HtmlTree = hl.Abstract<"html_tree">;

@:hlNative("core")
class Core {
    @:hlNative("core", "html_parse")
    public static function html_parse(data:Bytes, len:Int):HtmlTree {
        return null;
    }
}