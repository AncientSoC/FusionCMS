{$head}
	<body oncontextmenu="return false" onmousedown="event.which == 3">
	
		<script type="text/javascript">
			/* Extra CSS */
			$('head').append (
				'<link rel="stylesheet" type="text/css" href="{$style_path}selectbox.css" />'
			  + '<link rel="stylesheet" type="text/css" href="{$style_path}radiocheck.css" />'
			  {if !$isOnline}+ '<link rel="stylesheet" type="text/css" href="{$style_path}loginbox.css" />'{/if}
			  + '<link rel="stylesheet" type="text/css" href="{$style_path}custom.css" />'
			);
			/* Extra CSS.End */
		</script>
		
		{$modals}
		
		<div class="main_container">
		
			<!-- HEADER -->
			<header id="header">
				<div class="holder">
				
					<!-- Navigation -->
					<div class="navigation">
						<div class="left">
							<ul id="main_menu">
								{foreach from=$menu_top key=key item=menu}
									<li><a {if preg_match("%{preg_quote($url|cat:$CI->router->fetch_class())}%i", $menu.link)}class="active"{/if} {$menu.link}>{$menu.name}</a></li>
									
									{if $key == 1}
										<!-- Dropdown -->
										<li class="dropdown">
											<a href="#">Dropdown</a>
											<div class="dropdown-holder">
												<ul class="navi-dropdown">							
													<li><a href="#">How to</a></li>
													<li><a href="#">Terms of Use</a></li>
													<li><a href="#">References</a></li>
													<li><a href="#">Rules</a></li>
												</ul>
											</div>
										</li>
										<!-- Dropdown.End -->
									{/if}
								{/foreach}
							</ul>
						</div>
						
						<div class="right">
							<ul id="sec_menu">
								{if $isOnline}
									<li><a href="{$url}ucp" class="btn_1">{lang("lightbreeze_sec_menu_ucp", "theme_lightbreeze")}</a></li>
									<li><span>{lang("lightbreeze_sec_menu_or", "theme_lightbreeze")}</span></li>
									<li><a href="{$url}logout" class="btn_2">{lang("lightbreeze_sec_menu_logout", "theme_lightbreeze")}</a></li>
								{else}
									<li><a href="{$url}register" class="btn_2">{lang("lightbreeze_sec_menu_register", "theme_lightbreeze")}</a></li>
									<li><span>{lang("lightbreeze_sec_menu_or", "theme_lightbreeze")}</span></li>
									<li><a href="#" id="home_login" class="btn_1" onclick="toggleLogin(event, this)">{lang("lightbreeze_sec_menu_login", "theme_lightbreeze")}</a></li>
								{/if}
							</ul>
						</div>
					</div>
					<!-- Navigation.End -->
					
					<!-- Logo Welcome Social -->
					<div id="logo_welcome_social">
						<h1><a href="{$url}" class="logo" title="{sprintf(lang("lightbreeze_logo_title", "theme_lightbreeze"), $serverName)}">{$serverName}</a></h1>
						
						<div class="social">
							<div class="body">
								<ul id="social_buttons">
									<li class="btn_fb"><a href="https://www.facebook.com/" target="_blank" title="{lang("lightbreeze_social_facebook_title", "theme_lightbreeze")}"></a></li>
									<li class="btn_tw"><a href="https://twitter.com/" target="_blank" title="{lang("lightbreeze_social_twitter_title", "theme_lightbreeze")}"></a></li>
									<li class="btn_yt"><a href="https://www.youtube.com/" target="_blank" title="{lang("lightbreeze_social_youtube_title", "theme_lightbreeze")}"></a></li>
									<li class="btn_sk"><a href="http://www.skype.com/" target="_blank" title="{lang("lightbreeze_social_skype_title", "theme_lightbreeze")}"></a></li>
								</ul>
							</div>
						</div>
						
						<div class="welcome">
							<div class="welcome_body">
								<span>{sprintf(lang("lightbreeze_welcome_title", "theme_lightbreeze"), "<i>{preg_replace('/[\-]/', ' ', $serverName)}</i>")}</span>
								<p>
									{lang("lightbreeze_welcome_message_p1", "theme_lightbreeze")}
									
									<br />
									<br />
									
									<span>{lang("lightbreeze_welcome_message_p2", "theme_lightbreeze")}</span>
									
									<br />
									<br />
									
									<a href="#" class="read_more">{lang("lightbreeze_welcome_message_readmore", "theme_lightbreeze")}</a>
								</p>
							</div>
						</div>
					</div>
					<!-- Logo Welcome Social.End -->
					
				</div>
			</header>
			<!-- HEADER.End -->
			
			<!-- Slider -->
			<div id="slider_container" {if !$show_slider}style="display: none;"{/if}>
				<div id="slider">
					{foreach from=$slider item=image}
						{$image.text = explode('[|]', $image.text)}
						
						<img src="{$image.image}" width="1007" height="337" alt="{reset($image.text)}" title="<span>{reset($image.text)}</span><i>{next($image.text)}</i><a href='{$image.link}'>{next($image.text)}</a>" />
					{/foreach}
				</div>
			</div>
			<!-- Slider.End -->
			
			<!-- Body -->
			<div class="main_b_holder">
			
				<!-- News feed -->
				<div id="news_feed" class="news_sly">
					<div class="loading_ajax">
						<img src="{$image_path}ajax.gif" alt="{lang("lightbreeze_global_loading", "theme_lightbreeze")}" height="48" width="48" />
					</div>
					
					<div class="frame">
						<ul class="slidee"></ul>
					</div>
					
					<button class="prev hidden"></button>
					<button class="next hidden"></button>
					
					<div class="scrollbar hidden">
						<div class="handle"></div>
					</div>
				</div>
				<!-- News feed.End -->
				
				<div class="content_holder">
					<!-- Body Content start here -->
					
					<!-- Main side -->
					<aside id="right">
						{$page}
					</aside>
					<!-- Main side.End -->
					
					<!-- Sidebar -->
					<aside id="left">
						{$sideboxes_data = $CI->cms_model->getSideboxes()}
						{foreach from=$sideboxes key=key item=sidebox}
							<section id="sidebox{if $sideboxes_data[$key].type != 'custom'}_{$sideboxes_data[$key].type}{/if}" class="sidebox{if $sideboxes_data[$key].type == 'custom'} custom{/if}">
								<h4 class="sidebox_title">{$sidebox.name}</h4>
								<div class="sidebox_body">
									{$sidebox.data}
								</div>
							</section>
						{/foreach}
					</aside>
					<!-- Sidebar.End -->
					
					<!-- Body Content end here -->
				</div>
				
			</div>
			<!-- Body.End -->
			
			<!-- FOOTER -->
			<footer id="footer">
				<div class="holder">
					<div class="left">
						<ul id="footer_links">
							<li><a href="#">Home</a></li>
							<li><a href="#">Support</a></li>
							<li><a href="#">Info</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Register</a></li>
							<li><a href="#">Login</a></li>
							<li><a href="#">Forums</a></li>
						</ul>
						
						<div class="clear"></div>
						
						<span>
							{sprintf(lang("lightbreeze_footer_copyright_rights", "theme_lightbreeze"), "<strong>{preg_replace('/\-?wow/i', '', $serverName)}</strong>")}<br />
							{sprintf(lang("lightbreeze_footer_copyright_created_for", "theme_lightbreeze"), "<i>{$serverName}</i>")}
						</span>
					</div>
					
					<div class="right">
						<a href="{$url}" class="logo" title="{sprintf(lang("lightbreeze_logo_title", "theme_lightbreeze"), $serverName)}">{$serverName}</a>
						
						<span>
							{lang("lightbreeze_footer_ZafireHD", "theme_lightbreeze")}<br />
							{lang("lightbreeze_footer_EDarksider", "theme_lightbreeze")}
						</span>
					</div>
				</div>
			</footer>
			<!-- FOOTER.End -->
			
		</div>
		
		{if !$isOnline}
			<!-- Login Form -->
			<div id="login-box-container">
				<div class="login-box-holder">
					<div class="login-box-head">
						{lang("lightbreeze_login_title", "theme_lightbreeze")}
					</div>
					<div class="clear"></div>
					
					<div class="login-box-body">
						{form_open('login')}
							<input type="text" name="login_username" id="login_username" value="" placeholder="{lang("lightbreeze_login_username", "theme_lightbreeze")}" autocomplete="off" />
							<input type="password" name="login_password" id="login_password" value="" placeholder="{lang("lightbreeze_login_password", "theme_lightbreeze")}" autocomplete="off" />
							<div class="clear"></div>
							
							<div class="login-box-row">
								<input type="submit" name="login_submit" value="{lang("lightbreeze_login_btn", "theme_lightbreeze")}" />
								<a href="{$url}password_recovery" class="forgot_pw">{lang("lightbreeze_login_forget_password", "theme_lightbreeze")}</a>
							</div>
							<div class="clear"></div>
						</form>
					</div>
				</div>
			</div>
			<!-- Login Form.End -->
		{/if}
		
		<!-- Needed Footer JS -->
		<script type="text/javascript" src="{$path}{$theme_path}js/sly.min.js"></script>
		<script type="text/javascript" src="{$path}{$theme_path}js/selectbox.min.js"></script>
		<script type="text/javascript" src="{$path}{$theme_path}js/radiocheck.min.js"></script>
		<script type="text/javascript" src="{$path}{$theme_path}js/footer_include.js"></script>
		<!-- Needed Footer JS.End -->
		
		<script type="text/javascript">
			{if !$isOnline}
				function toggleLogin(event, element) {
					if(typeof CustomJS !== 'undefined')
						CustomJS.toggleLogin(event, element);
					else
						document.location.replace('login');
				};
			{/if}
			
			if(typeof CustomJS !== 'undefined')
				CustomJS.initialize();
		</script>
		
	</body>
</html>