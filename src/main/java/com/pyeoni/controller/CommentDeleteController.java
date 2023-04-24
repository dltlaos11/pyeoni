package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;

public class CommentDeleteController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {

		HttpServletRequest request = (HttpServletRequest)data.get("request");

		int commentId = Integer.parseInt(request.getParameter("commentId"));
		
		CommentService service = new CommentService();
		int result = service.deleteComment(commentId);
		if (result == 0 ) {
			/* 성공 */
			return "responseBody:false";
		}else {
			/* 실패 */
			return "responseBody:true";
		}
	}

}
