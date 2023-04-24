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
	public List<ProductVO> selectAllProduct(int start, int end) {
		List<ProductVO> productList = new ArrayList();

		String sql = """
					select * from ( SELECT p.product_name, p.promotion, p.brand, p.price, p.kind, p.product_img , ROWNUM rnum
					FROM product p WHERE ROWNUM <= ?
				)  WHERE rnum >= ?
					""";

		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, end);
			pst.setInt(2, start);
			re = pst.executeQuery();

			while (re.next()) {
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

	// 상품 추가
	public int insertProduct(ProductVO product) {
		int result = 0;
		String sql = """
				INSERT INTO PRODUCT VALUES(?,?,?,?,?,?)
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

	// 상품 개별 조회
	public ProductVO detailProduct(String product_name, String promotion, String brand, int price) {
		ProductVO product = null;
		String sql = """
				SELECT * FROM PRODUCT WHERE brand = ? AND price = ? AND product_name = ? AND promotion = ?
				""";

		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, brand);
			pst.setInt(2, price);
			pst.setString(3, product_name);
			pst.setString(4, promotion);

			re = pst.executeQuery();

			while (re.next()) {
				product = makeProduct(re);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}

		return product;
	}

//	// 상품 편의점 회사별 조회
//	public List<ProductVO> selectProductByBrand(String brand) {
//		List<ProductVO> productList = new ArrayList<>();
//		String sql = """
//				SELECT * FROM product where brand = ?
//				""";
//		conn = OracleUtill.getConnection();
//
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, brand);
//			re = pst.executeQuery();
//			while (re.next()) {
//				ProductVO product = makeProduct(re);
//				productList.add(product);
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			OracleUtill.dbDisconnection(re, conn, pst);
//		}
//
//		return productList;
//	}
//
//	// 상품 행사별 조회
//	public List<ProductVO> selectProductByPromotion(String promotion) {
//		List<ProductVO> productList = new ArrayList<>();
//		String sql = """
//				SELECT * FROM product where promotion = ?
//				""";
//		conn = OracleUtill.getConnection();
//
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, promotion);
//			re = pst.executeQuery();
//			while (re.next()) {
//				ProductVO product = makeProduct(re);
//				productList.add(product);
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			OracleUtill.dbDisconnection(re, conn, pst);
//		}
//
//		return productList;
//	}
//
//	// 상품 유형별 조회
//	public List<ProductVO> selectProductByKind(String kind) {
//		List<ProductVO> productList = new ArrayList<>();
//		String sql = """
//				SELECT * FROM product where kind= ?
//				""";
//		conn = OracleUtill.getConnection();
//
//		try {
//			pst = conn.prepareStatement(sql);
//			re = pst.executeQuery();
//			while (re.next()) {
//				ProductVO product = makeProduct(re);
//				productList.add(product);
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			OracleUtill.dbDisconnection(re, conn, pst);
//		}
//
//		return productList;
//	}
//
	// Product table 내용 삭제
	public int cleanProductTable() {
		int result = 0;
		String sql = """
				DELETE FROM product
				""";
		conn = OracleUtill.getConnection();
		try {
			st = conn.createStatement();
			result = st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, st);
		}

		return result;
	}

	// 상품 고급 검색
	public List<ProductVO> selectAdvancedProduct(int start, int end, String pname, String arrange, String kind, String event, String brand) {
		List<ProductVO> productList = new ArrayList<>();
		StringBuffer tempSb = new StringBuffer();
		
		String sql = """
				select * from ( SELECT p.product_name, p.promotion, p.brand, p.price, p.kind, p.product_img , ROWNUM rnum
				FROM product p WHERE 
				""";
		String sqlEnd = """
				ROWNUM <= ?
			)  WHERE rnum >= ?
				""";
		tempSb.append(sql);
		if(pname!=null && !pname.equals("")) {
			tempSb.append("product_name like '%"+pname+"%' and ");
		}
		if(kind!=null && !kind.equals("")) {
			tempSb.append("kind ='"+kind+"' and ");
		}
		if(event!=null && !event.equals("")) {
			tempSb.append("promotion ='"+event+"' and ");
		}
		if(brand!=null && !brand.equals("")) {
			tempSb.append("brand ='"+brand+"' and ");
		}
		tempSb.append(sqlEnd);
		if(arrange!=null && !arrange.equals("")) {
			tempSb.append(arrange);
		}
		
		sql = tempSb.toString();
		
		System.out.println("sql : "+sql);
		conn = OracleUtill.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, end);
			pst.setInt(2, start);
			
			re = pst.executeQuery();
			while (re.next()) {
				ProductVO product = makeProduct(re);
				productList.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}

		return productList;
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
