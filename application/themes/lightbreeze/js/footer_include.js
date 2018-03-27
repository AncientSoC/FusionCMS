/*
 CSS Browser Selector js v0.5.3 (July 2, 2013)

 -- original --
 Rafael Lima (http://rafael.adm.br)
 http://rafael.adm.br/css_browser_selector
 License: http://choosealicense.com/licenses/mit/
 Contributors: http://rafael.adm.br/css_browser_selector#contributors
 -- /original --

 Fork project: http://code.google.com/p/css-browser-selector/
 Song Hyo-Jin (shj at xenosi.de)
 */
function css_browser_selector(e){var i=e.toLowerCase(),r=function(e){return i.indexOf(e)>-1},t="gecko",o="webkit",a="safari",n="chrome",s="opera",d="mobile",c=0,l=window.devicePixelRatio?(window.devicePixelRatio+"").replace(".","_"):"1",p=[!/opera|webtv/.test(i)&&/msie\s(\d+)/.test(i)&&(c=1*RegExp.$1)?"ie ie"+c+(6==c||7==c?" ie67 ie678 ie6789":8==c?" ie678 ie6789":9==c?" ie6789 ie9m":c>9?" ie9m":""):/edge\/(\d+)\.(\d+)/.test(i)&&(c=[RegExp.$1,RegExp.$2])?"ie ie"+c[0]+" ie"+c[0]+"_"+c[1]+" ie9m edge":/trident\/\d+.*?;\s*rv:(\d+)\.(\d+)\)/.test(i)&&(c=[RegExp.$1,RegExp.$2])?"ie ie"+c[0]+" ie"+c[0]+"_"+c[1]+" ie9m":/firefox\/(\d+)\.(\d+)/.test(i)&&(re=RegExp)?t+" ff ff"+re.$1+" ff"+re.$1+"_"+re.$2:r("gecko/")?t:r(s)?s+(/version\/(\d+)/.test(i)?" "+s+RegExp.$1:/opera(\s|\/)(\d+)/.test(i)?" "+s+RegExp.$2:""):r("konqueror")?"konqueror":r("blackberry")?d+" blackberry":r(n)||r("crios")?o+" "+n:r("iron")?o+" iron":!r("cpu os")&&r("applewebkit/")?o+" "+a:r("mozilla/")?t:"",r("android")?d+" android":"",r("tablet")?"tablet":"",r("j2me")?d+" j2me":r("ipad; u; cpu os")?d+" chrome android tablet":r("ipad;u;cpu os")?d+" chromedef android tablet":r("iphone")?d+" ios iphone":r("ipod")?d+" ios ipod":r("ipad")?d+" ios ipad tablet":r("mac")?"mac":r("darwin")?"mac":r("webtv")?"webtv":r("win")?"win"+(r("windows nt 6.0")?" vista":""):r("freebsd")?"freebsd":r("x11")||r("linux")?"linux":"","1"!=l?" retina ratio"+l:"","js portrait"].join(" ");return window.jQuery&&!window.jQuery.browser&&(window.jQuery.browser=c?{msie:1,version:c}:{}),p}!function(e,i){var r=css_browser_selector(navigator.userAgent),t=e.documentElement;t.className+=" "+r;var o=r.replace(/^\s*|\s*$/g,"").split(/ +/);i.CSSBS=1;for(var a=0;a<o.length;a++)i["CSSBS_"+o[a]]=1;var n=function(i){return e.documentElement[i]||e.body[i]};i.jQuery&&!function(e){function r(){if(0==m){try{var e=n("clientWidth"),i=n("clientHeight");if(e>i?u.removeClass(a).addClass(s):u.removeClass(s).addClass(a),e==b)return;b=e}catch(r){}m=setTimeout(o,100)}}function o(){try{u.removeClass(w),u.addClass(360>=b?d:640>=b?c:768>=b?l:1024>=b?p:"pc")}catch(e){}m=0}var a="portrait",s="landscape",d="smartnarrow",c="smartwide",l="tabletnarrow",p="tabletwide",w=d+" "+c+" "+l+" "+p+" pc",u=e(t),m=0,b=0;i.CSSBS_ie?setInterval(r,1e3):e(i).on("resize orientationchange",r).trigger("resize"),e(i).load(r)}(i.jQuery)}(document,window);

