package com.pyeoni.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;


public class MemberDetailController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String)data.get("method");

		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		if(method.equals("GET")) {

		}else {
			String password =  request.getParameter("password");
			String email =  request.getParameter("email");
			
			MemberServices service = new MemberServices();
			int result = service.memUpdate(password, email);
			if (result == 0 ) {
				/* 성공 */
				return "responseBody:false";
			}else {
				/* 실패 */
				return "responseBody:true";
			}
		}
		
		return "responseBody:false";
	}

}
