<div>
	<img style="float:left;" alt="{$node.name|wash()}" src="{$node.object.data_map.image.content.original.url}" />
	{if $node.object.data_map.caption.has_content}
	<dl class="infotext">
	<dd><p>{attribute_view_gui attribute=$node.object.data_map.caption}</p></dd>
	</dl>
	{/if}
</div>
