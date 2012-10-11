{* Folder - Full view *}
{def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}
{def $innhold =  ezini( 'Produktpresentasjon', 'innhold', 'furnes.ini' ) )}
{ezpagedata_set( 'extra_menu', false() )}

<div class="content-view-full-folder clearfix">
    <div class="class-folder">
    	{if $node.object.can_edit}
		<div class="print">
			<a class="print" target="_new" href="{concat("/layout/set/print/content/view/full/",$node.node_id,"/")}">Skriv ut denne siden</a>
		</div>
		{/if}
        {if $rss_export}
        <div class="attribute-rss-icon">
            <a href="{concat( '/rss/feed/', $rss_export.access_url )|ezurl( 'no' )}" title="{$rss_export.title|wash()}"><img src="{'rss-icon.gif'|ezimage( 'no' )}" alt="{$rss_export.title|wash()}" /></a>
        </div>
        {/if}

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
                {attribute_view_gui attribute=$node.data_map.description}
        {/if}

            {def $page_limit = 100
                 $children = array()
                 $children_count = '', 
                 $lang=$node.object.default_language}

            <div class="content-view-children">                  
             {def $product_list = fetch( 'content', 'list', hash( 'parent_node_id', $node.main_node_id,
																				'only_translated', true(),
																				'sort_by', $node.object.main_node.sort_array))}
							{def $type=array()}
							{def $types=array()}
							{def $types_prods=array()}				
                         	{foreach $product_list as $products}
                         	{if eq($products.object.current_language, $products.object.default_language)}
                         		{def $value = $products.object.data_map.innhold.value.0}
                         		{def $name = $products.object.data_map.innhold.contentclass_attribute.content.options[$value].name}
                         		{def $type_id = $products.object.data_map.innhold.contentclass_attribute.content.options[$value].name}
                         		{set $type = $type|append( $name )}
                         		
                         	{/if}
                         	{/foreach}
                         	{set $type = $type|unique}
                         	
                         	<ul class="tabs">
                         	{foreach $innhold as $prods}
                         		{foreach $type as $type_header}
                         			{if eq($type_header, $prods)}
                         				<li><a href="#">               		      		
                         					{$type_header|i18n( 'hamjern/pack' )}                    		
                         				</a></li>
                         			{/if}
                    			{/foreach}
                         	{/foreach}
							</ul>                       	
                         	<div class="panes">
                         	{foreach $innhold as $prods}
                         		{foreach $type as $type_header}
                         			{if eq($type_header, $prods)}
                         	<div>
                         	{foreach $product_list as $product}
        						{def $prod_value = $product.object.data_map.innhold.value.0}
        						{def $prod_name = $product.object.data_map.innhold.contentclass_attribute.content.options[$prod_value].name}
        						{if eq($prods, $prod_name)}
        						{if eq($product.object.current_language, $product.object.default_language)}
                         			{node_view_gui view='line' content_node=$product}
                         		{/if}
                         		{/if}
                         	{/foreach}
                         	</div>
                         	{/if}
                    		{/foreach}
                       {/foreach}
                         </div> 
            </div>
    </div>
</div>
