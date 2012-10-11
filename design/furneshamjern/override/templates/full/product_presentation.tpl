<div class="product_presentation clearfix">
{literal}
<script>
			$(document).ready(function(){
				$(".group1").colorbox({rel:'group1'});		
			});
</script>
{/literal}

{def $list_items=fetch_alias( children, hash( parent_node_id, $node.main_node_id,
				'class_filter_type',  'include',
              	'class_filter_array', array( 'image'),
              	'sort_by', $node.object.main_node.sort_array
				))}
<dl class="product_presentation_buttons clearfix">
<dd>
{if $node.data_map.veil.has_content}
<a href={concat( 'content/download/', $node.data_map.veil.contentobject_id, '/', $node.data_map.veil.id,'/version/', $node.data_map.veil.version , '/file/', $node.data_map.veil.content.original_filename|urlencode )|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
{else}
{if eq($node.object.current_language, 'nor-NO')}
<a href={'veiledning'|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
{/if}
{if eq($node.object.current_language, 'swe-SE')}
<a href={'anvisningar'|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
{/if}
{/if}
</dd>
<dd>
{if $node.data_map.fdv.has_content}
<a href={concat( 'content/download/', $node.data_map.fdv.contentobject_id, '/', $node.data_map.fdv.id,'/version/', $node.data_map.fdv.version , '/file/', $node.data_map.fdv.content.original_filename|urlencode )|ezurl}>{$node.data_map.fdv.contentclass_attribute.name}</a>
{else}
<a href={'fdv'|ezurl}>FDV</a>
{/if}
</dd>
{*
<dd>
 <a class="print" href="{concat("/index.php/layout/set/print/content/view/full/",$node.node_id,"/")}">Produktdatablad</a>
</dd>*}
</dl>
{if $list_items}
<div class="product_presentation_full">
{foreach $list_items as $child_items}
	<div><a class="group1" href="/{$child_items.data_map.image.content.productmedium.url}">{attribute_view_gui attribute=$child_items.data_map.image image_class="productthumb"}</a></div>
{/foreach}
</div>
{/if}
<table class="product_presentation" width="100%" border="0">
            	    <tr>
            	    {if $node.data_map.nrf_nr.has_content}
            	      <th scope="col">{$node.data_map.nrf_nr.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.rsk_nr.has_content}
            	      <th scope="col">{$node.data_map.rsk_nr.contentclass_attribute.name}</th>
            	    {/if}

    				{if $node.data_map.vvs_nr.has_content}
            	      <th scope="col">{$node.data_map.vvs_nr.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.furnes_nr.has_content}
            	      <th scope="col">{$node.data_map.furnes_nr.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    <th scope="col" class="product-title">{$node.data_map.name.contentclass_attribute.name}</th>
            	    
            	    {if $node.data_map.material.has_content}
            	      <th scope="col">{$node.data_map.material.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.standard.has_content}
            	      <th scope="col">{$node.data_map.standard.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.class.has_content}
            	      <th scope="col">{$node.data_map.class.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.weight_pcs.has_content}
            	      <th scope="col">{$node.data_map.weight_pcs.contentclass_attribute.name}</th>
            	    {/if}
          	      </tr>
            	    <tr>
            	     {if $node.data_map.nrf_nr.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.nrf_nr}</td>
            	     {/if}
            	     
            	     {if $node.data_map.rsk_nr.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.rsk_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.vvs_nr.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.vvs_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.tun_nr.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.tun_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.furnes_nr.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.furnes_nr}</td>
            	      {/if}
            	      
            	     <td>
						{attribute_view_gui attribute=$node.data_map.name}
            	     </td>
 
                      {if eq($node.object.data_map.material.value.0, 0|not)}
            	      {def $value = $node.data_map.material.data_text}
            	      <td>
            	      {$node.data_map.material.contentclass_attribute.content.options.$value.name|i18n( 'hamjern/types' )}
            	      </td>
            	      {/if}
            	      
            	      {if $node.data_map.standard.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.standard}</td>
            	      {/if}
            	      
            	      {if $node.data_map.class.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.class}</td>
            	      {/if}
            	      
            	      {if $node.data_map.weight_pcs.has_content}
            	      <td>{attribute_view_gui attribute=$node.data_map.weight_pcs}</td>
            	      {/if}
          	      </tr>
</table>
</div>