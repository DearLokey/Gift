package com.gift.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware,
		RequestAware {
	private static final long serialVersionUID = 1L;
	protected Map<String, Object> callbackInfo = new HashMap<String, Object>();
	protected Map<String, Object> session;
	protected Map<String, Object> request;

	public BaseAction() {

	}

	public Map<String, Object> getCallbackInfo() {
		return callbackInfo;
	}

	public void setCallbackInfo(Map<String, Object> callbackInfo) {
		this.callbackInfo = callbackInfo;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public Map<String, Object> getRequest() {
		return request;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
