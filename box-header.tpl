<div class="box" {if isset($id)}id="block_{$id}"{/if}>
	<div class="box-caption-{$style}" {if isset($id)}id="caption_{$id}"{/if}>
		{if isset($rss) && !empty($rss)}
			<a href="{$rss}">{print_img fl="xml.gif" full=true style="vertical-align: middle;"}</a>
		{/if} <h4>{$caption}</h4> {esynHooker name="blockHeader"}
	</div>
	<div class="box-content-{$style}{if isset($collapsible) && $collapsible eq '1'} collapsible{/if}" {if isset($id)}id="content_{$id}"{/if}>

