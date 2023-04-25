package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;
import com.pyeoni.model.LikeServices;

public class LikeSelectController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		
		LikeServices service = new LikeServices();
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		String method = (String)data.get("method");
		
		if(method.equals("GET")) {
			String productName = request.getParameter("productName");
			String promotion = request.getParameter("promotion");
			String brand = request.getParameter("brand");
			int price = Integer.parseInt(request.getParameter("price"));
			
			int likeCount = service.selectLike(brand, price, productName, promotion);
			if (likeCount == 0 ) {
				/* 성공 */
				return "responseBody:false";
			}else {
				/* 실패 */
				return "responseBody:true";
			}
		}
		
		return "responseBody:false";

	}

}
