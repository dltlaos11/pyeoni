package com.pyeoni.model;

import java.util.List;

import com.pyeoni.vo.ProductVO;

public class ProductServices {
	ProductDAO pDAO = new ProductDAO();
	
	public List<ProductVO> selectAllProduct(int start, int end) {
		return pDAO.selectAllProduct(start, end);
	}
	
	public int insertProduct(ProductVO product) {
		return pDAO.insertProduct(product);
	}

	// 상품 개별 조회
	public ProductVO detailProduct(String product_name, String promotion, String brand, int price) {
		return pDAO.detailProduct(product_name, promotion, brand, price);	
	}
	
	// 상품 편의점 회사별 조회
	public List<ProductVO> selectProductByBrand(String brand){
		return pDAO.selectProductByBrand(brand);
	}
	
	// 상품 행사별 조회
	public List<ProductVO> selectProductByPromotion(String promotion){
		return pDAO.selectProductByPromotion(promotion);
	}
	
	// 상품 유형별 조회
	public List<ProductVO> selectProductByKind(String kind){
		return pDAO.selectProductByKind(kind);
	}
	
	// Product table 내용 삭제
	public int cleanProductTable() {
		// 삭제한 튜플 개수 반환
		return pDAO.cleanProductTable();
	}
}
