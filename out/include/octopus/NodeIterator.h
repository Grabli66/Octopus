// Generated by Haxe 4.0.0-preview.5+7eb789f
#ifndef INCLUDED_octopus_NodeIterator
#define INCLUDED_octopus_NodeIterator

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(octopus,HtmlNode)
HX_DECLARE_CLASS1(octopus,NodeIterator)

namespace octopus{


class HXCPP_CLASS_ATTRIBUTES NodeIterator_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef NodeIterator_obj OBJ_;
		NodeIterator_obj();

	public:
		enum { _hx_ClassId = 0x3b7ccbcf };

		void __construct( ::octopus::HtmlNode root);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="octopus.NodeIterator")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"octopus.NodeIterator"); }
		static hx::ObjectPtr< NodeIterator_obj > __new( ::octopus::HtmlNode root);
		static hx::ObjectPtr< NodeIterator_obj > __alloc(hx::Ctx *_hx_ctx, ::octopus::HtmlNode root);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~NodeIterator_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("NodeIterator",30,2e,65,ac); }

		::Array< ::Dynamic> stack;
		 ::octopus::HtmlNode current;
		bool hasNext();
		::Dynamic hasNext_dyn();

		 ::octopus::HtmlNode next();
		::Dynamic next_dyn();

};

} // end namespace octopus

#endif /* INCLUDED_octopus_NodeIterator */ 