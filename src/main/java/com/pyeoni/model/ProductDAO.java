package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pyeoni.util.OracleUtill;
import com.pyeoni.vo.ProductVO;

public class ProductDAO {
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet re;
	
	// 상품 전체 조회
	public List<ProductVO> selectAllProduct(){
		List<ProductVO> productList = new ArrayList();
		
		String sql="""
				select * from PRODUCT
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			st = conn.createStatement();
			re = st.executeQuery(sql);
			
			while(re.next()) {
				ProductVO product = makeProduct(re);
				productList.add(product);
				
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			OracleUtill.dbDisconnection(re, conn, st);
		}
		
		return productList;
	}

	public int insertProduct(ProductVO product) {
		int result=0;
		String sql="""
				
				""";

		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, product.getProductName());
			pst.setString(2, product.getPromotion());
			pst.setString(3, product.getBrand());
			pst.setInt(4, product.getPrice());
			pst.setString(5, product.getKind());
			pst.setString(6, product.getProductImg());
			result = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 상품 정보를 담은 개체 생성함수
	private ProductVO makeProduct(ResultSet re) throws SQLException {
		ProductVO product = new ProductVO();

		product.setProductName(re.getString("product_name"));
		product.setPromotion(re.getString("promotion"));
		product.setBrand(re.getString("brand"));
		product.setPrice(re.getInt("price"));
		product.setKind(re.getString("kind"));
		product.setProductImg(re.getString("product_img"));

		
		return product;
	}
}
