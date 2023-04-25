package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class AdminMainController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "";
		HttpServletRequest req = (HttpServletRequest) data.get("request");
		
		System.out.println(req.getRequestURI()+"@@@@@@@@@@@");
		
		if (req.getRequestURI().contains("admin.view")) {
			page = "adminpage.jsp";
		}
		if (req.getRequestURI().contains("update")) {
			page = "update.jsp";
		}
		if (req.getRequestURI().contains("managemember")) {
			page = "managemember.jsp";
		}
		if (req.getRequestURI().contains("managecomments")) {
			page = "managecomments.jsp";
		}
		return page;
	}

}
