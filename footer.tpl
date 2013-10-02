				<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td valign="top" style="width: 50%;">
						<div id="user1Blocks" class="groupWrapper">
							{include file="parse-blocks.tpl" pos=$blocks.user1|default:null}
						</div>
					</td>
					<td valign="top" style="width: 50%; padding-left: 10px;">
						<div id="user2Blocks" class="groupWrapper">
							{include file="parse-blocks.tpl" pos=$blocks.user2|default:null}
						</div>
					</td>
				</tr>
				</table>
				<div id="bottomBlocks" class="groupWrapper">
					{include file="parse-blocks.tpl" pos=$blocks.bottom|default:null}
				</div>
			</td>
			<!--__s_r-->
			<td class="right-column" valign="top">
				<div id="rightBlocks" class="groupWrapper">
					<!--__s_r_c-->
					{include file="parse-blocks.tpl" pos=$blocks.right|default:null}
					<!--__s_r_ce-->
				</div>
			</td>
			<!--__se_r-->
		</tr>
		</table>

		<!-- verybottom block -->
		<div id="verybottomBlocks" class="groupWrapper">
			{include file="parse-blocks.tpl" pos=$blocks.verybottom|default:null}
		</div>
		<!-- verybottom block -->

	</div>
	<!-- content end -->
	
	<!-- footer start -->
	<div class="footer clearfix">
		{esynHooker name="beforeFooterLinks"}

		{include file="parse-blocks.tpl" pos=$blocks.copyright|default:null}

		{esynHooker name="afterFooterLinks"}		
		<div class="layoutzzz">design by <a title="design by wwww.layoutzzz.com" target="_blank" href="http://www.layoutzzz.com">layoutzzz</a></div>
	</div>
	<!-- footer end -->

</div>
<!-- main page end -->

<noscript>
	<div class="js_notification">{$lang.error_javascript}</div>
</noscript>

{print_img full=true fl="ajax-loader.gif" id="spinner" style="display:none;"}

<!-- thumbs preview start -->
<div class="thumb">
	<div class="loading" style="display: none;">{print_img fl="spinner.gif" full=true class="spinner"}</div>
</div>
<!-- thumbs preview end -->

{esynHooker name="footerBeforeIncludeJs"}

{if $manageMode}
	<div id="mod_box" class="mode">
		{$lang.youre_in_manage_mode}. <a href="?switchToNormalMode=y" style="font-weight: bold; color: #FFF;">{$lang.exit}</a>
	</div>
	{include_file js="js/frontend/visual-mode"}
{/if}

{if isset($smarty.get.preview) || isset($smarty.session.preview)}
	<div id="mod_box" class="mode">
		{$lang.youre_in_preview_mode} <a href="?switchToNormalMode=y" style="font-weight: bold; color: #FFF;">{$lang.exit}</a>
	</div>
{/if}
{if $config.cron}<div style="display:none"><img src="cron.php" width="1" height="1" alt="" /></div>{/if}

{esynHooker name="beforeCloseTag"}

</body>
</html>
