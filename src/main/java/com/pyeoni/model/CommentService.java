package com.pyeoni.model;

import java.util.List;

import com.pyeoni.vo.CommentVO;

public class CommentService {
	CommentDAO cDAO = new CommentDAO();
	
	// 전체 댓글 조회
	public List<CommentVO> selectAllComment(){
		return cDAO.selectAllComment();
	}
	
	// 댓글 조회
	public List<CommentVO> selectComment(String product_name, String promotion, String brand, int price) {
		return cDAO.selectComment(product_name, promotion, brand, price);
	}
	
	// 댓글 삭제
	public int deleteComment(int commentId) {
		return cDAO.deleteComment(commentId);
	}
	
	// 댓글 작성
	public int writeComment(CommentVO comment) {
		return cDAO.writeComment(comment);
	}
	
	/* 댓글 수정 */
	public int updateComment(String content, int id) {
		return cDAO.updateComment(content, id);
	}
}
