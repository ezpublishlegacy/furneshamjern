  <!-- Footer area: START -->
  <div id="footer" class="clearfix">
{def $footer=fetch( 'content', 'node', hash( 'node_id', 2 ) )}
{foreach $footer.children as $childs}
	{if eq($childs.data_map.title.content, 'footer')}
			<div id="footer-left">
			<strong id="footer-heading" class="clearfix">{$childs.data_map.short_title.content}</strong>
			{attribute_view_gui attribute=$childs.data_map.intro}
			</div>
			<div id="footer-right">
			{attribute_view_gui attribute=$childs.data_map.body}
			</div>
	{/if}
		{include uri="design:parts/edit_single.tpl"}
{/foreach}
	<div id="logomap">
		<img src={"logomap.png"|ezimage} />
	</div>
  </div>
  <!-- Footer area: END -->
