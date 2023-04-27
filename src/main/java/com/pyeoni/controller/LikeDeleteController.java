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
		
		if(method.equals("GET")) {
			LikeVO like = LikeAddController.makeLike(request);
			
			LikeServices service = new LikeServices();
			int result = service.deleteLike(like);
	         int newlikenum = service.selectLike(like.getBrand(), like.getPrice(), like.getProductName(),like.getPromotion());
	      	request.setAttribute("newlikenum", newlikenum);
	      	System.out.println("newlike" + newlikenum);
			if (result == 0 ) {
				/* 성공 */
				return "responseBody:"+newlikenum;
			}else {
				/* 실패 */
				return "responseBody:"+newlikenum;
			}
		}
		
		return "responseBody:false";
	}

}
