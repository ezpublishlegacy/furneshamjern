{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-2items">

<!-- BLOCK BORDER INSIDE: START -->


<!-- BLOCK CONTENT: START -->

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}

{delimiter}

{/delimiter}

{/foreach}

<!-- BLOCK CONTENT: END -->

<!-- BLOCK BORDER INSIDE: END -->

</div>
<!-- BLOCK: END -->

{undef $valid_nodes}