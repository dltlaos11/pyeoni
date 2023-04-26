package com.pyeoni.controller;

import java.util.Map;

public class AdminMemberController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "manageMember.jsp";

		return page;
	}

}
