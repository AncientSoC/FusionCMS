{foreach from=$articles item=article key=key}
	<article class="page_content news">
		<div class="page_title">
			{if $key == 0}
				<span class="latest_news">{lang("lightbreeze_news_latest_news", "theme_lightbreeze")}</span>
				{if $pagination}<div class="lb_news_pagination">{$pagination}</div>{/if}
			{/if}
			
			<h2><a href="{$url}news/view/{$article.id}" title="{$article.headline}">{character_limiter($article.headline, 30)}</a></h2>
			
			<span class="author_comment">
				{lang("posted_by", "news")} <a href="{$url}profile/{$article.author_id}" data-tip="{lang("view_profile", "news")}">{$article.author}</a> {lang("on", "news")} <i>{$article.date}</i>{if $article.comments != -1}, <a {$article.link} class="comments_button" {$article.comments_button_id} data-comments-container="#comments_{$article.id}">{lang("comments", "news")} {$article.comments}</a>{/if}
			</span>
		</div>
		
		<div class="page_body">
			{if $article.avatar}
				<div class="avatar">
					<img src="{$article.avatar}" alt="{$article.author}{lang("lightbreeze_global_user_avatar", "theme_lightbreeze")}" height="120" width="120">
				</div>
			{/if}
			
			<div class="news_content">
				{$article.content}
			</div>
			
			<div class="clear"></div>
			
			{if $article.tags}
				<div class="news_foot">
					{foreach from=$article.tags item=tag}
						<a href="{$url}/news/{$tag.name}">{$tag.name}</a>
					{/foreach}
				</div>
			{/if}
		</div>
	</article>
	
	<div class="comments" {$article.comments_id}></div>
{/foreach}

<script type="text/javascript">
	$('.page_content.news').on('click', 'a.comments_button', function() {
		container = $($(this).data('comments-container'));
		if(!container || !container.length)
			return;
		
		if($(container).toggleClass('opened').hasClass('opened'))
			$('html, body').animate({ scrollTop: $(container).offset().top - 100 });
	});
</script>