  <!-- Path content: START -->
  <p>
  {foreach $pagedata.path_array as $path}
  {def $object=fetch( 'content', 'node', hash( 'node_id', $path.node_id  ) )}
  {if $object.object.data_map.hide_path.data_int|not}
  {if $path.url}
    <a href={cond( is_set( $path.url_alias ), $path.url_alias,
                                        $path.url )|ezurl}>{$path.text|wash} </a> <span class="path-separator"> / </span>
  {else}
    <span class="path-text">{$path.text|wash}</span>
  {/if}
  {/if}
  {/foreach}
  </p>
  <!-- Path content: END -->