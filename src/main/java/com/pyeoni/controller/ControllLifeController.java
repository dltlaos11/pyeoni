package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class ControllLifeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "manageMember.jsp";
		
		MemberServices services = new MemberServices();
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		
		String coin = request.getParameter("coin");
		String memEmail = request.getParameter("Email");
		
		System.out.println("====== 가져온 값들 "+coin+" "+memEmail);
		
		List<MemberVO> memList = services.controllLife(coin, memEmail);
		System.out.println("***************");
		System.out.println(memList);
		System.out.println("***************");
		request.setAttribute("MemList", memList);
		
		return page;
	}

}
