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
    $pcount= ''}

<div class="content-view-full-folder clearfix">
    <div class="class-folder">
{foreach $product_list as $product max 3}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
{run-once}
    <img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern">
        <div class="attribute-header">
            <h1>0 - {attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {if $node.object.data_map.short_description.has_content}
        <div class="attribute-desc">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        {/if}
        {if $node.object.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
{/run-once}
<div class="content-view-children">
                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                                    {node_view_gui view='line' content_node=$product}
</div>
{/foreach}
<div class="page-break"></div>
{foreach $product_list as $product max 3 offset 3}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
{run-once}
    <img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern">
        <div class="attribute-header">
            <h1>4 - {attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {if $node.object.data_map.short_description.has_content}
        <div class="attribute-desc">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        {/if}
        {if $node.object.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
{/run-once}
<div class="content-view-children">

                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                                    {node_view_gui view='line' content_node=$product}
</div>
{/foreach}
<div class="page-break"></div>
{foreach $product_list as $product max 3 offset 7}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
{run-once}
    <img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern">
        <div class="attribute-header">
            <h1>7 - {attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {if $node.object.data_map.short_description.has_content}
        <div class="attribute-desc">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        {/if}
        {if $node.object.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
{/run-once}
<div class="content-view-children">    
                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                                    {node_view_gui view='line' content_node=$product}

</div>
{/foreach}
<div class="page-break"></div>
{foreach $product_list as $product max 3 offset 10}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
{run-once}
    <img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern">
        <div class="attribute-header">
            <h1>10 - {attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {if $node.object.data_map.short_description.has_content}
        <div class="attribute-desc">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        {/if}
        {if $node.object.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
{/run-once}
<div class="content-view-children">

                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                                    {node_view_gui view='line' content_node=$product}
</div>
{/foreach}
<div class="page-break"></div>
{foreach $product_list as $product max 3 offset 13}
        {def $prod_value = $product.object.data_map.innhold.value.0}
        {def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
{run-once}
    <img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {if $node.object.data_map.short_description.has_content}
        <div class="attribute-desc">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        {/if}
        {if $node.object.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
{/run-once}
<div class="content-view-children">
                    <h2>{$prod_name|i18n( 'hamjern/pack' )}</h2>
                                    {node_view_gui view='line' content_node=$product}
</div>
{/foreach}
<div class="page-break"></div>
    </div>
</div>
