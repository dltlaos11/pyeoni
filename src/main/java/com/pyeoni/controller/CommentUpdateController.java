package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;
import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class CommentUpdateController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		

		String method = (String)data.get("method");
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		if(method.equals("POST")) {
			String content = request.getParameter("content");
			int comment_id = Integer.parseInt(request.getParameter("commentid"));
			CommentService service = new CommentService();
			int result = service.updateComment(content, comment_id);
			if (result == 0 ) {
				/* 성공 */
				return "responseBody:false";
			}else {
				/* 실패 */
				return "responseBody:true";
			}
		}
		return "DetailModal.jsp";
	}

}
