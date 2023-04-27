package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		
		class Result {
			int delcount;
			int crawalingCount;
		}
		
		Result result = new Result();
		result.delcount = service2.cleanProductTable();

		System.out.println("table 삭제 성공여부 : "+result.delcount);
		
		
		int count=0;
		for(ProductVO p : productList) {
			System.out.println(p);
			count+=service2.insertProduct(p);
		}
		System.out.println("크롤링된 상품 개수 : "+count);
		
		result.crawalingCount = count;
		

		System.out.println(result.delcount+ " "+ result.crawalingCount);
		
		JSONObject updatesObj = new JSONObject();
		
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("tableDelCount", result.delcount);
		obj.put("crawalingCount", result.crawalingCount);
		arr.add(obj);
		updatesObj.put("updateList", arr);
		if (count == 0 ) {
			/* 실패 */
			return "responseBody:false";
		}else {
			/* 성공 */
			return "responseBody:"+updatesObj.toJSONString();
		}
	}

}
