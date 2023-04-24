package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = null;

		String method = (String) data.get("method");
		System.out.println(method + " : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");

		if (method.equals("GET")) {
			if(req.getRequestURI().contains("gs"))
				page="GSpage.jsp";
			else if(req.getRequestURI().contains("emart"))
				page="Emartpage.jsp";
			else if(req.getRequestURI().contains("cspace"))
				page="Cspacepage.jsp";
			else if(req.getRequestURI().contains("mini"))
				page="Minipage.jsp";
			else if(req.getRequestURI().contains("seven"))
				page="Sevenpage.jsp";

		}
		return page;
	}

}
