package com.pyeoni.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.LikeServices;
import com.pyeoni.vo.LikeVO;

public class LikeDeleteController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		String method = (String)data.get("method");
		
		if(method.equals("DELETE")) {
			LikeVO like = LikeAddController.makeLike(request);
			
			LikeServices service = new LikeServices();
			int result = service.deleteLike(like);
			
			if (result == 0 ) {
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
