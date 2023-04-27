package com.pyeoni.model;

import java.sql.*;

import com.pyeoni.util.OracleUtill;
import com.pyeoni.vo.LikeVO;

public class LikeDAO {
	Connection conn;
	PreparedStatement pst;
	ResultSet re;
	
	// 좋아요 추가
	public int addLike(LikeVO like) {
		int result = 0;
		String sql="""
				INSERT INTO likes VALUES( ?, ?, ?, ?, ?)
				""";
		conn=OracleUtill.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, like.getProductName());
			pst.setString(2, like.getPromotion());
			pst.setString(3, like.getBrand());
			pst.setInt(4, like.getPrice());
			pst.setString(5, like.getEmail());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 좋아요 삭제
	public int deleteLike(LikeVO like) {
		int result = 0;
		String sql="""
				DELETE FROM likes WHERE brand = ? AND price = ? AND product_name = ? AND promotion = ? AND email = ?
				""";
		conn=OracleUtill.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, like.getBrand());
			pst.setInt(2, like.getPrice());
			pst.setString(3, like.getProductName());
			pst.setString(4, like.getPromotion());
			pst.setString(5, like.getEmail());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 해당 상품의 좋아요 개수 조회
	public int selectLike(String brand, int price, String productName, String promotion){
		int likeCount=0;
		String sql = """
			SELECT COUNT(*) FROM likes WHERE brand = ? AND price = ? AND product_name = ? AND promotion = ?
			""";
				
		conn=OracleUtill.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, brand);
			pst.setInt(2, price);
			pst.setString(3, productName);
			pst.setString(4, promotion);
			
			re=pst.executeQuery();
			while(re.next()) {
				likeCount = re.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return likeCount;
	}
	
}
