package octopus.native;

@:unreflective
@:native("myhtml_options")
extern class MyHtmlOptionsImpl {}

@:unreflective
@:enum
@:include("myhtml/myhtml.h")
extern abstract MyHtmlOptions(MyHtmlOptionsImpl) {
	@:native("MyHTML_OPTIONS_DEFAULT") var MyHTML_OPTIONS_DEFAULT;
	@:native("MyHTML_OPTIONS_PARSE_MODE_SINGLE") var MyHTML_OPTIONS_PARSE_MODE_SINGLE;
	@:native("MyHTML_OPTIONS_PARSE_MODE_ALL_IN_ONE") var MyHTML_OPTIONS_PARSE_MODE_ALL_IN_ONE;
	@:native("MyHTML_OPTIONS_PARSE_MODE_SEPARATELY") var MyHTML_OPTIONS_PARSE_MODE_SEPARATELY;
}