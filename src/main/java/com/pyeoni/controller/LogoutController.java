package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pyeoni.vo.MemberVO;

public class LogoutController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		
		HttpServletRequest request =  (HttpServletRequest)data.get("request");
		
		
		/* 세션 지우기 */
		request.getSession(false).invalidate(); 
		
		ServletContext app = request.getServletContext();
		HttpSession session = request.getSession();
		
		Object obj = app.getAttribute("userList");
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<MemberVO> userList = null;
		if(obj!=null) {
			userList = (List<MemberVO>) obj;
			userList.remove(obj);
			app.setAttribute("userList", userList);
		}
		
		
		
		return "responseBody:OK";
	}

}
