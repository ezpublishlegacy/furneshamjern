{def $product_list = fetch( 'content', 'list', hash( 'parent_node_id', $node.main_node_id,
                    'only_translated', true(),
                    'sort_by', $node.object.main_node.sort_array ) )}
{def $type=array()}
{foreach $product_list as $products}
        {def $value = $products.object.data_map.innhold.value.0}
        {def $name = $products.object.data_map.innhold.contentclass_attribute.content.options[$value].name}
        {set $type = $type|append( $name )}
{/foreach}
{set $type = $type|unique}

{def $page_limit = 100
    $children = array()
    $children_count = ''
    $tcount= ''
    $pcount= ''
    $offsets= array(0,3,6,9,12,15,18,21)}

<div class="content-view-full-folder clearfix">
    <div class="class-folder">
    
{foreach $offsets as $offset}
  {include uri='design:parts/print_header.tpl'}
{foreach $product_list as $product max 3 offset $offset}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
<div class="content-view-children">
                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                    {node_view_gui view='line' content_node=$product}
</div>
{/foreach}
<div class="page-break"></div>
{/foreach}
    </div>
</div>
