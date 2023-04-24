package com.pyeoni.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pyeoni.vo.MemberVO;

/**
 * Servlet Filter implementation class LoginCheck
 */
@WebFilter("*.vi")
public class LoginCheckFilter extends HttpFilter implements Filter {
       

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req =(HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		if(req.getServletPath().equals("/auth/login.view")) {
			
		} else {
			HttpSession browser = req.getSession();
			MemberVO user = (MemberVO)browser.getAttribute("loginUser");
			if(user == null) {
				res.sendRedirect(req.getContextPath()+"/auth/login.view");
				return;
			}
			System.out.println("user: "+user);
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
