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
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			MemberServices service = new MemberServices();
			MemberVO member = service.login(email, password);
			
			ServletContext app = request.getServletContext();
			Object obj = app.getAttribute("userList");
			 List<MemberVO> userList = null;
			
			 if(member != null) {				
				userList.add(member);
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", member);
				String path = request.getContextPath();
				return "responseBody:true";
			} else {
				/* 로그인 실패 */
				return "responseBody:false";
			}
	
		}

		return "redirect:loginpage.jsp";
		
	}

}
