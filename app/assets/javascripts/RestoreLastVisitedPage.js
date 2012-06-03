/*******************************************************************************
 * Project: RestoreLastVisitedPage.js
 * Author: Dmitriy Simonchik (mailto: Dmitriy.Simonchik@gmail.com)
 * Modified: 29 Oct 2007
 * Web: http://www.thebridge.ru/last-visited-page/
 * Licence: LGPL
 * Remarks: If you improve this code, please share your modification
 *          Send your changes to me and I'll add them to the distribution.
 *          Thanks.
 ******************************************************************************/
//block of functions for work with cookies
function createCookie(name,value,days)
{
	if (days)
  {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)
  {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

//script body
//setting default values for parameters
if(typeof(dsLVPURLMainPage) == "undefined")
{
  var loc = document.location.toString().split('/');
  var dsLVPURLMainPage = "http://" + loc[2] + "/";
}

if(typeof(dsLVPNotification) == "undefined")
  var dsLVPNotification = "You have been automatically redirected to last visited page on the site.";

//redirecting user to last visited page if he
//enters the site through main page
if(document.location == dsLVPURLMainPage)
{
  //redirect only if user navigates to main page first time
  //in current session (if referrer not contains main page address)
  var storedData = readCookie("dsLVPURL");
  if(document.referrer.indexOf(dsLVPURLMainPage) == -1 && storedData != null)
  {
    LastVisitedPageURL = decodeURI(storedData);
    if(LastVisitedPageURL != null && LastVisitedPageURL != dsLVPURLMainPage)
    {
      document.location = LastVisitedPageURL;
      dsLVPMessage = dsLVPNotification;
    }
  }
}
//storing last visited page for a year in cookie
if(typeof(dsLVPDisabled) == "undefined")
  createCookie("dsLVPURL", encodeURI(document.location), 365);
