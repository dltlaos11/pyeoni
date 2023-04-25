package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;

public class EmailDupController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		String method = (String)data.get("method");
		int result=0;
		
		if(method.equals("GET")) {
			
			String email = request.getParameter("email");
			MemberServices service = new MemberServices();
			result = service.emailDupCheck(email);
		}

		
		return "responseBody:" + result;
	}

}
