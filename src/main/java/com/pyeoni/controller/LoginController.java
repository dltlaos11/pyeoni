package com.pyeoni.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class LoginController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String)data.get("method");
		
		if(method.equals("GET")) {
			
		} else {
			HttpServletRequest request = (HttpServletRequest)data.get("request");
			
			request.setCharacterEncoding("utf-8");
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			MemberServices service = new MemberServices();
			MemberVO member = service.login(email, password);

			 if(member != null) {				
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", member);
//				System.out.println(session.getAttribute("loginUser"));
				return "responseBody:true";
			} else {
				/* 로그인 실패 */
				return "responseBody:false";
			}
	
		}

		return "loginpage.jsp";
		
	}

}
