<div id="header">
            	<div class="logo"><a href={"/"|ezurl}><img src={"logo.png"|ezimage} width="213" height="45" alt="Furnes hamjern"></a></div>
                <div class="flags">
                	<a id="nor" class="flag" href="http://furnes-hamjern.no"></a>
                	<a id="swe" class="flag active_flag" href="http://furnes-hamjern.se"></a>
                    <a id="dan" class="flag" href="http://www.randersjern.dk/"></a>    
                </div>
                <div class="header_menu">
                {if $current_user.is_logged_in}
                <a class="login" href="/user/logout">E</a>
                {else}
                 	<a class="login" href="/user/login">L</a>
                 {/if}
                	<a href="http://www.oyhovden-invest.no/" target="_blank"><img src={"konsern_icon.png"|ezimage} />
                	Koncern</a>
                	{*
                	<a href={'org'|ezurl}><img src={"org_kart.png"|ezimage} />
                	Org. Kart</a>
                    <a href={'fdv'|ezurl}><img src={"fdv_icon.png"|ezimage} />
                    FDV</a>*}
                    <a href="swe/content/view/sitemap/2"><img src={"sitemap_icon.png"|ezimage} />Webbkarta</a>                
      				</div>
</div>
