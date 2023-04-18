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

}
