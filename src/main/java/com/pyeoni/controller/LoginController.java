package com.pyeoni.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class LoginController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String)data.get("method");
		String page = "";
		
		if(method.equals("GET")) {
			page = "loginpage.jsp";
		} else {
			HttpServletRequest request = (HttpServletRequest)data.get("request");
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			MemberServices service = new MemberServices();
			MemberVO member = service.login(email, password);
			
			ServletContext app = request.getServletContext();
			Object obj = app.getAttribute("userList");
			List<MemberVO> userList = null;
			if(member != null) {
				/* 로그인 성공 */
				if(obj == null) {
					userList = new ArrayList<>();
				} else {
					userList = (List<MemberVO>) obj;
				}
				userList.add(member);
				app.setAttribute("userList", userList);
				System.out.println("================로그인 한 사람 ======================");
				for(MemberVO mem: userList) {
					System.out.println(mem);
				}
				System.out.println("================================================");
				
				HttpSession session = request.getSession();
				session.setAttribute("userList", member);
				String path = request.getContextPath();
				page = "redirect:"+path+"/auth/login.view";
			} else {
				/* 로그인 실패 */
				page = "redirect:login.view";
			}
			
		}
		
		return page;
	}

}
