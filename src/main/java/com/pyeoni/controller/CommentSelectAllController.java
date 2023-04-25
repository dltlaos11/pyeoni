package com.pyeoni.controller;

import java.security.Provider.Service;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.pyeoni.model.CommentService;
import com.pyeoni.vo.CommentVO;

public class CommentSelectAllController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		CommentService service = new CommentService();
		List<CommentVO> commentList = service.selectAllComment();
		JSONObject commentsObj = new JSONObject();
		
		String method = (String)data.get("method");
		
		if(method.equals("GET")) {
			JSONArray arr = new JSONArray();
			for(CommentVO comment: commentList) {
				JSONObject obj = new JSONObject();
				obj.put("commentId", comment.getCommentId());
				obj.put("content", comment.getContent());
				obj.put("commentDate", comment.getCommentDate());
				obj.put("productName", comment.getProductName());
				obj.put("promotion", comment.getPromotion());
				obj.put("brand", comment.getBrand());
				obj.put("price", comment.getPrice());
				obj.put("email", comment.getEmail());
				arr.add(obj);
			}
			
			commentsObj = new JSONObject();
			commentsObj.put("commentList", arr);
		}
		

		
		return "responseBody:"+commentsObj.toJSONString();
	}
}
