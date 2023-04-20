package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class SignUpController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		MemberServices service = new MemberServices();
		
		MemberVO memVO = new MemberVO();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = request.getParameter("userName");
		
		memVO.setEmail(email);
		memVO.setPassword(password);
		memVO.setUserName(username);
		
		int result = service.insertMem(memVO);
		
		return "redirect:login.view";
	}

//	private MemberVO setForm(HttpServletRequest request) {
//		
//		MemberVO mem = new MemberVO();
//		
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		MemberServices service = new MemberServices();
//		MemberVO member = service.login(email, password);
//		
//		return mem;
//	}

}
