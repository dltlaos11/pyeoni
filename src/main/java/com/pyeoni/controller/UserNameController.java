package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;

public class UserNameController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		String username = request.getParameter("username");
		MemberServices service = new MemberServices();
		int result = service.usernameDupCheck(username);
		
		return "responseBody:" + result;
	}

}
