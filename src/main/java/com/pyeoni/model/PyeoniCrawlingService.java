package com.pyeoni.model;

import java.util.List;

import com.pyeoni.vo.ProductVO;

public class PyeoniCrawlingService {
	PyeoniCrawlingDAO dao = new PyeoniCrawlingDAO();
	
	public List<ProductVO> getCrawalingList() {
		return dao.getCrawalingList();
	}
}
