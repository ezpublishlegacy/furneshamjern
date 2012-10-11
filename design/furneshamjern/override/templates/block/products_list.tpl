{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{def $locale = ezini( 'RegionalSettings', 'Locale', 'site.ini' )}
{for 0 to $blocks as $counter}
{def $product_list = fetch( 'content', 'list', hash( 'parent_node_id', $valid_nodes[$counter].node_id,
							sort_by, $valid_nodes[$counter].sort_array,
							'only_translated', true(),
              				'language', $locale
							) )}
   
<!-- BLOCK: START -->
<div class="block-type-products">
{if $block.name}
<h2>{$block.name}</h2>
{/if}

<!-- BLOCK CONTENT: START -->

{*<h2>{$valid_nodes[$counter].name}</h2>*}

<ul>
{foreach $product_list as $valid_node}
{if eq($valid_node.object.current_language, $locale)}
	{node_view_gui view='block_item' content_node=$valid_node}
{/if}
{/foreach}
</ul>
<!-- BLOCK CONTENT: END -->
</div>
<!-- BLOCK: END -->
{/for}
{undef $product_list}
{undef $valid_nodes}