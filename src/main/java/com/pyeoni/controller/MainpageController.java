package com.pyeoni.controller;

import java.util.Map;

public class MainpageController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "mainpage.jsp";
		return page;
	}

}
