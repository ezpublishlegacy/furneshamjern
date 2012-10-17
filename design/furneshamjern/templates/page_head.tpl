{cache-block keys=$uri_string}
{def $cur_object=fetch( 'content', 'object', hash( 'object_id', $module_result.content_info.object_id) )}
{default enable_help=true() enable_link=true()}

{let name=Path
     path=$module_result.path
     reverse_path=array()}
  {section show=is_set($module_result.title_path)}
    {set path=$module_result.title_path}
  {/section}
  {section loop=$:path}
    {set reverse_path=$:reverse_path|array_prepend($:item)}
  {/section}

{set-block scope=root variable=site_title}
	{section loop=$Path:reverse_path}{$:item.text|wash}{delimiter} / {/delimiter}{/section}|Furnes-Hamjern SCC as
{/set-block}


{/let}
<title>{$site_title|wash}</title>
<meta property="og:title" content="{$site_title|wash}" />    
    {section show=and(is_set($#Header:extra_data),is_array($#Header:extra_data))}
      {section name=ExtraData loop=$#Header:extra_data}
	      {$:item}
      {/section}
    {/section}

    {* check if we need a http-equiv refresh *}
    {section show=$site.redirect}
    <meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />
    {/section}

    {section name=HTTP loop=$site.http_equiv}
    <meta http-equiv="{$HTTP:key|wash}" content="{$HTTP:item|wash}" />
    {/section}

{section name=meta loop=$site.meta}
{switch match=$meta:key|wash}
{case match=description}
	{section show=is_set($cur_object.data_map.intro)}
	{section show=ne($cur_object.data_map.intro.content, "")}
<meta name="{$meta:key|wash}" content="{$cur_object.data_map.intro.content.output.output_text|striptags|wash|shorten( 400 )}" />
<meta property="og:description" content="{$cur_object.data_map.intro.content.output.output_text|striptags|wash|shorten( 400 )}" />
	{section-else}
<meta name="{$meta:key|wash}" content="{$meta:item|wash}" />
<meta property="og:description" content="{$meta:item|wash}" />
{/section}
{section-else}
<meta name="{$meta:key|wash}" content="{$meta:item|wash}" />
{/section}

{/case}
{case match=keywords}
{section show=is_set($cur_object.data_map.keywords)}
{section show=ne($cur_object.data_map.keywords.content, "")}
<meta name="{$meta:key|wash}" content="{$cur_object.data_map.keywords.content}" />

{section-else}
<meta name="{$meta:key|wash}" content="{$meta:item|wash}" />

{/section}
{section-else}
<meta name="{$meta:key|wash}" content="{$meta:item|wash}" />

{/section}
{/case}

{case}
<meta name="{$meta:key|wash}" content="{$meta:item|wash}" />

{/case}
{/switch}
{/section}
{* Prefer chrome frame on IE 8 and lower, or at least as new engine as possible *}
    <!--[if lt IE 9 ]>
        <meta http-equiv="X-UA-Compatible" content="IE=8,chrome=1" />
    <![endif]-->

    <meta name="MSSmartTagsPreventParsing" content="TRUE" />
    <meta name="generator" content="eZ Publish" />

{if $canonical_link}
    {include uri="design:canonical_link.tpl"}
{/if}

{if $enable_link}
    {include uri="design:link.tpl" enable_help=$enable_help enable_link=$enable_link}
{/if}

{/default}
{/cache-block}
