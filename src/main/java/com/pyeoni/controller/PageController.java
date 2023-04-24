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
		String page = null;

		String method = (String) data.get("method");
		System.out.println(method + " : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");

		if (method.equals("GET")) {
			if (req.getRequestURI().contains("gs"))
				page = "GSpage.jsp";
			else if (req.getRequestURI().contains("emart"))
				page = "Emartpage.jsp";
			else if (req.getRequestURI().contains("cspace"))
				page = "Cspacepage.jsp";
			else if (req.getRequestURI().contains("mini"))
				page = "Minipage.jsp";
			else if (req.getRequestURI().contains("seven"))
				page = "Sevenpage.jsp";
			else if (req.getRequestURI().contains("all"))
				page = "Allpage.jsp";
			else if (req.getRequestURI().contains("cu"))
				page = "cupage.jsp";

			String searchValue = req.getParameter("search_bar");
			if(searchValue!=null)
				System.out.println("검색어 : "+searchValue);
			String sortValue = req.getParameter("sort_type");

			String productValue = req.getParameter("product_type");

			String eventValue = req.getParameter("event_type");
			
			String kindValue = req.getParameter("product_type");
			
			String brandValue = req.getParameter("brand");
			
			ProductServices services = new ProductServices();
			List<ProductVO> productList = new ArrayList<>();
			
			
			productList = services.selectAdvancedProduct(1, 20, searchValue, sortValue, kindValue, eventValue, brandValue);
			
			req.setAttribute("productList", productValue);

		}

		return page;
	}

}
