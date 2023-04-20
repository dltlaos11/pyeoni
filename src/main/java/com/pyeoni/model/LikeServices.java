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
	public int selectLike(LikeVO like){
		return lDAO.selectLike(like);
	}
}
