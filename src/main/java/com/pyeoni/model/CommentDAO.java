package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pyeoni.util.OracleUtill;
import com.pyeoni.vo.CommentVO;
import com.pyeoni.vo.MemberVO;

public class CommentDAO {
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet re;
	
	// 전체 댓글 조회
	public List<CommentVO> selectAllComment(){
		List<CommentVO> commentList = new ArrayList<>();
		String sql = """
				SELECT comment_id, content 
				TO_CHAR(comment_date, 'YYYY-MM-DD HH24:MI:SS') as created_datetime, 
				product_name, 
				promotion, brand, price, email 
				FROM comments ORDER BY comment_id asc 
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst = conn.prepareStatement(sql);
			re=pst.executeQuery();
			while(re.next()) {
				CommentVO comment = makeComment(re);
				commentList.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return commentList;
	}
	
	// 댓글 조회
	public CommentVO selectComment(String product_name, String promotion, String brand, int price) {
		CommentVO comment = new CommentVO();
		String sql = """
				SELECT comment_id, content 
				TO_CHAR(comment_date, 'YYYY-MM-DD HH24:MI:SS') as created_datetime, 
				product_name, 
				promotion, brand, price, email 
				FROM comments ORDER BY comment_id asc 
				WHERE brand = ? AND price = ? AND product_name = ? AND promotion = ? 
				""";
		conn = OracleUtill.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, brand);
			pst.setInt(2, price);
			pst.setString(3, product_name);
			pst.setString(4, promotion);
			
			re=pst.executeQuery();
			while(re.next()) {
				comment = makeComment(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return comment;
	}
	
	// 댓글 삭제
	public int deleteComment(int commentId) {
		int result=0;
		String sql="""
				DELETE FROM comments WHERE COMMENT_ID = ?
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, commentId);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 댓글 작성
	public int writeComment(CommentVO comment) {
		int result=0;
		String sql="""
				insert into comments VALUES(SEQ_COMMENT_ID.nextval, ?, SYSDATE, ?, ?, ?, ?, ?)
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, comment.getContent());
			pst.setString(2, comment.getProductName());
			pst.setString(3, comment.getPromotion());
			pst.setString(4, comment.getBrand());
			pst.setInt(5, comment.getPrice());
			pst.setString(6, comment.getEmail());
			
			result=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	/* 댓글 수정 */
	public int commentUpdate(String content, int id) {
		int result = 0;
		String sql="""
				update comments 
				set content = ? 
				where comment_id = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 댓글 객체 생성
	private CommentVO makeComment(ResultSet re) throws SQLException {
		CommentVO comment = new CommentVO();
		
		comment.setCommentId(re.getInt("COMMENT_ID"));
		comment.setContent(re.getString("CONTENT"));
		comment.setCommentDate(re.getDate("COMMENT_DATE"));
		comment.setProductName(re.getString("PRODUCT_NAME"));
		comment.setPromotion(re.getString("PROMOTION"));
		comment.setBrand(re.getString("BRAND"));
		comment.setPrice(re.getInt("PRICE"));
		comment.setEmail(re.getString("EMAIL"));
		
		return comment;
	}
}
