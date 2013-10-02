<tr>
	<td class="listing {$listing.status}" id="tdlisting{$listing.id}">

	<fieldset class="{$listing.status}">

	<div class="listing-legend">
		<legend align="right">{print_img fl="featured.png" alt=$lang.featured title=$lang.featured full=true}</legend>
	</div>
	<div class="listing-block clearfix">
		{if $config.thumbshot}
			{if isset($listing.$instead_thumbnail) and $listing.$instead_thumbnail neq ''}
				<div class="listing-preview-block">
					<a href="{$listing.url}">
						<img src="{$smarty.const.ESYN_URL}uploads/{$listing.$instead_thumbnail}" />
					</a>
				</div>
			{else}
				<div class="preview listing-preview-block">
					<a href="{$listing.url}">
						<img src="http://open.thumbshots.org/image.pxf?url={$listing.url}" alt="{$listing.url}" />
					</a>
				</div>
			{/if}
		{/if}
	
		<div class="title">
			{if isset($listing.crossed) && $listing.crossed eq '1'}@{/if}<a href="{print_listing_url listing=$listing}" {if !$config.forward_to_listing_details && $config.new_window}target="_blank"{/if} class="countable listings title" id="lnk_{$listing.id}">{$listing.title}</a>
			
			{if isset($listing.interval) && (1 eq $listing.interval)}
				{print_img fl="new.gif" alt=$lang.new full=true}
			{/if}

			{if isset($listing.rank)}
				{section name=star loop=$listing.rank}{print_img fl="star.png" full=true}{/section}
			{/if}
		</div>

		<div class="description">{$listing.description}</div>

		<div class="url{if $config.thumbshot} display-thumb{/if}">{$listing.url}</div>
		<input type="hidden" value="{if isset($instead_thumbnail) && ($listing.$instead_thumbnail neq '')}{$smarty.const.ESYN_URL}uploads/{$listing.$instead_thumbnail}{/if}" />

		{if $config.pagerank}
			{print_pagerank pagerank=$listing.pagerank label=true}
		{/if}

		{esynHooker name="listingDisplayBeforeStats"}

		<div class="stat">({$lang.clicks}: {$listing.clicks};
			{esynHooker name="listingDisplayFieldsArea"}

			{$lang.listing_added}: {$listing.date|date_format:$config.date_format})

			<a href="{print_listing_url listing=$listing details=true}" class="countable listings" id="view_{$listing.id}">{print_img fl="info_16.png" full=true alt=$lang.listing_details title=$lang.listing_details}</a>

			{if $esynAccountInfo.id eq $listing.account_id}
				<a href="{$smarty.const.ESYN_URL}suggest-listing.php?edit={$listing.id}">{print_img fl="edit_16.png" full=true alt=$lang.edit_listing title=$lang.edit_listing}</a>
			{/if}

			{if $config.broken_listings_report && not ($esynAccountInfo.id eq $listing.account_id)}
				<a href="#" class="actions_broken_{$listing.id}" rel="nofollow">{print_img fl="report_16.png" full=true alt=$lang.report_broken_listing title=$lang.report_broken_listing}</a>
			{/if}

			{if $esynAccountInfo}
				{if $esynAccountInfo.id neq $listing.account_id}
					<span id="af_{$listing.id}">
					{if isset($listing.favorite) && !$listing.favorite}
						<a href="#" class="actions_add-favorite_{$listing.id}_{$esynAccountInfo.id}" rel="nofollow">{print_img fl="favorites-add_16.png" full=true alt=$lang.add_to_favorites title=$lang.add_to_favorites}</a>
					{else}
						<a href="#" class="actions_remove-favorite_{$listing.id}_{$esynAccountInfo.id}" rel="nofollow">{print_img fl="favorites-remove_16.png" full=true alt=$lang.remove_from_favorites title=$lang.remove_from_favorites}</a>
					{/if}
					</span>
				{/if}
			{/if}

			{if isset($listing.crossed) && $listing.crossed eq '0' && $esynAccountInfo.id eq $listing.account_id}
				<a href="#" class="actions_move_{$listing.id}_{$listing.category_id}">{print_img fl="move_16.png" full=true alt=$lang.move_listing title=$lang.move_listing}</a><br />
				{if $smarty.const.ESYN_REALM eq 'account_listings'}{$lang.category}: <a href="{$smarty.const.ESYN_URL}{if $config.mod_rewrite}{if $config.use_html_path}{$listing.path|cat:".html"}{else}{$listing.path}{/if}{else}index.php?category={$listing.category_id}{/if}">{$listing.category_title|escape:"html"}</a><br />{/if}
			{/if}

			{esynHooker name="listingDisplayLinksArea"}

		</div>
	</div>
	</fieldset>
	</td>
</tr>
