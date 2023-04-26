package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class AdminCommentsController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "manageComments.jsp";

		return page;
	}

}
