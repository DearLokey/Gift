package com.gift.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.gift.domain.User;
import com.gift.service.UserServiceImpl;

public class UserAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	private User user;

	@Autowired
	private UserServiceImpl userServiceImpl;

	public UserAction() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// 用户登录请求
	public String login() {
		callbackInfo.clear();
		boolean flag = userServiceImpl.loginUser(user.getAccount(),
				user.getPassword());
		System.out.println(flag);
		if (flag) {
			session.clear();
			User newUser = userServiceImpl.findUserByAccount(user.getAccount());
			session.put("loginUser", newUser);
			String isAdmin = newUser.getIsAdmin();
			callbackInfo.put("login", "success");
			if ("yes".equals(isAdmin)) {
				callbackInfo.put("isAdmin", "yes");
			} else {
				callbackInfo.put("isAdmin", "no");
			}
		} else {
			callbackInfo.put("login", "fail");
		}
		return "callback";
	}

	// 注册请求
	public String regist() {
		callbackInfo.clear();
		User user1 = userServiceImpl.findUserByAccount(user.getAccount());
		if (user1 == null) {
			userServiceImpl
					.registNewUser(user.getAccount(), user.getPassword());
			callbackInfo.put("regist", "success");
		} else {
			callbackInfo.put("regist", "fail");
		}
		return "callback";
	}

	// 注销
	public String logOff() {
		session.clear();
		return "logOff";
	}
}
