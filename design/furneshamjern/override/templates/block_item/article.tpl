<div class="article float-break">
    <div class="attribute-news-header">
        <h3><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h3>  
    </div>
    <div class="attribute-short">
        <i>Publisert: {$node.object.published|l10n( 'date' )}</i><br />
        {attribute_view_gui attribute=$node.data_map.intro}
        
        {if $node.data_map.body.content.is_empty|not}
        <strong><a href={$node.url_alias|ezurl}>Les mer..</a></strong>
        {/if}
    </div>
{include uri="design:parts/edit_single.tpl"}
</div>