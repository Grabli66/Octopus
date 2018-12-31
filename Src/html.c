#include <hl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <modest/finder/finder.h>
#include <mycss/mycss.h>
#include <mycss/selectors/init.h>
#include <mycss/selectors/serialization.h>
#include <myhtml/myhtml.h>
#include <myhtml/serialization.h>

mycss_selectors_list_t* prepare_selector(mycss_entry_t* css_entry, const char* selector, size_t selector_size)
{
    mystatus_t out_status;
    mycss_selectors_list_t* list =
        mycss_selectors_parse(mycss_entry_selectors(css_entry), MyENCODING_UTF_8, selector, selector_size, &out_status);

    return list;
}

#define _HTML_CTX_GC _ABSTRACT(HtmlCtx)
#define _HTML_TREE_GC _ABSTRACT(HtmlTree)
#define _HTML_TREE_NODE _ABSTRACT(myhtml_tree_node_t)
#define _HTML_COLLECTION_GC _ABSTRACT(NodeCollection)
#define _HTML_NODE_ATTR _ABSTRACT(myhtml_tree_attr_t)

typedef struct {
    void *free;
    myhtml_t* html;
} HtmlCtx;

typedef struct {
    void *free;
    myhtml_tree_t* tree;
} HtmlTree;

typedef struct {
    void *free;
    myhtml_collection_t* collection;
} NodeCollection;

// Close context
void close_ctx(HtmlCtx* ctx) {
    if (ctx->html) {
        myhtml_destroy(ctx->html);
        ctx->html = NULL;
    }
}

// Close tree
void close_tree(HtmlTree* ctx) {
    if (ctx->tree) {
        myhtml_tree_destroy(ctx->tree);
        ctx->tree = NULL;
    }
}

// Close collection
void close_collection(NodeCollection* collection) {
    myhtml_collection_destroy(collection->collection);
}

// Create html context
HL_PRIM HtmlCtx* HL_NAME(hl_html_create_ctx)() {
    HtmlCtx* ctx = (HtmlCtx*) hl_gc_alloc_finalizer(sizeof(HtmlCtx));
    ctx->free = HL_NAME(close_ctx);
    ctx->html = myhtml_create();
    mystatus_t status = myhtml_init(ctx->html, MyHTML_OPTIONS_DEFAULT, 1, 0);
    return ctx;
}

// Parse string and return html tree
HL_PRIM HtmlTree* HL_NAME(hl_html_parse_string)(HtmlCtx* html, const char* html_data, int len)
{
    HtmlTree* ctx = (HtmlTree*) hl_gc_alloc_finalizer(sizeof(HtmlTree));
    ctx->free = HL_NAME(close_tree);
    
    myhtml_tree_t* tree = myhtml_tree_create();
    ctx->tree = tree;
    myhtml_status_t status = myhtml_tree_init(tree, html->html);
    status = myhtml_parse(tree, MyENCODING_UTF_8, html_data, len);
    
    return ctx;
}

// Return tree root node
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_get_tree_html_node)(HtmlTree* ctx) {
    return ctx->tree->node_html;
}

// Return tag name by tag id
HL_PRIM const char* HL_NAME(hl_html_get_tagname_by_tagid)(HtmlTree* ctx, int tag_id) {
    size_t* length = 0;
    const char* res = myhtml_tag_name_by_id(ctx->tree, tag_id, length);
    return res;
}

// Return tag id by tag name
HL_PRIM int HL_NAME(hl_html_get_tagid_by_tagname)(HtmlTree* ctx, const char* name, int length) {
    int res = myhtml_tag_id_by_name(ctx->tree, name, length);
    return res;
}

// Find by CSS selectors and return collection for iteration
HL_PRIM NodeCollection* HL_NAME(hl_html_find_by_css)(myhtml_tree_node_t* node, const char* css_data, int len) {
    // base init
    mycss_t* mycss = mycss_create();
    mystatus_t status = mycss_init(mycss);
    mycss_entry_t* css_entry = mycss_entry_create();
    status = mycss_entry_init(mycss, css_entry);

    modest_finder_t* finder = modest_finder_create_simple();

    /* parse selectors */
    mycss_selectors_list_t* selectors_list = prepare_selector(css_entry, css_data, len);
    
    /* find nodes by selector */
    myhtml_tree_t* html_tree = node->tree;
    myhtml_collection_t* collection = NULL;
    modest_finder_by_selectors_list(finder, node, selectors_list, &collection);
    
    NodeCollection* nodeCollection = (NodeCollection*) hl_gc_alloc_finalizer(sizeof(NodeCollection));
    nodeCollection->free = HL_NAME(close_collection);
    nodeCollection->collection = collection;
    
    mycss_selectors_list_destroy(mycss_entry_selectors(css_entry), selectors_list, true);
    modest_finder_destroy(finder, true);
        
    mycss_entry_destroy(css_entry, true);
    mycss_destroy(mycss, true);
    
    return nodeCollection;
}

