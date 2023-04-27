package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;

public class CommentDeleteController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {

		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		String method = (String)data.get("method");
		
		if(method.equals("GET")) {
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			
			CommentService service = new CommentService();
			int result = service.deleteComment(commentId);
			if (result == 0 ) {
				/* 실패 */
				return "responseBody:false";
			}else {
				/* 성공 */
				return "responseBody:true";
			}
		}

		return "responseBody:false";

	}

}
