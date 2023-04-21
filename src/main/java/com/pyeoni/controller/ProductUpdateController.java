package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.ProductServices;
import com.pyeoni.model.PyeoniCrawlingService;
import com.pyeoni.vo.ProductVO;

public class ProductUpdateController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		PyeoniCrawlingService service = new PyeoniCrawlingService();
		ProductServices service2 = new ProductServices();

		List<ProductVO> productList = service.getCrawalingList();
		
		HttpServletRequest req = (HttpServletRequest)data.get("request");
		req.setAttribute("ProductAll", productList);
		
		
		System.out.println("table 삭제 성공여부 : "+service2.cleanProductTable());
		
		int count=0;
		for(ProductVO p : productList) {
			System.out.println(p);
			count++;
			service2.insertProduct(p);
		}
		System.out.println("크롤링된 상품 개수 : "+count);
		
		return "redirect:/page/main.view";
	}

}
