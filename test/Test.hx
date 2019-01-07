import octopus.HtmlParser;
using Lambda;

class Test {
    public static function main() {
        var text = '<div><p>Хорошо</p><p data-rf="Аттрибут">World</p><span><p>Hello</p></span></div>';
        
        var htmlParser = new HtmlParser();
        var tree = htmlParser.parse(text);
        var nodes = tree.findByCss("p");

        for (node in nodes) {
            trace(node.getAttributeValue("data-rf"));
        }
    }
}