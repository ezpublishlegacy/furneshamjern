<div class="product_presentation clearfix">
{def $list_items=fetch( content, list, hash( parent_node_id, $node.main_node_id,
				   'class_filter_type',  'include',
              	         'class_filter_array', array( 'image'),
              	         'sort_by', $node.object.main_node.sort_array
				))}
				

<dl class="product_presentation_buttons clearfix">
{if $node.data_map.veil.has_content}
<dd>
<a href={concat( 'content/download/', $node.data_map.veil.contentobject_id, '/', $node.data_map.veil.id,'/version/', $node.data_map.veil.version , '/file/', $node.data_map.veil.content.original_filename|urlencode )|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
</dd>
{else}
<dd>
{if eq($node.object.current_language, 'nor-NO')}
<a href={'veiledning'|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
{/if}
{if eq($node.object.current_language, 'swe-SE')}
<a href={'anvisningar'|ezurl}>{$node.data_map.veil.contentclass_attribute.name}</a>
{/if}
</dd>
{/if}
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
<div class="product_presentation_list">
{foreach $list_items as $child_items}
<script type="text/javascript">
			$(document).ready(function(){ldelim}
				$(".group_{$node.node_id}").colorbox({ldelim}rel:'group_{$node.node_id}'{rdelim});		
				{rdelim});
</script>
<div><a class="group_{$node.node_id}" href="/{$child_items.data_map.image.content.productmedium.url}">{attribute_view_gui attribute=$child_items.data_map.image image_class=productthumb}</a></div>
{/foreach}
</div>
{/if}
<table class="product_presentation" width="100%" border="0">
            	    <tr>
            	    {if $node.data_map.nrf_nr.has_content}
            	      <th scope="col">{$node.data_map.nrf_nr.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.rsk_nr.has_content}
            	      <th scope="col" class="number_80">{$node.data_map.rsk_nr.contentclass_attribute.name}</th>
            	    {/if}

    				{if $node.data_map.vvs_nr.has_content}
            	      <th scope="col" class="number_80">{$node.data_map.vvs_nr.contentclass_attribute.name}</th>
            	    {/if}
            	              	    
            	    {if $node.data_map.furnes_nr.has_content}
            	      <th scope="col">{$node.data_map.furnes_nr.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	      <th scope="col">{$node.data_map.name.contentclass_attribute.name}</th>

            	    
            	    {if eq($node.object.data_map.material.value.0, 0|not)}
            	      <th scope="col" >{$node.data_map.material.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	   {if eq($node.object.data_map.standard.value.0, 0|not)}
            	      <th scope="col">{$node.data_map.standard.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if eq($node.object.data_map.class.value.0, 0|not)}
            	      <th scope="col">{$node.data_map.class.contentclass_attribute.name}</th>
            	    {/if}
            	    
            	    {if $node.data_map.weight_pcs.has_content}
            	      <th scope="col">{$node.data_map.weight_pcs.contentclass_attribute.name}</th>
            	    {/if}
          	      </tr>
            	    <tr>
            	     {if $node.data_map.nrf_nr.has_content}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.nrf_nr}</td>
            	     {/if}
            	     
            	     
            	     {if $node.data_map.rsk_nr.has_content}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.rsk_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.vvs_nr.has_content}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.vvs_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.tun_nr.has_content}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.tun_nr}</td>
            	      {/if}
            	      
            	      {if $node.data_map.furnes_nr.has_content}
            	      <td class="number_170">{attribute_view_gui attribute=$node.data_map.furnes_nr}</td>
            	      {/if}
            	      
            	     <td  class="product-title">
					<a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.name}</a>
            	     </td>
            	      
            	      {if eq($node.object.data_map.material.value.0, 0|not)}
            	      {def $value = $node.data_map.material.data_text}
	
            	      <td class="number_80">
            	      {$node.data_map.material.contentclass_attribute.content.options.$value.name|i18n( 'hamjern/types' )}
            	      </td>
            	      {/if}
            	      
            	      {if eq($node.object.data_map.standard.value.0, 0|not)}
            	      <td class="number_80"> {attribute_view_gui attribute=$node.data_map.standard}</td>
            	      {/if}
            	      
            	      {if eq($node.object.data_map.class.value.0, 0|not)}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.class}</td>
            	      {/if}
        	      
            	      {if $node.data_map.weight_pcs.has_content}
            	      <td class="number_80">{attribute_view_gui attribute=$node.data_map.weight_pcs}</td>
            	      {/if}
          	      </tr>
</table>

</div>
