// Generated by Haxe 4.0.0-preview.5+7eb789f
#include <hxcpp.h>

#ifndef INCLUDED_octopus_ChildNodeIterator
#include <octopus/ChildNodeIterator.h>
#endif
#ifndef INCLUDED_octopus_HtmlNode
#include <octopus/HtmlNode.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_af1e60afc922e9f9_29_new,"octopus.ChildNodeIterator","new",0xa2fa978f,"octopus.ChildNodeIterator.new","octopus/HtmlNode.hx",29,0xc7160901)
HX_LOCAL_STACK_FRAME(_hx_pos_af1e60afc922e9f9_35_hasNext,"octopus.ChildNodeIterator","hasNext",0xd332301c,"octopus.ChildNodeIterator.hasNext","octopus/HtmlNode.hx",35,0xc7160901)
HX_LOCAL_STACK_FRAME(_hx_pos_af1e60afc922e9f9_44_next,"octopus.ChildNodeIterator","next",0xf84a06e4,"octopus.ChildNodeIterator.next","octopus/HtmlNode.hx",44,0xc7160901)
namespace octopus{

void ChildNodeIterator_obj::__construct( ::octopus::HtmlNode root){
            	HX_STACKFRAME(&_hx_pos_af1e60afc922e9f9_29_new)
HXDLIN(  29)		this->root = root;
            	}

Dynamic ChildNodeIterator_obj::__CreateEmpty() { return new ChildNodeIterator_obj; }

void *ChildNodeIterator_obj::_hx_vtable = 0;

Dynamic ChildNodeIterator_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< ChildNodeIterator_obj > _hx_result = new ChildNodeIterator_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool ChildNodeIterator_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x513833ad;
}

bool ChildNodeIterator_obj::hasNext(){
            	HX_STACKFRAME(&_hx_pos_af1e60afc922e9f9_35_hasNext)
HXLINE(  36)		 ::octopus::HtmlNode _hx_tmp;
HXDLIN(  36)		if (hx::IsNull( this->nextNode )) {
HXLINE(  36)			_hx_tmp = (this->nextNode = this->root->get_child());
            		}
            		else {
HXLINE(  36)			_hx_tmp = (this->nextNode = this->nextNode->get_next());
            		}
HXDLIN(  36)		this->nextNode = _hx_tmp;
HXLINE(  37)		if (hx::IsNull( this->nextNode )) {
HXLINE(  37)			return false;
            		}
            		else {
HXLINE(  37)			return true;
            		}
HXDLIN(  37)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC0(ChildNodeIterator_obj,hasNext,return )

 ::octopus::HtmlNode ChildNodeIterator_obj::next(){
            	HX_STACKFRAME(&_hx_pos_af1e60afc922e9f9_44_next)
HXDLIN(  44)		return this->nextNode;
            	}


HX_DEFINE_DYNAMIC_FUNC0(ChildNodeIterator_obj,next,return )


hx::ObjectPtr< ChildNodeIterator_obj > ChildNodeIterator_obj::__new( ::octopus::HtmlNode root) {
	hx::ObjectPtr< ChildNodeIterator_obj > __this = new ChildNodeIterator_obj();
	__this->__construct(root);
	return __this;
}

hx::ObjectPtr< ChildNodeIterator_obj > ChildNodeIterator_obj::__alloc(hx::Ctx *_hx_ctx, ::octopus::HtmlNode root) {
	ChildNodeIterator_obj *__this = (ChildNodeIterator_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(ChildNodeIterator_obj), true, "octopus.ChildNodeIterator"));
	*(void **)__this = ChildNodeIterator_obj::_hx_vtable;
	__this->__construct(root);
	return __this;
}

ChildNodeIterator_obj::ChildNodeIterator_obj()
{
}

void ChildNodeIterator_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(ChildNodeIterator);
	HX_MARK_MEMBER_NAME(root,"root");
	HX_MARK_MEMBER_NAME(nextNode,"nextNode");
	HX_MARK_END_CLASS();
}

void ChildNodeIterator_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(root,"root");
	HX_VISIT_MEMBER_NAME(nextNode,"nextNode");
}

hx::Val ChildNodeIterator_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"root") ) { return hx::Val( root ); }
		if (HX_FIELD_EQ(inName,"next") ) { return hx::Val( next_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { return hx::Val( hasNext_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"nextNode") ) { return hx::Val( nextNode ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val ChildNodeIterator_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"root") ) { root=inValue.Cast<  ::octopus::HtmlNode >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"nextNode") ) { nextNode=inValue.Cast<  ::octopus::HtmlNode >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void ChildNodeIterator_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("root",22,ee,ae,4b));
	outFields->push(HX_("nextNode",95,b0,d6,f4));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static hx::StorageInfo ChildNodeIterator_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*  ::octopus::HtmlNode */ ,(int)offsetof(ChildNodeIterator_obj,root),HX_("root",22,ee,ae,4b)},
	{hx::fsObject /*  ::octopus::HtmlNode */ ,(int)offsetof(ChildNodeIterator_obj,nextNode),HX_("nextNode",95,b0,d6,f4)},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *ChildNodeIterator_obj_sStaticStorageInfo = 0;
#endif

static ::String ChildNodeIterator_obj_sMemberFields[] = {
	HX_("root",22,ee,ae,4b),
	HX_("nextNode",95,b0,d6,f4),
	HX_("hasNext",6d,a5,46,18),
	HX_("next",f3,84,02,49),
	::String(null()) };

hx::Class ChildNodeIterator_obj::__mClass;

void ChildNodeIterator_obj::__register()
{
	ChildNodeIterator_obj _hx_dummy;
	ChildNodeIterator_obj::_hx_vtable = *(void **)&_hx_dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_("octopus.ChildNodeIterator",1d,24,be,ad);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(ChildNodeIterator_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< ChildNodeIterator_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ChildNodeIterator_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ChildNodeIterator_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace octopus
