{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-latest-content">
{if $block.name}
<div class="attribute-header-block">
    <h2>{$block.name|wash()}</h2>
</div>
{/if}
<!-- BLOCK CONTENT: START -->

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}

{delimiter}
<div class="separator"></div>
{/delimiter}

{/foreach}

<!-- BLOCK CONTENT: END -->

</div>
<!-- BLOCK: END -->

{undef $valid_nodes}