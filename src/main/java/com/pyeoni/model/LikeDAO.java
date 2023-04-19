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
			pst.setString(1, like.getProductName());
			pst.setString(2, like.getPromotion());
			pst.setString(3, like.getBrand());
			pst.setInt(4, like.getPrice());
			pst.setString(5, like.getEmail());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 좋아요 조회
	SELECT
    COUNT(*)
FROM likes
WHERE brand = 'CU' AND price = 1000 AND product_name = 'APPLE' AND promotion = '1+1';
}
