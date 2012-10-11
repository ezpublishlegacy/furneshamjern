<div class="class-nettside float-break">
{def $image= ''
	$url= ''
	$width= ''
	$height= ''
	$title= ''
	$imagetitle = ''}
	
{* Infobox - Block view *}
{if $node.object.data_map.url.has_content}
	{set $url = $node.object.data_map.url.content}
{/if}

{if $node.object.data_map.int_url.value}
	{if eq($node.object.data_map.int_url.value.content_class.identifier, file)}
	{def $linker=fetch( content, node, hash( node_id, $node.object.data_map.int_url.value.main_node_id ) )}
	{set $url = concat("content/download/",$linker.data_map.file.contentobject_id,"/",$linker.data_map.file.id,"/version/",$linker.data_map.file.version,"/file/",$linker.data_map.file.content.original_filename)}
	{else}
	{set $url = $node.object.data_map.int_url.value.main_node.url}
	{/if}
{/if}

{if $node.object.data_map.image.has_content}
  <div class="attribute-image-center">
  	<div class="imagetitle">
  	{if $url}
  	<a href="{$url}">
  	{/if}
  	 {attribute_view_gui attribute=$node.object.data_map.image image_class='original'}	
	{if $url}	
	</a>
	{/if}
</div>
</div>
{/if}

{if $node.object.data_map.show_header.content}
	 {if $node.object.data_map.image.has_content|not}
    <div class="block-header standard">
            <h1>{attribute_view_gui attribute=$node.object.data_map.header}</h1>
	</div>
	{/if}
{/if}

{if $node.object.data_map.show_header.content|not}
	{if $node.object.data_map.image.has_content}
  <div class="attribute-image-center">
  	{if $url}
  	<a href="{$url}">
  	{/if}
  	 {attribute_view_gui attribute=$node.object.data_map.image image_class='original'}
	 
	{if $url}
	</a>
	{/if}
  </div>
	{/if}
{/if}

{if $node.object.data_map.content}
        <div class="attribute-content">
            {attribute_view_gui attribute=$node.object.data_map.content}
        </div>
{/if}
{include uri="design:parts/edit_single.tpl"}
</div>