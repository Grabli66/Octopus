package octopus.native;

@:unreflective
@:native("myencoding_t")
extern class MyEncodingImpl {}

@:unreflective
@:enum
@:include("myhtml/myhtml.h")
extern abstract MyEncoding(MyEncodingImpl) {
	@:native("MyENCODING_DEFAULT") var MyENCODING_DEFAULT;
	@:native("MyENCODING_NOT_DETERMINED") var MyENCODING_NOT_DETERMINED;
	@:native("MyENCODING_UTF_8") var MyENCODING_UTF_8;
	@:native("MyENCODING_UTF_16LE") var MyENCODING_UTF_16LE;
	@:native("MyENCODING_UTF_16BE") var MyENCODING_UTF_16BE;
}