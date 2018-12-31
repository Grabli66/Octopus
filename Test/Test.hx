import octopus.html.HtmlParser;

class Test {
	public static function main() {
		var data = '<div><p>Hello</p><p data-rf="GOOD">World</p><span><p>Hello</p></span></div>';
		var parser = new HtmlParser();
		var tree = parser.parse(data);
		var nodes = tree.getNodesByTagName("p");
		trace('Node count: ${nodes.length}');
		for (node in nodes) {
			trace(node.getAttributeValue("data-rf"));
		}
	}
}
