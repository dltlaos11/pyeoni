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
			if(searchValue!=null) {
				System.out.println("값 : "+searchValue);
				System.out.println("길이 : "+searchValue.length());
			}
			
			
			String sortValue = req.getParameter("sort_type");
			if(sortValue!=null) {
				System.out.println("값 : "+sortValue);
				System.out.println("길이 : "+sortValue.length());
			}
			
			String productValue = req.getParameter("product_type");
			if(productValue!=null) {
				System.out.println("값 : "+productValue);
				System.out.println("길이 : "+productValue.length());
			}
			
			String eventValue = req.getParameter("event_type");
			if(eventValue!=null) {
				System.out.println("값 : "+eventValue);
				System.out.println("길이 : "+eventValue.length());
			}
			
		}
		return page;
	}

}
