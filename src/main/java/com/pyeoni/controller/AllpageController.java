package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class AllpageController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "Allpage.jsp";
		
		String method = (String) data.get("method");
		System.out.println(method+" : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");
		
		if(method.equals("GET")) {
			String searchValue = req.getParameter("search_bar");
			System.out.println(searchValue +" : 1231241241");
			System.out.println( " getA "+req.getAttribute("searchValue2"));
		}
		return page;
	}

}
