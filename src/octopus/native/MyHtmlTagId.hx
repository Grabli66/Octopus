package octopus.native;

@:unreflective
@:native("myhtml_tag_id_t")
extern class MyHtmlTagIdImpl {}

/**
 * Html tag id
 */
@:unreflective
@:enum
@:include("myhtml/myhtml.h")
extern abstract MyHtmlTagId(MyHtmlTagIdImpl) {
	@:native("MyHTML_TAG__UNDEF") var MyHTML_TAG__UNDEF;
	@:native("MyHTML_TAG__TEXT") var MyHTML_TAG__TEXT;
	@:native("MyHTML_TAG__COMMENT") var MyHTML_TAG__COMMENT;
	@:native("MyHTML_TAG__DOCTYPE") var MyHTML_TAG__DOCTYPE;
	@:native("MyHTML_TAG_A") var MyHTML_TAG_A;
	@:native("MyHTML_TAG_ABBR") var MyHTML_TAG_ABBR;
	@:native("MyHTML_TAG_ACRONYM") var MyHTML_TAG_ACRONYM;
	@:native("MyHTML_TAG_ADDRESS") var MyHTML_TAG_ADDRESS;
	@:native("MyHTML_TAG_ANNOTATION_XML") var MyHTML_TAG_ANNOTATION_XML;
	@:native("MyHTML_TAG_APPLET") var MyHTML_TAG_APPLET;
	@:native("MyHTML_TAG_AREA") var MyHTML_TAG_AREA;
	@:native("MyHTML_TAG_ARTICLE") var MyHTML_TAG_ARTICLE;
	@:native("MyHTML_TAG_ASIDE") var MyHTML_TAG_ASIDE;
	@:native("MyHTML_TAG_AUDIO") var MyHTML_TAG_AUDIO;
	@:native("MyHTML_TAG_B") var MyHTML_TAG_B;
	@:native("MyHTML_TAG_BASE") var MyHTML_TAG_BASE;
	@:native("MyHTML_TAG_BASEFONT") var MyHTML_TAG_BASEFONT;
	@:native("MyHTML_TAG_BDI") var MyHTML_TAG_BDI;
	@:native("MyHTML_TAG_BDO") var MyHTML_TAG_BDO;
	@:native("MyHTML_TAG_BGSOUND") var MyHTML_TAG_BGSOUND;
	@:native("MyHTML_TAG_BIG") var MyHTML_TAG_BIG;
	@:native("MyHTML_TAG_BLINK") var MyHTML_TAG_BLINK;
	@:native("MyHTML_TAG_BLOCKQUOTE") var MyHTML_TAG_BLOCKQUOTE;
	@:native("MyHTML_TAG_BODY") var MyHTML_TAG_BODY;
	@:native("MyHTML_TAG_BR") var MyHTML_TAG_BR;
	@:native("MyHTML_TAG_BUTTON") var MyHTML_TAG_BUTTON;
	@:native("MyHTML_TAG_CANVAS") var MyHTML_TAG_CANVAS;
	@:native("MyHTML_TAG_CAPTION") var MyHTML_TAG_CAPTION;
	@:native("MyHTML_TAG_CENTER") var MyHTML_TAG_CENTER;
	@:native("MyHTML_TAG_CITE") var MyHTML_TAG_CITE;
	@:native("MyHTML_TAG_CODE") var MyHTML_TAG_CODE;
	@:native("MyHTML_TAG_COL") var MyHTML_TAG_COL;
	@:native("MyHTML_TAG_COLGROUP") var MyHTML_TAG_COLGROUP;
	@:native("MyHTML_TAG_COMMAND") var MyHTML_TAG_COMMAND;
	@:native("MyHTML_TAG_COMMENT") var MyHTML_TAG_COMMENT;
	@:native("MyHTML_TAG_DATALIST") var MyHTML_TAG_DATALIST;
	@:native("MyHTML_TAG_DD") var MyHTML_TAG_DD;
	@:native("MyHTML_TAG_DEL") var MyHTML_TAG_DEL;
	@:native("MyHTML_TAG_DETAILS") var MyHTML_TAG_DETAILS;
	@:native("MyHTML_TAG_DFN") var MyHTML_TAG_DFN;
	@:native("MyHTML_TAG_DIALOG") var MyHTML_TAG_DIALOG;
	@:native("MyHTML_TAG_DIR") var MyHTML_TAG_DIR;
	@:native("MyHTML_TAG_DIV") var MyHTML_TAG_DIV;
	@:native("MyHTML_TAG_DL") var MyHTML_TAG_DL;
	@:native("MyHTML_TAG_DT") var MyHTML_TAG_DT;
	@:native("MyHTML_TAG_EM") var MyHTML_TAG_EM;
	@:native("MyHTML_TAG_EMBED") var MyHTML_TAG_EMBED;
	@:native("MyHTML_TAG_FIELDSET") var MyHTML_TAG_FIELDSET;
	@:native("MyHTML_TAG_FIGCAPTION") var MyHTML_TAG_FIGCAPTION;
	@:native("MyHTML_TAG_FIGURE") var MyHTML_TAG_FIGURE;
	@:native("MyHTML_TAG_FONT") var MyHTML_TAG_FONT;
	@:native("MyHTML_TAG_FOOTER") var MyHTML_TAG_FOOTER;
	@:native("MyHTML_TAG_FORM") var MyHTML_TAG_FORM;
	@:native("MyHTML_TAG_FRAME") var MyHTML_TAG_FRAME;
	@:native("MyHTML_TAG_FRAMESET") var MyHTML_TAG_FRAMESET;
	@:native("MyHTML_TAG_H1") var MyHTML_TAG_H1;
	@:native("MyHTML_TAG_H2") var MyHTML_TAG_H2;
	@:native("MyHTML_TAG_H3") var MyHTML_TAG_H3;
	@:native("MyHTML_TAG_H4") var MyHTML_TAG_H4;
	@:native("MyHTML_TAG_H5") var MyHTML_TAG_H5;
	@:native("MyHTML_TAG_H6") var MyHTML_TAG_H6;
	@:native("MyHTML_TAG_HEAD") var MyHTML_TAG_HEAD;
	@:native("MyHTML_TAG_HEADER") var MyHTML_TAG_HEADER;
	@:native("MyHTML_TAG_HGROUP") var MyHTML_TAG_HGROUP;
	@:native("MyHTML_TAG_HR") var MyHTML_TAG_HR;
	@:native("MyHTML_TAG_HTML") var MyHTML_TAG_HTML;
	@:native("MyHTML_TAG_I") var MyHTML_TAG_I;
	@:native("MyHTML_TAG_IFRAME") var MyHTML_TAG_IFRAME;
	@:native("MyHTML_TAG_IMAGE") var MyHTML_TAG_IMAGE;
	@:native("MyHTML_TAG_IMG") var MyHTML_TAG_IMG;
	@:native("MyHTML_TAG_INPUT") var TAG_INPUT;
	@:native("MyHTML_TAG_INS") var MyHTML_TAG_INS;
	@:native("MyHTML_TAG_ISINDEX") var MyHTML_TAG_ISINDEX;
	@:native("MyHTML_TAG_KBD") var MyHTML_TAG_KBD;
	@:native("MyHTML_TAG_KEYGEN") var MyHTML_TAG_KEYGEN;
	@:native("MyHTML_TAG_LABEL") var MyHTML_TAG_LABEL;
	@:native("MyHTML_TAG_LEGEND") var MyHTML_TAG_LEGEND;
	@:native("MyHTML_TAG_LI") var MyHTML_TAG_LI;
	@:native("MyHTML_TAG_LINK") var MyHTML_TAG_LINK;
	@:native("MyHTML_TAG_LISTING") var MyHTML_TAG_LISTING;
	@:native("MyHTML_TAG_MAIN") var MyHTML_TAG_MAIN;
	@:native("MyHTML_TAG_MAP") var MyHTML_TAG_MAP;
	@:native("MyHTML_TAG_MARK") var MyHTML_TAG_MARK;
	@:native("MyHTML_TAG_MARQUEE") var MyHTML_TAG_MARQUEE;
	@:native("MyHTML_TAG_MENU") var MyHTML_TAG_MENU;
	@:native("MyHTML_TAG_MENUITEM") var MyHTML_TAG_MENUITEM;
	@:native("MyHTML_TAG_META") var MyHTML_TAG_META;
	@:native("MyHTML_TAG_METER") var MyHTML_TAG_METER;
	@:native("MyHTML_TAG_MTEXT") var MyHTML_TAG_MTEXT;
	@:native("MyHTML_TAG_NAV") var MyHTML_TAG_NAV;
	@:native("MyHTML_TAG_NOBR") var MyHTML_TAG_NOBR;
	@:native("MyHTML_TAG_NOEMBED") var MyHTML_TAG_NOEMBED;
	@:native("MyHTML_TAG_NOFRAMES") var MyHTML_TAG_NOFRAMES;
	@:native("MyHTML_TAG_NOSCRIPT") var MyHTML_TAG_NOSCRIPT;
	@:native("MyHTML_TAG_OBJECT") var MyHTML_TAG_OBJECT;
	@:native("MyHTML_TAG_OL") var MyHTML_TAG_OL;
	@:native("MyHTML_TAG_OPTGROUP") var MyHTML_TAG_OPTGROUP;
	@:native("MyHTML_TAG_OPTION") var MyHTML_TAG_OPTION;
	@:native("MyHTML_TAG_OUTPUT") var MyHTML_TAG_OUTPUT;
	@:native("MyHTML_TAG_P") var MyHTML_TAG_P;
	@:native("MyHTML_TAG_PARAM") var MyHTML_TAG_PARAM;
	@:native("MyHTML_TAG_PLAINTEXT") var MyHTML_TAG_PLAINTEXT;
	@:native("MyHTML_TAG_PRE") var MyHTML_TAG_PRE;
	@:native("MyHTML_TAG_PROGRESS") var MyHTML_TAG_PROGRESS;
	@:native("MyHTML_TAG_Q") var MyHTML_TAG_Q;
	@:native("MyHTML_TAG_RB") var MyHTML_TAG_RB;
	@:native("MyHTML_TAG_RP") var MyHTML_TAG_RP;
	@:native("MyHTML_TAG_RT") var MyHTML_TAG_RT;
	@:native("MyHTML_TAG_RTC") var MyHTML_TAG_RTC;
	@:native("MyHTML_TAG_RUBY") var MyHTML_TAG_RUBY;
	@:native("MyHTML_TAG_S") var MyHTML_TAG_S;
	@:native("MyHTML_TAG_SAMP") var MyHTML_TAG_SAMP;
	@:native("MyHTML_TAG_SCRIPT") var MyHTML_TAG_SCRIPT;
	@:native("MyHTML_TAG_SECTION") var MyHTML_TAG_SECTION;
	@:native("MyHTML_TAG_SELECT") var MyHTML_TAG_SELECT;
	@:native("MyHTML_TAG_SMALL") var MyHTML_TAG_SMALL;
	@:native("MyHTML_TAG_SOURCE") var MyHTML_TAG_SOURCE;
	@:native("MyHTML_TAG_SPAN") var MyHTML_TAG_SPAN;
	@:native("MyHTML_TAG_STRIKE") var MyHTML_TAG_STRIKE;
	@:native("MyHTML_TAG_STRONG") var MyHTML_TAG_STRONG;
	@:native("MyHTML_TAG_STYLE") var MyHTML_TAG_STYLE;
	@:native("MyHTML_TAG_SUB") var MyHTML_TAG_SUB;
	@:native("MyHTML_TAG_SUMMARY") var MyHTML_TAG_SUMMARY;
	@:native("MyHTML_TAG_SUP") var MyHTML_TAG_SUP;
	@:native("MyHTML_TAG_SVG") var MyHTML_TAG_SVG;
	@:native("MyHTML_TAG_TABLE") var MyHTML_TAG_TABLE;
	@:native("MyHTML_TAG_TBODY") var MyHTML_TAG_TBODY;
	@:native("MyHTML_TAG_TD") var MyHTML_TAG_TD;
	@:native("MyHTML_TAG_TEMPLATE") var MyHTML_TAG_TEMPLATE;
	@:native("MyHTML_TAG_TEXTAREA") var MyHTML_TAG_TEXTAREA;
	@:native("MyHTML_TAG_TFOOT") var MyHTML_TAG_TFOOT;
	@:native("MyHTML_TAG_TH") var MyHTML_TAG_TH;
	@:native("MyHTML_TAG_THEAD") var MyHTML_TAG_THEAD;
	@:native("MyHTML_TAG_TIME") var MyHTML_TAG_TIME;
	@:native("MyHTML_TAG_TITLE") var MyHTML_TAG_TITLE;
	@:native("MyHTML_TAG_TR") var MyHTML_TAG_TR;
	@:native("MyHTML_TAG_TRACK") var MyHTML_TAG_TRACK;
	@:native("MyHTML_TAG_TT") var MyHTML_TAG_TT;
	@:native("MyHTML_TAG_U") var MyHTML_TAG_U;
	@:native("MyHTML_TAG_UL") var MyHTML_TAG_UL;
	@:native("MyHTML_TAG_VAR") var MyHTML_TAG_VAR;
	@:native("MyHTML_TAG_VIDEO") var MyHTML_TAG_VIDEO;
	@:native("MyHTML_TAG_WBR") var MyHTML_TAG_WBR;
	@:native("MyHTML_TAG_XMP") var MyHTML_TAG_XMP;
	@:native("MyHTML_TAG_ALTGLYPH") var MyHTML_TAG_ALTGLYPH;
	@:native("MyHTML_TAG_ALTGLYPHDEF") var MyHTML_TAG_ALTGLYPHDEF;
	@:native("MyHTML_TAG_ALTGLYPHITEM") var MyHTML_TAG_ALTGLYPHITEM;
	@:native("MyHTML_TAG_ANIMATE") var MyHTML_TAG_ANIMATE;
	@:native("MyHTML_TAG_ANIMATECOLOR") var MyHTML_TAG_ANIMATECOLOR;
	@:native("MyHTML_TAG_ANIMATEMOTION") var MyHTML_TAG_ANIMATEMOTION;
	@:native("MyHTML_TAG_ANIMATETRANSFORM") var MyHTML_TAG_ANIMATETRANSFORM;
	@:native("MyHTML_TAG_CIRCLE") var MyHTML_TAG_CIRCLE;
	@:native("MyHTML_TAG_CLIPPATH") var MyHTML_TAG_CLIPPATH;
	@:native("MyHTML_TAG_COLOR_PROFILE") var MyHTML_TAG_COLOR_PROFILE;
	@:native("MyHTML_TAG_CURSOR") var MyHTML_TAG_CURSOR;
	@:native("MyHTML_TAG_DEFS") var MyHTML_TAG_DEFS;
	@:native("MyHTML_TAG_DESC") var MyHTML_TAG_DESC;
	@:native("MyHTML_TAG_ELLIPSE") var MyHTML_TAG_ELLIPSE;
	@:native("MyHTML_TAG_FEBLEND") var MyHTML_TAG_FEBLEND;
	@:native("MyHTML_TAG_FECOLORMATRIX") var MyHTML_TAG_FECOLORMATRIX;
	@:native("MyHTML_TAG_FECOMPONENTTRANSFER") var MyHTML_TAG_FECOMPONENTTRANSFER;
	@:native("MyHTML_TAG_FECOMPOSITE") var MyHTML_TAG_FECOMPOSITE;
	@:native("MyHTML_TAG_FECONVOLVEMATRIX") var MyHTML_TAG_FECONVOLVEMATRIX;
	@:native("MyHTML_TAG_FEDIFFUSELIGHTING") var MyHTML_TAG_FEDIFFUSELIGHTING;
	@:native("MyHTML_TAG_FEDISPLACEMENTMAP") var MyHTML_TAG_FEDISPLACEMENTMAP;
	@:native("MyHTML_TAG_FEDISTANTLIGHT") var MyHTML_TAG_FEDISTANTLIGHT;
	@:native("MyHTML_TAG_FEDROPSHADOW") var MyHTML_TAG_FEDROPSHADOW;
	@:native("MyHTML_TAG_FEFLOOD") var MyHTML_TAG_FEFLOOD;
	@:native("MyHTML_TAG_FEFUNCA") var MyHTML_TAG_FEFUNCA;
	@:native("MyHTML_TAG_FEFUNCB") var MyHTML_TAG_FEFUNCB;
	@:native("MyHTML_TAG_FEFUNCG") var MyHTML_TAG_FEFUNCG;
	@:native("MyHTML_TAG_FEFUNCR") var MyHTML_TAG_FEFUNCR;
	@:native("MyHTML_TAG_FEGAUSSIANBLUR") var MyHTML_TAG_FEGAUSSIANBLUR;
	@:native("MyHTML_TAG_FEIMAGE") var MyHTML_TAG_FEIMAGE;
	@:native("MyHTML_TAG_FEMERGE") var MyHTML_TAG_FEMERGE;
	@:native("MyHTML_TAG_FEMERGENODE") var MyHTML_TAG_FEMERGENODE;
	@:native("MyHTML_TAG_FEMORPHOLOGY") var MyHTML_TAG_FEMORPHOLOGY;
	@:native("MyHTML_TAG_FEOFFSET") var MyHTML_TAG_FEOFFSET;
	@:native("MyHTML_TAG_FEPOINTLIGHT") var MyHTML_TAG_FEPOINTLIGHT;
	@:native("MyHTML_TAG_FESPECULARLIGHTING") var MyHTML_TAG_FESPECULARLIGHTING;
	@:native("MyHTML_TAG_FESPOTLIGHT") var MyHTML_TAG_FESPOTLIGHT;
	@:native("MyHTML_TAG_FETILE") var MyHTML_TAG_FETILE;
	@:native("MyHTML_TAG_FETURBULENCE") var MyHTML_TAG_FETURBULENCE;
	@:native("MyHTML_TAG_FILTER") var MyHTML_TAG_FILTER;
	@:native("MyHTML_TAG_FONT_FACE") var MyHTML_TAG_FONT_FACE;
	@:native("MyHTML_TAG_FONT_FACE_FORMAT") var MyHTML_TAG_FONT_FACE_FORMAT;
	@:native("MyHTML_TAG_FONT_FACE_NAME") var MyHTML_TAG_FONT_FACE_NAME;
	@:native("MyHTML_TAG_FONT_FACE_SRC") var MyHTML_TAG_FONT_FACE_SRC;
	@:native("MyHTML_TAG_FONT_FACE_URI") var MyHTML_TAG_FONT_FACE_URI;
	@:native("MyHTML_TAG_FOREIGNOBJECT") var MyHTML_TAG_FOREIGNOBJECT;
	@:native("MyHTML_TAG_G") var MyHTML_TAG_G;
	@:native("MyHTML_TAG_GLYPH") var MyHTML_TAG_GLYPH;
	@:native("MyHTML_TAG_GLYPHREF") var MyHTML_TAG_GLYPHREF;
	@:native("MyHTML_TAG_HKERN") var MyHTML_TAG_HKERN;
	@:native("MyHTML_TAG_LINE") var MyHTML_TAG_LINE;
	@:native("MyHTML_TAG_LINEARGRADIENT") var MyHTML_TAG_LINEARGRADIENT;
	@:native("MyHTML_TAG_MARKER") var MyHTML_TAG_MARKER;
	@:native("MyHTML_TAG_MASK") var MyHTML_TAG_MASK;
	@:native("MyHTML_TAG_METADATA") var MyHTML_TAG_METADATA;
	@:native("MyHTML_TAG_MISSING_GLYPH") var MyHTML_TAG_MISSING_GLYPH;
	@:native("MyHTML_TAG_MPATH") var MyHTML_TAG_MPATH;
	@:native("MyHTML_TAG_PATH") var MyHTML_TAG_PATH;
	@:native("MyHTML_TAG_PATTERN") var MyHTML_TAG_PATTERN;
	@:native("MyHTML_TAG_POLYGON") var MyHTML_TAG_POLYGON;
	@:native("MyHTML_TAG_POLYLINE") var MyHTML_TAG_POLYLINE;
	@:native("MyHTML_TAG_RADIALGRADIENT") var MyHTML_TAG_RADIALGRADIENT;
	@:native("MyHTML_TAG_RECT") var MyHTML_TAG_RECT;
	@:native("MyHTML_TAG_SET") var MyHTML_TAG_SET;
	@:native("MyHTML_TAG_STOP") var MyHTML_TAG_STOP;
	@:native("MyHTML_TAG_SWITCH") var MyHTML_TAG_SWITCH;
	@:native("MyHTML_TAG_SYMBOL") var MyHTML_TAG_SYMBOL;
	@:native("MyHTML_TAG_TEXT") var MyHTML_TAG_TEXT;
	@:native("MyHTML_TAG_TEXTPATH") var MyHTML_TAG_TEXTPATH;
	@:native("MyHTML_TAG_TREF") var MyHTML_TAG_TREF;
	@:native("MyHTML_TAG_TSPAN") var MyHTML_TAG_TSPAN;
	@:native("MyHTML_TAG_USE") var MyHTML_TAG_USE;
	@:native("MyHTML_TAG_VIEW") var MyHTML_TAG_VIEW;
	@:native("MyHTML_TAG_VKERN") var MyHTML_TAG_VKERN;
	@:native("MyHTML_TAG_MATH") var MyHTML_TAG_MATH;
	@:native("MyHTML_TAG_MACTION") var MyHTML_TAG_MACTION;
	@:native("MyHTML_TAG_MALIGNGROUP") var MyHTML_TAG_MALIGNGROUP;
	@:native("MyHTML_TAG_MALIGNMARK") var MyHTML_TAG_MALIGNMARK;
	@:native("MyHTML_TAG_MENCLOSE") var MyHTML_TAG_MENCLOSE;
	@:native("MyHTML_TAG_MERROR") var MyHTML_TAG_MERROR;
	@:native("MyHTML_TAG_MFENCED") var MyHTML_TAG_MFENCED;
	@:native("MyHTML_TAG_MFRAC") var MyHTML_TAG_MFRAC;
	@:native("MyHTML_TAG_MGLYPH") var MyHTML_TAG_MGLYPH;
	@:native("MyHTML_TAG_MI") var MyHTML_TAG_MI;
	@:native("MyHTML_TAG_MLABELEDTR") var MyHTML_TAG_MLABELEDTR;
	@:native("MyHTML_TAG_MLONGDIV") var MyHTML_TAG_MLONGDIV;
	@:native("MyHTML_TAG_MMULTISCRIPTS") var MyHTML_TAG_MMULTISCRIPTS;
	@:native("MyHTML_TAG_MN") var MyHTML_TAG_MN;
	@:native("MyHTML_TAG_MO") var MyHTML_TAG_MO;
	@:native("MyHTML_TAG_MOVER") var MyHTML_TAG_MOVER;
	@:native("MyHTML_TAG_MPADDED") var MyHTML_TAG_MPADDED;
	@:native("MyHTML_TAG_MPHANTOM") var MyHTML_TAG_MPHANTOM;
	@:native("MyHTML_TAG_MROOT") var MyHTML_TAG_MROOT;
	@:native("MyHTML_TAG_MROW") var MyHTML_TAG_MROW;
	@:native("MyHTML_TAG_MS") var MyHTML_TAG_MS;
	@:native("MyHTML_TAG_MSCARRIES") var MyHTML_TAG_MSCARRIES;
	@:native("MyHTML_TAG_MSCARRY") var MyHTML_TAG_MSCARRY;
	@:native("MyHTML_TAG_MSGROUP") var MyHTML_TAG_MSGROUP;
	@:native("MyHTML_TAG_MSLINE") var MyHTML_TAG_MSLINE;
	@:native("MyHTML_TAG_MSPACE") var MyHTML_TAG_MSPACE;
	@:native("MyHTML_TAG_MSQRT") var MyHTML_TAG_MSQRT;
	@:native("MyHTML_TAG_MSROW") var MyHTML_TAG_MSROW;
	@:native("MyHTML_TAG_MSTACK") var MyHTML_TAG_MSTACK;
	@:native("MyHTML_TAG_MSTYLE") var MyHTML_TAG_MSTYLE;
	@:native("MyHTML_TAG_MSUB") var MyHTML_TAG_MSUB;
	@:native("MyHTML_TAG_MSUP") var MyHTML_TAG_MSUP;
	@:native("MyHTML_TAG_MSUBSUP") var MyHTML_TAG_MSUBSUP;
	@:native("MyHTML_TAG__END_OF_FILE") var MyHTML_TAG__END_OF_FILE;
	@:native("MyHTML_TAG_FIRST_ENTRY") var MyHTML_TAG_FIRST_ENTRY;
	@:native("MyHTML_TAG_LAST_ENTRY") var MyHTML_TAG_LAST_ENTRY;
}