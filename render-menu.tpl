{assign var="place" value=$block.position}

{if $place eq 'mainmenu' || $place eq 'inventory'}
	{if $place eq 'mainmenu'}<div class="top-menu"><ul class="menu clearfix">{/if}
		{foreach from=$block.contents item=menu}
			{if $menu.name eq $smarty.const.ESYN_REALM}
				<li class="active">{$menu.title}</li>
			{else}
				<li><a href="{$menu.url}" {if $menu.nofollow eq '1'}rel="nofollow"{/if} {if $menu.new_window eq '1'}target="_blank"{/if}>{$menu.title}</a></li>
			{/if}
		{/foreach}
	{if $place eq 'mainmenu'}</ul></div>{/if}
{elseif $place eq 'left' || $place eq 'right' || $place eq 'user1' || $place eq 'user2' || $place eq 'top' || $place eq 'verytop' || $place eq 'bottom' || $place eq 'verybottom' || $place eq 'center'}
	{if $block.name eq 'account' && !empty($esynAccountInfo)}
		{$lang.welcome}, <strong>{$esynAccountInfo.username}</strong>!
	{/if}
	{if count($block.contents) > 0}
		<ul class="account-menu horizontal">
		{foreach from=$block.contents item=menu}
			{if $menu.name eq $smarty.const.ESYN_REALM}
				<li class="active"><span>{$menu.title}</span></li>
			{else}
				<li><a href="{$menu.url}" {if $menu.nofollow eq '1'}rel="nofollow"{/if} {if $menu.new_window eq '1'}target="_blank"{/if}>{$menu.title}</a></li>
			{/if}
		{/foreach}
		</ul>
	{/if}
{elseif $place eq 'copyright'}
	{foreach from=$block.contents item=menu name="copyright_menu"}
		{if $menu.name eq $smarty.const.ESYN_REALM}
			{$menu.title}
		{else}
			<a href="{$menu.url}" {if $menu.nofollow eq '1'}rel="nofollow"{/if} {if $menu.new_window eq '1'}target="_blank"{/if}>{$menu.title}</a>
		{/if}

		{if not $smarty.foreach.copyright_menu.last} | {/if}
	{/foreach}
{else}
	<!--__ms_{$block.id}-->
	{if $block.show_header or isset($manageMode)}
		<div class="menu_header">{$block.title}</div>
	{else}
		<div class="menu">
	{/if}
	<!--__ms_c_{$block.id}-->
		{foreach from=$block.contents item=menu name="menu_name"}
			{if $menu.name eq $smarty.const.ESYN_REALM}
				<span class="active">{$menu.title}</span>
				{if not $smarty.foreach.menu_name.last} | {/if}
			{else}
				<span><a href="{$menu.url}" {if $menu.nofollow eq '1'}rel="nofollow"{/if} {if $menu.new_window eq '1'}target="_blank"{/if}>{$menu.title}</a></span>
				{if not $smarty.foreach.menu_name.last} | {/if}
			{/if}
		{/foreach}
	<!--__me_c_{$block.id}-->
	{if $block.show_header or isset($manageMode)}
	
	{else}
		</div>
	{/if}
	<!--__me_{$block.id}-->
{/if}
