package com.pyeoni.controller;

import java.awt.Point;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.ProductServices;
import com.pyeoni.vo.ProductVO;

public class PageController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		// 처음 편의점 상품 검색 페이지 불러올 때
		String page = null;
		String brandValue = null;

		int start, end;

		String method = (String) data.get("method");
		System.out.println(method + " : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");

		if (req.getRequestURI().contains("gs")) {
			page = "GSpage.jsp";
			brandValue = "GS25";
		}

		else if (req.getRequestURI().contains("emart")) {
			page = "Emartpage.jsp";
			brandValue = "emart24";
		}

		else if (req.getRequestURI().contains("cspace")) {
			page = "Cspacepage.jsp";
			brandValue = "C·SPACE";
		}

		else if (req.getRequestURI().contains("mini")) {
			page = "Minipage.jsp";
			brandValue = "MINISTOP";
		}

		else if (req.getRequestURI().contains("seven")) {
			page = "Sevenpage.jsp";
			brandValue = "7-ELEVEn";
		}

		else if (req.getRequestURI().contains("all")) {
			page = "Allpage.jsp";
			brandValue = req.getParameter("brand");
		}

		else if (req.getRequestURI().contains("cu")) {
			page = "cupage.jsp";
			brandValue = "CU";
		}

		String searchValue = req.getParameter("search_bar");

		String sortValue = req.getParameter("sort_type");

		String eventValue = req.getParameter("event_type");

		String kindValue = req.getParameter("product_type");

		ProductServices services = new ProductServices();
		List<ProductVO> productList = new ArrayList<>();

		productList = services.selectAdvancedProduct(1, 20, searchValue, sortValue, kindValue, eventValue, brandValue);

		req.setAttribute("productList", productList);

		return page;
	}

}
