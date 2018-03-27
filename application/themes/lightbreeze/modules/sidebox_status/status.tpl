{foreach from=$realms item=realm}
	{$realmId = $realm->getId()}
	<div id="realm_{$realmId}" class="realm_holder {strtolower(get_class($realm->getEmulator()))}">
		<div class="realm_head" title="{$realm->getName()}" onclick="$(this).parent().toggleClass('opened').siblings().removeClass('opened')">
			<table>
				<tbody>
					<tr>
						<td class="r_status {if $realm->isOnline()}online{else}offline{/if}"></td>
						<td class="r_name">{character_limiter($realm->getName(), 15)}</td>
						<td class="r_arrow"></td>
						<td class="r_online_players"><i>{$realm->getOnline()}</i> Players</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="realm_body">
			<div class="inner_body">
				{if $realmId == 1}
					<span class="realm_name">{$realm->getName()}</span> is a instant 80 realm with all necessary lore and features you could ever dream of.
					
					<br />
					<br />
					
					<ul class="features_list">
						<li>3x money</li>
						<li>5x experience</li>
						<li>2x exploration</li>
						<li>8x honor</li>
						<li>6x justice</li>
					</ul>
					
					<div class="side_divider"></div>
					
					Try it out today and get 10x extra XP! - Special offer
					
					<br />
					
					<a href="#" class="yes">yes</a>
				{else if $realmId == 2}
					. . .
				{/if}
			</div>
		</div>
	</div>
{/foreach}

<div id="realmlist">set realmlist <span>{$realmlist}</span></div>