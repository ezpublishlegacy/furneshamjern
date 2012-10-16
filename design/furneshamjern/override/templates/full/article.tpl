{* Article - Full view *}
{if $node.object.data_map.global_hide.data_int}
{ezpagedata_set( 'extra_menu', false() )}
{/if}
    <div class="{if $node.object.data_map.global_hide.data_int}content-view-full-folder{else}content-view-full{/if}">
        <div class="class-article">

        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        <p class="date">
             {$node.object.published|l10n(shortdatetime)}
        </p>
        </div>
        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}

        </div>

        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                    {attribute_view_gui attribute=$node.data_map.image image_class=medium}

                    {if $node.data_map.caption.has_content}
                    <div class="caption" style="width: {$node.data_map.image.content.medium.width}px">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
            {/if}
        {/if}

        {if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.intro.content.is_empty|not}
          
                    {attribute_view_gui attribute=$node.data_map.intro}

            {/if}
        {/if}

        {if $node.data_map.body.content.is_empty|not}

                {attribute_view_gui attribute=$node.data_map.body}

        {/if}



        {include uri='design:parts/related_content.tpl'}

        {if is_unset( $versionview_mode )}
        {if $node.data_map.enable_comments.data_int}
            <h1>{"Comments"|i18n("design/ezwebin/full/article")}</h1>
                <div class="content-view-children">
                    {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                        {node_view_gui view='line' content_node=$comment}
                    {/foreach}
                </div>

                {if fetch( 'content', 'access', hash( 'access', 'create',
                                                      'contentobject', $node,
                                                      'contentclass_id', 'comment' ) )}
                    <form method="post" action={"content/action"|ezurl}>
                    <input type="hidden" name="ClassIdentifier" value="comment" />
                    <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                    <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                    <input class="button new_comment" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
                    </form>
                {else}
                    {if ezmodule( 'user/register' )}
                        <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/article', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                    {else}
                        <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezwebin/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                    {/if}
                {/if}
        {/if}
        {/if}
        </div>
    </div>