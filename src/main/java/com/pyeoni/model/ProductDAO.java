package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
				
			}
		}
		
		return productList;
	}

	public int insertProduct(ProductVO product) {
		int result=0;
		String sql="""
				
				""";
		
		return result;
	}
	
	// 상품 정보를 담은 개체 생성함수
	private ProductVO makeProduct(ResultSet re2) {
		ProductVO product = new ProductVO();
		
		product.set
		
		return product;
	}
}
