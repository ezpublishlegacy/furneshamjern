{*?template charset=utf8?*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
<head>
{section name=JavaScript loop=ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) }
    <script language="JavaScript" type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/section}
    <link rel="stylesheet" type="text/css" href={"stylesheets/core.css"|ezdesign} />
	<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} />
<style type="text/css">
{section var=css_file loop=ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' )}
    @import url({concat( 'stylesheets/',$css_file )|ezdesign});
{/section}
</style>
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} />
{include uri="design:page_head.tpl" enable_print=false()}
</head>

{* To simplify IE css targeting. IE9 conforms, so threat as rest *}
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]>   <body class="ie7"><![endif]-->
<!--[if IE 8 ]>   <body class="ie8"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><body><!--<![endif]-->
<!-- Complete page area: START -->

<div id="wrap">
	<div id="main_print" class="clearfix">

{* Main area START *}
{include uri="design:page_mainarea.tpl"}
{* Main area END *}
</div>
</div>
</body>
</html>
