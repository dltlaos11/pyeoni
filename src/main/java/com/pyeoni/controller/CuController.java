package com.pyeoni.controller;

import java.util.Map;

public class CuController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "cupage.jsp";
		return page;
	}

}
