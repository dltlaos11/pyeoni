package com.pyeoni.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;


public class MemberDetailController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String)data.get("method");
		String page ="memberDetail.jsp";
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		if(method.equals("GET")) {

		}else {
			MemberVO mem = makeMem(request);
			MemberServices service = new MemberServices();
			int msg = service.memUpdate(mem);
			page = "redirect:/page/main.view";
		}
		
		return page;
	}

	private MemberVO makeMem(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
		int withDraw = Integer.parseInt(request.getParameter("withDraw"));
		
		MemberVO mem = new MemberVO();
		
		mem.setEmail(email);
		mem.setIsAdmin(isAdmin);
		mem.setPassword(password);
		mem.setUserName(username);
		mem.setWithDraw(withDraw);
		
		return mem;

	}

}
