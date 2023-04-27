package com.pyeoni.model;

import com.pyeoni.vo.LikeVO;

public class LikeServices {
	LikeDAO lDAO = new LikeDAO();
	
	// 좋아요 추가
	public int addLike(LikeVO like) {
		return lDAO.addLike(like);
	}
	
	// 좋아요 삭제
	public int deleteLike(LikeVO like) {
		return lDAO.deleteLike(like);
	}
	
	// 해당 상품의 좋아요 개수 조회
	public int selectLike(String brand, int price, String productName, String promotion){
		return lDAO.selectLike(brand, price, productName, promotion);
	}
	
	public int memberlike(String brand, int price, String productName, String promotion, String email) {
		/* 좋아요가 있으면 1, 없으면 0을 반환 */
		return lDAO.memberlike(brand, price, productName, promotion, email);
	}
}
