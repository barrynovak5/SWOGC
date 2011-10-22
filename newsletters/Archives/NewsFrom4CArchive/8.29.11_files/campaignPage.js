
Permalink = {};
Permalink.Utils = {};
Permalink.Utils.importScript = function(url, nodeName) 
{
	if (nodeName == null) {
		nodeName = "head";
	}
	
	var script = document.createElement("script"); 
	script.type = "text/javascript"; 
	script.async = true;
	script.src = url;
	var placement = document.getElementsByTagName(nodeName)[0];
	placement.appendChild(script);
};

Permalink.Utils.importStyleSheet = function(url, nodeName) 
{
	if (nodeName == null) {
		nodeName = "head";
	}
	
	var link = document.createElement("link"); 
	link.type = 'text/css';
	link.rel = 'stylesheet';
	link.href = url;
	link.media = 'screen';
	var placement = document.getElementsByTagName(nodeName)[0];
	placement.appendChild(link);
};

Permalink.Utils.parseQueryString = function(query)
{
	var params = {};
	
	if (!query) {
		return params;
	}
	if (query.indexOf("?") > -1) {
		query = query.substring(query.indexOf("?") + 1);
	}
	
	var pairs = query.split(/[;&]/);
	for (var i = 0; i < pairs.length; i++) {
		var idx = pairs[i].indexOf("=");
		var keyVal = [pairs[i].substring(0, idx), pairs[i].substring(idx + 1)];
		if (!keyVal || keyVal.length != 2) {
			continue;
		}
		
		var key = unescape(keyVal[0]);
		var val = unescape(keyVal[1]);
		val = val.replace(/\+/g, ' ');
		params[key] = val;
	}
	
	return params;
};

Permalink.Utils.getScriptParameters = function() 
{
	var scripts = document.getElementsByTagName("script");
	for (var i = 0; i < scripts.length; i++) {
		var src = scripts[i].src;
		var idx = src.indexOf("/campaignPage.js?");
		if (idx > -1) {
			var queryString = src.substring(idx + ("/campaignPage.js".length+1));
			return Permalink.Utils.parseQueryString(queryString);
		}
	}

	return null;
};


Permalink.Events = {};
Permalink.Events.addListener = function(object, type, callback)
{
	var event = "on" + type;

	if (object.addEventListener) {
		object.addEventListener(type, callback, false);
	} else if (object.attachEvent) {
		object.attachEvent(event, callback);
	} else if (object[event] != undefined) {
		try {
			object[event] += callback;
		} catch (Error) {
			object[event] = callback;
		}
	}
};

Permalink.Events.removeListener = function(object, type, callback)
{
	var event = "on" + type;

	if (object.removeEventListener) {
		object.removeEventListener(type, callback);
	} else if (object.attachEvent) {
		object.detachEvent(event, callback);
	} else if (object[event] != undefined) {
		try {
			object[event] -= callback;
		} catch (Error) {
			object[event] = null;
		}
	}
};

// google anylitics account vars...
var _gaq = _gaq || [];
_gaq.push(["_setAccount", "UA-17037590-1"]);
_gaq.push(["_trackPageview"]);

Permalink.CampaignPage = {};
Permalink.CampaignPage.init = function() 
{
	Permalink.Utils.importStyleSheet("css/share-btn.css", "head");
	if (typeof(jQuery) == "undefined") {
		Permalink.Utils.importScript("http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js", "head");
	}

	Permalink.Events.addListener(window, "load", function(e) {
		if (typeof($) == 'function' && $ != jQuery) {
			jQuery.noConflict();
		}
		Permalink.CampaignPage.renderShareBar();
	});
	
	// write the GA code. note that account variables are defined globally above^^^.
	Permalink.Utils.importScript("http://www.google-analytics.com/ga.js", "head");
};

