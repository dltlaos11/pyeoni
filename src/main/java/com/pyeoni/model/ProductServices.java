package com.pyeoni.model;

import java.util.List;

import com.pyeoni.vo.ProductVO;

public class ProductServices {
	ProductDAO pDAO = new ProductDAO();
	
	public List<ProductVO> selectAllProduct() {
		return pDAO.selectAllProduct();
	}
	
	public int insertProduct(ProductVO product) {
		return pDAO.insertProduct(product);
	}

	// 상품 상세 조회
	public ProductVO detailProduct(String product_name, String promotion, String brand, int price) {
		return pDAO.detailProduct(product_name, promotion, brand, price);	
	}
}
