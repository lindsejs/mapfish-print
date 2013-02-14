package org.mapfish.print.config;

import java.net.URI;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.log4j.Logger;

public class ParamToCookieSecurity extends SecurityStrategy {
	
	public static final Logger LOGGER = Logger.getLogger(ParamToCookieSecurity.class);

	String cookieName = null;
	
	String paramName = null;
	
	@Override
	public void configure(URI uri, HttpClient httpClient) {
		
		LOGGER.debug("Entering with url" + uri.toString());
		
		if(cookieName==null || paramName==null) throw new IllegalStateException("cookieName and paramName configuration of ParamToCookieSecurity is required");
		
		LOGGER.debug("cookieName is " + cookieName);
		LOGGER.debug("paramName is " + paramName);
		
		String cookieValue = null;
		String[] params = uri.getQuery().split("&");
		for(String param:params){
			String[] kvp = param.split("=");
			if(kvp.length==2 && kvp[0].trim().equals(paramName)){
				cookieValue = kvp[1].trim();
				break;
			}
		}
		// set cookie only if param was found
		if(cookieValue != null){
			LOGGER.debug("Cookie: " + cookieName + " from param "+ paramName + " successfully set to request for domain "+uri.getHost());
			Cookie cookie = new Cookie(uri.getHost(), cookieName, cookieValue,"/",null, false);
			httpClient.getState().setCookiePolicy(CookiePolicy.COMPATIBILITY);
			httpClient.getState().addCookie(cookie);
		} else {
			LOGGER.debug("Parameter name " + paramName + " not found!");
		}
		
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public void setCookieName(String cookieName) {
		this.cookieName = cookieName;
	}

}
