<table class="toppvp_character">
	<tbody>
		{if $characters}
			{foreach from = $characters key = key item = character}
				<tr>
					<td class="char-rating">{$key + 1}</td>
					<td class="char-name"><a href="{$url}character/{$realm}/{$character.guid}" data-tip="{lang("view_profile", "sidebox_toppvp")}">{$character.name}</a></td>
					<td class="char-class color-c{$character.class}">{$CI->realms->getClass($character.class)}</td>
					<td class="char-kills">{$character.totalKills} <span>{lang("kills", "sidebox_toppvp")}</span></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td class="no_stats">{lang("no_stats", "sidebox_toppvp")}</td>
			</tr>
		{/if}
	</tbody>
</table>