<div class="content-view-full-folder clearfix">
    <div class="class-folder">
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

            {def $page_limit = 100
                 $children = array()
                 $children_count = ''}

            <div class="content-view-children">
                 
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

                         	{foreach $type as $types}
                         		<h2>{$types|i18n( 'hamjern/pack' )}</h2>
           					{foreach $product_list as $product}
        						{def $prod_value = $product.object.data_map.innhold.value.0}
        						{def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
        						{if eq($prod_name, $types)}
                         			{node_view_gui view='line' content_node=$product}
                         		{/if}
                         	{/foreach}
                         	<div class="page-break"></div>
                         	{/foreach}


            </div>
    </div>
</div>