Permalink.CampaignPage.renderShareBar = function() 
{	
	// remove paddings and margins if any...
	jQuery('body').css({padding: '0px', margin: '0px'});
	
	var imageMargins = "0px";
	if (jQuery.browser.mozilla) {
		imageMargins = "-6px";
	} else if (jQuery.browser.msie && jQuery.browser.version < 8) {
		imageMargins = "-2px";
	}
	
	// get paremeters...
	var params = Permalink.Utils.getScriptParameters();
	if (params == null) {
		params.visitorHost = "http://visitor.constantcontact.com";
		params.pageName = "";
		params.soid = 0;
	}

	var ts = (new Date()).getTime();
	var pageUrl = window.location.href;
	// remove hash from page url so to not be shared...
	if (window.location.hash) {
		pageUrl = pageUrl.substring(0, pageUrl.lastIndexOf(window.location.hash));
	}
	
	var pageUrlEscaped = escape(pageUrl);
	var body = jQuery('body');
	
	// tracking targets...
	var isTrackingEnabled = typeof(__plink_targets) != "undefined";
	var targets = {};
	if (isTrackingEnabled) {
		targets = __plink_targets;
	} else {
		targets = {
			"linkedin.post": "http://www.linkedin.com/shareArticle?url="+pageUrlEscaped,
			"addthis.share": "http://www.addthis.com/bookmark.php?v=250&pub=ctctproductstrategy&url="+pageUrlEscaped,
			"facebook.share": "http://www.facebook.com/sharer.php?u="+pageUrlEscaped,
			"facebook.like": null,
			"facebook.send": null,
			"permalink.view": null,
			"twitter.tweet": "http://twitter.com/intent/tweet?status="+params.pageName+"+"+pageUrlEscaped+"+via+%23constantcontact"	
		};	
	}
	
	// tracking pixel...
	var trackingPixel = '';
	if (isTrackingEnabled && targets["permalink.view"] != null) {
		trackingPixel = '<img src="'+targets["permalink.view"]+'&_ts='+ts+'" height="1" width="1" border="0" />';
	}
	
	// sharebar code...
	var sharebar = 
    '<div class="shr-bar">'+
    	'<div class="shr-bar-wrap">'+
			'<div id="like-btn-wrap">'+
				trackingPixel+
				'<span class="shr-callout">Share:</span>'+
				'<div style="float:left;"><fb:like href="'+ pageUrl + '" layout="button_count" show_faces="false" font="lucida grande" send="true"></fb:like></div>'+
			'</div>'+
			'<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>'+
			'<div id="tweet-btn-wrap">'+
				// FIXME: show twitters js tweet button only for counts. attach tracking event to our custom button and cover it. ooof...
				'<a href="http://twitter.com/share" class="twitter-share-button" data-url="'+pageUrl+'"></a>'+
				'<a class="custom-tweet-btn" href="#"></a>'+
			'</div>'+
			'<div id="share-btn-wrap">'+
		        '<div class="shr-btn">'+
		        	'<div class="shr-shelf-wrap">'+
			            '<div class="shr-shelf">'+
			                '<ul class="shr-shelf-inner">'+
			                    '<li><a href="'+targets["facebook.share"]+'" target="_blank" class="shr-fb"></a></li>'+
			                    '<li><a href="'+targets["twitter.tweet"]+'" target="_blank" class="shr-tw"></a></li>'+
			                    '<li><a href="'+targets["linkedin.post"]+'" target="_blank" class="shr-li"></a></li>'+
			                    '<li class="divider"><a href="'+targets["addthis.share"]+'" target="_blank" class="shr-add"></a></li>'+
			                '</ul>'+  
			            '</div>'+
			   	    '</div>'+
			    '</div>'+
		    '</div>'+
		    '<div id="jmml-btn-wrap"><a class="jmml-btn" href="'+unescape(params.visitorHost)+'/d.jsp?m='+params.soid+'&p=oi" target="_blank"></a></div>'+
		    '<a class="powered-by" href="http://www.constantcontact.com/index.jsp?cc=DLviral10" target="_blank"></a>'+
	    '</div>'+
    '</div>';

	// add to the document...
	body.prepend(sharebar);
	
	// attach our tracking event top tweet button and open the tweet window...
	jQuery(".custom-tweet-btn").click(function() {
		window.open("http://twitter.com/share?url="+pageUrlEscaped, "cc_twitter_tweet", "location=true,status=true,width=550,height=450").focus();
		if (isTrackingEnabled) {
			(new Image()).src = targets["twitter.tweet"]+"&_ts="+ts;
		}
		return false;
	});
	
	// fb like overlay...
	var fbLikeOverlay = 
	'<div id="like_action_call">'+
		'<div class="tooltip large">'+
			'<div class="tooltip-body">'+
				'<div class="tooltip-pointer"></div>'+
				'<h3 class="large">Confirm that you like this.</h3>'+
				'<p>Click the "Like" button.</p> <a id="focuser" href="#"></a>'+
				'<input type="text" style="display:none;" />'+
			'</div>'+
		'</div>'+
	'</div>';

	// add and position overlay...
	body.append(fbLikeOverlay);
	var queryParams = Permalink.Utils.parseQueryString(window.location.search);
	if (queryParams.share == "fblike") {
		// TODO: deprecated, use the hash #fblike method.
		Permalink.CampaignPage.showFbLikeOverlay();
	} else if (window.location.hash == "#fblike") {
		Permalink.CampaignPage.showFbLikeOverlay();
	}
	
	// add fbxml to the document and create tracking event...
	body.append('<div id="fb-root"></div>');
	window.fbAsyncInit = function() {
		// FIXME: let FB know that dom is ready to parse xfbml in chrome and safari...
		if (jQuery.browser.webkit || jQuery.browser.safari) {
			FB.Dom._isReady = true;
		}
		FB.init({appId: "120295828008556", status: true, cookie: true, xfbml: true});
		// code to track "like" presses
		FB.Event.subscribe("edge.create", function(href, widget) {
			(new Image()).src = targets["facebook.like"]+"&_ts="+ts;
	    });
		// code to track when a user sends a message through facebook
		FB.Event.subscribe("message.send", function(href, widget) {
			(new Image()).src = targets["facebook.send"]+"&_ts="+ts;
	    });
		
	};
	(function() {
		var e = document.createElement('script'); e.async = true;
		e.src = document.location.protocol +  '//connect.facebook.net/en_US/all.js';
		document.getElementById('fb-root').appendChild(e);
	}());
	
};

Permalink.CampaignPage.showFbLikeOverlay = function()
{
	var offset = jQuery('.shr-bar-wrap').offset();
	jQuery('.tooltip').css('left',offset.left-10);

	jQuery(window).resize(function() {
		offset = jQuery('.shr-bar-wrap').offset();
		jQuery('.tooltip').css('left',offset.left-10);
	});

	jQuery('#focuser').blur( function(){
		jQuery('.tooltip').fadeOut();
	});

	jQuery('#like_action_call').show();
	jQuery('#focuser').focus();
};

// initialize campaign page...
Permalink.CampaignPage.init();

