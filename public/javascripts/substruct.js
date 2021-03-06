/**
 * COMMON JAVASCRIPT FUNCTIONS
 * by webmaster@subimage.com
 *
 */

/**
 * Other event handlers use this to set up basic
 * event objects...
 */
function getEventSource(e) {
	/* Cookie-cutter code to find the source of the event */
	if (typeof e == 'undefined') {
		var e = window.event;
	}
	var source;
	if (typeof e.target != 'undefined') {
		source = e.target;
	} else if (typeof e.srcElement != 'undefined') {
		source = e.srcElement;
	} else {
		return false;
	}
	return source;
	/* End cookie-cutter code */
}

/**
 * X-browser event handler attachment
 *
 * @argument obj - the object to attach event to
 * @argument evType - name of the event - DONT ADD "on", pass only "mouseover", etc
 * @argument fn - function to call
 */
function addEvent(obj, evType, fn){
	if (obj == null) return false;

	if (obj.addEventListener){
		obj.addEventListener(evType, fn, false);
		return true;
	} else if (obj.attachEvent){
		var r = obj.attachEvent("on"+evType, fn);
		return r;
	} else {
		return false;
	}
}
function removeEvent(obj, evType, fn, useCapture){
  if (obj.removeEventListener){
    obj.removeEventListener(evType, fn, useCapture);
    return true;
  } else if (obj.detachEvent){
    var r = obj.detachEvent("on"+evType, fn);
    return r;
  } else {
    alert("Handler could not be removed");
  }
}


/**
 * Code below taken from - http://www.evolt.org/article/document_body_doctype_switching_and_more/17/30655/
 *
 * Modified 4/22/04 to work with Opera/Moz (by webmaster at subimage dot com)
 *
 * Gets the full width/height because it's different for most browsers.
 */
function getViewportHeight() {
	if (window.innerHeight!=window.undefined) return window.innerHeight;
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	if (document.body) return document.body.clientHeight; 

	return window.undefined; 
}
function getViewportWidth() {
	var offset = 17;
	var width = null;
	if (window.innerWidth!=window.undefined) return window.innerWidth; 
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth; 
	if (document.body) return document.body.clientWidth; 
}

/**
 * Gets the real scroll top
 */
function getScrollTop() {
	if (self.pageYOffset) // all except Explorer
	{
		return self.pageYOffset;
	}
	else if (document.documentElement && document.documentElement.scrollTop)
		// Explorer 6 Strict
	{
		return document.documentElement.scrollTop;
	}
	else if (document.body) // all other Explorers
	{
		return document.body.scrollTop;
	}
}
function getScrollLeft() {
	if (self.pageXOffset) // all except Explorer
	{
		return self.pageXOffset;
	}
	else if (document.documentElement && document.documentElement.scrollLeft)
		// Explorer 6 Strict
	{
		return document.documentElement.scrollLeft;
	}
	else if (document.body) // all other Explorers
	{
		return document.body.scrollLeft;
	}
}

/**
 * Prettifies our tables applying the proper CSS class after a DOM modification 
 */
function stripedTable() {
	if (document.getElementById && document.getElementsByTagName) {  
		var allTables = document.getElementsByTagName('TABLE');
		if (!allTables) { return; }

		for (var i = 0; i < allTables.length; i++) {
			if (allTables[i].className.match(/[\w\s ]*list[\w\s ]*/)) {
				var trs = allTables[i].getElementsByTagName("tr");
				for (var j = 0; j < trs.length; j++) {
					if (trs[j].className.indexOf('footer') != -1) {
						continue;
					}
					if (j % 2 == 0) {
						trs[j].className = "even";
					} else {
						trs[j].className = "odd";
					}
				}
			}
		}
	}
}

/**
 * Called from the modal window usually.
 *
 * Refreshes the content in the main window.
 */
function returnRefresh() {
	window.location.reload(true);
}

/**
 * Shows sub tab of content pane passed in.
 * Hides the rest.
 */
function showSubTab(pane_id, tab_link) {
	// Loop through content panes and show the right one
	for (var i=0; i<gPanes.length; i++) {
		if (pane_id == gPanes[i]) {
			Element.show(gPanes[i]);
		} else {
			Element.hide(gPanes[i]);
		}
	}
	// Loop through tabs and assign the right style
	var tabs = $('sub_tabs');
	var active_tab = tab_link.parentNode;
	for (var i=0; i<tabs.childNodes.length; i++) {
		if (active_tab == tabs.childNodes[i]) {
			tabs.childNodes[i].className = "active";
		} else {
			tabs.childNodes[i].className = "";
		}
	}
}

function highlightItem(item_id) {
	new Effect.Highlight($(item_id));
}


// Adds an empty file upload html element to the form.
// Used in conjunction with the /shared/multiple_upload partial.
function addEmptyUpload(kind) {
	var new_upload_box = $(kind+'_empty_file_upload').cloneNode(true);
	new_upload_box.style.display = "none";
	new_upload_box.id = '';
	$(kind+'_file_upload_container').appendChild(new_upload_box);
	new Effect.Appear(new_upload_box);
}

// AFFILIATE TRACKING CODE ====================================================

/* cookies.js */
/*
     Example File From "JavaScript and DHTML Cookbook"
     Published by O'Reilly & Associates
     Copyright 2003 Danny Goodman
*/

// utility function to retrieve a future expiration date in proper format;
// pass three integer parameters for the number of days, hours,
// and minutes from now you want the cookie to expire; all three
// parameters required, so use zeros where appropriate
function getExpDate(days, hours, minutes) {
  var expDate = new Date();
  if (typeof days == "number" && typeof hours == "number" && typeof hours == "number") {
    expDate.setDate(expDate.getDate() + parseInt(days));
    expDate.setHours(expDate.getHours() + parseInt(hours));
    expDate.setMinutes(expDate.getMinutes() + parseInt(minutes));
    return expDate.toGMTString();
  }
}

// utility function called by getCookie()
function getCookieVal(offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1) { endstr = document.cookie.length; }
  return unescape(document.cookie.substring(offset, endstr));
}

// primary function to retrieve cookie by name
function getCookie(name) {
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg) {
      return getCookieVal(j);
    }
    i = document.cookie.indexOf(" ", i) + 1;
    if (i == 0) break; 
  }
  return null;
}

// store cookie value with optional details as needed
function setCookie(name, value, expires, path, domain, secure) {
  document.cookie = name + "=" + escape (value) +
    ((expires) ? "; expires=" + expires : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}

// remove the cookie by setting ancient expiration date
function deleteCookie(name,path,domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
}

// Tracks referrer via cookie so we can have nice stats.
// Only set referrer cookie if we don't have one.
function writeReferrerCookie() {
  if(getCookie("referrer") == null && getCookie("entry_page") == null) {
    setCookie("referrer", document.referrer, getExpDate(90,0,0));
    setCookie("entry_page", window.location, getExpDate(90,0,0));
  }
}
// Tracks affiliate code
function writeAffiliateCookie() {
  if(getCookie("affiliate") == null) {
    var query_params = document.location.href.toQueryParams();
    if(query_params['affiliate'] != null) {
      setCookie("affiliate", query_params['affiliate'], getExpDate(90,0,0));
    }
  }
}

function writeAppCookies() {
  writeAffiliateCookie();
  writeReferrerCookie();
}

Event.observe(window, "load", writeAppCookies);