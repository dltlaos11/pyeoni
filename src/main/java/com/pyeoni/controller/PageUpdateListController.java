package com.pyeoni.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.ProductServices;
import com.pyeoni.vo.ProductVO;

public class PageUpdateListController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		// 상품 더 보기를 눌렀을 때
		int start, end;

		String method = (String) data.get("method");
		System.out.println(method + " : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");

		if (method.equals("GET")) {
			
			String brandValue = req.getParameter("brand");

			String searchValue = req.getParameter("search_bar");

			String sortValue = req.getParameter("sort_type");

			String eventValue = req.getParameter("event_type");
			
			String kindValue = req.getParameter("product_type");
			
			ProductServices services = new ProductServices();
			List<ProductVO> productList = new ArrayList<>();
			
			start = req.getParameter("start") !=null? Integer.parseInt(req.getParameter("start")) : 1;
			end = req.getParameter("end") !=null? Integer.parseInt(req.getParameter("end")) : 20;
			
			productList = services.selectAdvancedProduct(start, end, searchValue, sortValue, kindValue, eventValue, brandValue);
			
			req.setAttribute("productList", productList);

		}
		
		return "../product/AddList.jsp";
	}

}
