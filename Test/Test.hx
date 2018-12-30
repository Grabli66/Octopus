import core.html.HtmlTagId;
import haxe.Http;
import core.html.HtmlParser;
using Lambda;

class Test {
	public static function main() {
		var parser = new HtmlParser();
		var client = new Http("https://zebra-tv.ru/novosti/");
		client.onData = (data) -> {
			var tree = parser.parse(data);
			var nodes = tree.findByCss("div.news");
			trace(nodes.length);
			for (node in nodes) {
				var titleNode = node.findByCss("a.tlt").toArray()[0];
				trace(titleNode.getInnerText());
			}
		};
		client.request();

		// <div>
		// 	 <p>Good</p>
		// 	 <p>Shit</p>
		// 	 <span>
		// 		<p>Fuck</p>
		// 	 </span>
		// </div>

		// var data = "<div><p>Good</p><p>Shit</p><span><p>Fuck</p></span></div>";
		// var parser = new HtmlParser();
		// var tree = parser.parse(data);
		// var nodes = tree.getNodesByTagName("p");
		// trace('Node count: ${nodes.length}');
	}
}