/*-------------------------------------------------------------------------*/
/*	Custom
/*-------------------------------------------------------------------------*/
var CustomJS = {
	initialize: function()
	{
		this._initialize();
		this.visualizeInput();
		this.visualizeSelect();
	},



	visualizeInput: function()
	{
		// Call iCheck
		if(typeof $.fn.iCheck !== 'undefined')
		{
			$('input').iCheck().on('ifChanged', function() {
				$(this).trigger('change');
			});
		}
	},

	visualizeSelect: function()
	{
		if(typeof $.selectbox === 'undefined')
		{
			console.log('Trying to visualize selects, but library didn\'t load successfully.');
			return;
		}

		// Call selectbox
		$('select:not([sb])').each(function() {
			$(this).selectbox({
				onChange: function (value) {
					$(this).val(value).change();
				}
			}).next('div.sbHolder').attr('style', $(this).attr('style')).show();
		});
	},

	toggleLogin: function(event, element)
	{
		event.preventDefault ? event.preventDefault() : event.returnValue = false;

		container = $('#login-box-container');
		if(!container || !container.length)
			return false;

		if(container.data('window'))
		{
			container.stop(true, true).fadeOut('fast').data('window', 0);
			return true;
		}

		wWidth = $(window).innerWidth(),
		wHeight = $(window).innerHeight();

		// Set the holder height and position it to center
		container.find('> .login-box-holder').css({
			top: wHeight / 2,
			marginTop: -(container.find('> .login-box-holder').height() / 2)
		});

		// bind the close event after 1500 ms
		setTimeout(function()
		{
			container.on('click', function(e) {
				if($(e.target).data('window'))
					container.fadeOut('fast').data('window', 0);
			});

			// close the box on pressing escape key
			$(document).keyup(function(e)
			{
				// if escape key
				if(e.keyCode == 27) 
				{
					// if the container is open only
					if(container.data('window'))
						container.fadeOut('fast').data('window', 0);
				}
			});
		}, 1500);

		// Display the popup box now
		container.css({ width: wWidth, height: wHeight }).fadeIn('fast').data('window', 1);
	}
};

/*-------------------------------------------------------------------------*/
/*	Active menu
/*-------------------------------------------------------------------------*/
$('a:not([href^="javascript:"], [href^="#"])').on('click', function() {
	if(($(this).prop('target') || '_self') != '_self')
		return;

	// Remove all active links
	$('a.active').removeClass('active');

	// Active all links with same url
	$('a[href="' + $(this).prop('href') + '"]').addClass('active');
});

/*-------------------------------------------------------------------------*/
/*	Dropdown menu
/*-------------------------------------------------------------------------*/
$('#main_menu li .navi-dropdown').each(function() {
	$(this).css('left', -($(this).outerWidth() / 2) + ($(this).parent().prev('a').outerWidth() / 2));
});

/*-------------------------------------------------------------------------*/
/*	News feed: call sly
/*-------------------------------------------------------------------------*/
var sly_holder = $('#news_feed');
var sly = new Sly(window.frr = sly_holder.find('.frame'), {
	smart: 1,
	speed: 700,
	moveBy: 600,
	startAt: 2,
	itemNav: 'forceCentered',
	clickBar: 1,
	scrollBy: 0,
	horizontal: 1,
	dragHandle: 1,
	releaseSwing: 1,
	dynamicHandle: 0,
	touchDragging: 1,
	elasticBounds: 1,
	mouseDragging: 1,
	activateMiddle: 1,
	scrollBar: sly_holder.find('.scrollbar'),

	// Buttons
	prev: sly_holder.find('.prev'),
	next: sly_holder.find('.next'),
}).init()

$.get(Config.URL + 'news/rss', function(data) {
	var $RSS = $(data);

	$RSS.find("item").each(function() {
		var $this = $(this),
			item = {
				id:				$this.find('guid').text(),
				link:			$this.find("link").text(),
				title:			$this.find("title").text(),
				author:			$this.find("author").text(),
				description:	$this.find("description").text(),
				pubDate:		new Date($this.find("pubDate").text())
			},
			formattedDate = item.pubDate.getDate() + "/" + item.pubDate.getMonth() + "/" + item.pubDate.getFullYear();

		item.title.length > 45 ? limitedTitle = item.title.substring(0, 45) + ". . ."
							   : limitedTitle = item.title;

		sly_holder.find('.loading_ajax').fadeOut(300, function() {
			sly_holder.find('.hidden').fadeIn(300);
		});

		sly.add('<li id="article_' + item.id + '">'
				  + '<span class="item_frame">'
				    + '<span class="item_image" style="background-image:url(' + Config.image_path + 'sly/1.jpg)"></span>'
				  + '</span>'
				  + '<a href="' + item.link + '" class="item_title" title="' + item.title + '">' + limitedTitle + '</a>'
				  + '<div class="item_info_link">'
				    + '<span>On <i>' + formattedDate + '</i></span>'
					+ '<a href="' + Config.URL + 'news/view/' + item.id + '">Read more</a>'
				  + '</div>'
			  + '</li>');

		// force center sly
		sly.toCenter();
	});
});

/*-------------------------------------------------------------------------*/
/*	Copyright
/*-------------------------------------------------------------------------*/
console.log('-----------------------------------------------------------------------\n'
		  + ' Lightbreeze theme Designed by ZafireHD & Coded by E. Darksider\n'
		  + ' Contact me for FusionCMS coding services through skype : darkstriders\n'
		  + ' Best wishes, ~ E. Darksider.\n'
		  + '-----------------------------------------------------------------------');