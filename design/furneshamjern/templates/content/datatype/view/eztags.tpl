{if $attribute.content.tag_ids|count}
    {foreach $attribute.content.tags as $tag}
        <a href={concat( '/tags/view/', $tag.url )|ezurl}>{$tag.keyword|wash}</a>{delimiter}, {/delimiter}
    {/foreach}
{/if}