// Get collection with nodes by tag id
HL_PRIM NodeCollection* HL_NAME(hl_html_get_nodes_by_tagid)(myhtml_tree_node_t* node, int tagid) {
    myhtml_collection_t* collection = myhtml_get_nodes_by_tag_id_in_scope(node->tree, NULL, node, tagid, NULL);
    NodeCollection* nodeCollection = (NodeCollection*) hl_gc_alloc_finalizer(sizeof(NodeCollection));
    nodeCollection->free = HL_NAME(close_collection);
    nodeCollection->collection = collection;
    return nodeCollection;
}

// Get node child
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_node_child)(myhtml_tree_node_t* node) {
    return node->child;
}

// Get node last child
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_node_last_child)(myhtml_tree_node_t* node) {
    return node->last_child;
}

// Get node next
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_node_next)(myhtml_tree_node_t* node) {
    return node->next;
}

// Get node prevoious
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_node_prev)(myhtml_tree_node_t* node) {
    return node->prev;
}

// Get node tag id
HL_PRIM int HL_NAME(hl_html_get_node_tag)(myhtml_tree_node_t* node) {
    return node->tag_id;
}

// Get attribute by key
HL_PRIM myhtml_tree_attr_t* HL_NAME(hl_html_get_attribute_by_key)(myhtml_tree_node_t* node, const char* key, int len) {
    return myhtml_attribute_by_key(node, key, len);
}

// Get attribute value
HL_PRIM const char* HL_NAME(hl_html_get_attribute_value)(myhtml_tree_attr_t* attr) {
    size_t* len = 0;
    return myhtml_attribute_value(attr, len);
}

// Return collection length
HL_PRIM int HL_NAME(hl_html_get_collection_length)(NodeCollection* collection) {
    return collection->collection->length;
}

// Return node of collection
HL_PRIM myhtml_tree_node_t* HL_NAME(hl_html_get_node_from_collection)(NodeCollection* collection, int idx) {
    return collection->collection->list[idx];
}

// Return node text
HL_PRIM const char* HL_NAME(hl_html_get_node_text)(myhtml_tree_node_t* node) {    
    const char* text = myhtml_node_text(node, NULL);
    return text;
}

DEFINE_PRIM(_HTML_CTX_GC, html_create_ctx, _NO_ARG);
DEFINE_PRIM(_HTML_TREE_GC, html_parse_string, _HTML_CTX_GC _BYTES _I32);
DEFINE_PRIM(_HTML_TREE_NODE, html_get_tree_html_node, _HTML_TREE_GC);
DEFINE_PRIM(_BYTES, html_get_tagname_by_tagid, _HTML_TREE_GC _I32);
DEFINE_PRIM(_I32, html_get_tagid_by_tagname, _HTML_TREE_GC _BYTES _I32);

// NODE
DEFINE_PRIM(_HTML_COLLECTION_GC, html_find_by_css, _HTML_TREE_NODE _BYTES _I32);
DEFINE_PRIM(_HTML_COLLECTION_GC, html_get_nodes_by_tagid, _HTML_TREE_NODE _I32);
DEFINE_PRIM(_HTML_TREE_NODE, html_node_child, _HTML_TREE_NODE);
DEFINE_PRIM(_HTML_TREE_NODE, html_node_last_child, _HTML_TREE_NODE);
DEFINE_PRIM(_HTML_TREE_NODE, html_node_next, _HTML_TREE_NODE);
DEFINE_PRIM(_HTML_TREE_NODE, html_node_prev, _HTML_TREE_NODE);
DEFINE_PRIM(_I32, html_get_node_tag, _HTML_TREE_NODE);
DEFINE_PRIM(_HTML_NODE_ATTR, html_get_attribute_by_key, _HTML_TREE_NODE _BYTES _I32);

// ATTRIBUTE
DEFINE_PRIM(_BYTES, html_get_attribute_value, _HTML_NODE_ATTR);

DEFINE_PRIM(_I32, html_get_collection_length, _HTML_COLLECTION_GC);
DEFINE_PRIM(_HTML_TREE_NODE, html_get_node_from_collection, _HTML_COLLECTION_GC _I32);
DEFINE_PRIM(_BYTES, html_get_node_text, _HTML_TREE_NODE);
