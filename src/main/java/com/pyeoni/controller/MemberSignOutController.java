package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class MemberSignOutController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		
		String method = (String)data.get("method");
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		if(method.equals("POST")) {
			MemberServices service = new MemberServices();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			int result = service.signout(email,password);
			if (result == 0 ) {
				/* 실패 */
				return "responseBody:false";
			}else {
				/* 성공 */
				return "responseBody:true";
			}
		}
		
		return "responseBody:false";
	}

}
