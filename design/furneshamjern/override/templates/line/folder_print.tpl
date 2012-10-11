<div class="content-view-full clearfix">
    <div class="class-folder">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-desc">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
        {/if}

        {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 100
                 $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
                 $children = array()
                 $children_count = ''}
                 
            {if le( $node.depth, '3')}
                {set $classes = $classes|merge( ezini( 'ChildrenNodeList', 'ExcludedClasses', 'content.ini' ) )}
            {/if}
            {set $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $classes ) )}

            <div class="content-view-children">
                {if $children_count}
                    {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                            'offset', $view_parameters.offset,
                                                            'sort_by', $node.sort_array,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', $classes,
                                                            'limit', $page_limit ) ) as $child }
                                                            
                     {if eq($child.object.content_class.identifier, product_presentation)}
                     {run-once}                             
             {def $product_list = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
																				'sort_by', $node.sort_array ) )}														
							{def $type=Array()}
                         	{foreach $product_list as $products}
                         		{def $value = $products.object.data_map.innhold.value.0}
                         		{def $name = $products.object.data_map.innhold.contentclass_attribute.content.options[$value].name}
                         		{set $type = $type|append( $name )}
                         	{/foreach}
                         	
                         	{set $type = $type|unique}

                         	{foreach $type as $types}
                         	<h2>{$type_header}</h2>
                         	{foreach $product_list as $product}
        						{def $prod_value = $product.object.data_map.innhold.value.0}
        						{def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
        						{if eq($prod_name, $types)}
                         			{node_view_gui view='line' content_node=$product}
                         		{/if}
                         	{/foreach}
                         	{/foreach}
                         </div> 
                         {/run-once}	
                         {else}
                        {node_view_gui view='line' content_node=$child}
                        {/if}
                    {/foreach}
                {/if}

            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
        {$child.object.data_map.innhold.contentclass_attribute.content.options.0}
    </div>
</div>
