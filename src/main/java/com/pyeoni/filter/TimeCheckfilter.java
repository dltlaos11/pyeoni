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

/**
 * Servlet Filter implementation class TimeCheckfilter
 */
@WebFilter("/*")
public class TimeCheckfilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public TimeCheckfilter() {
        System.out.println("시간 재는 필터 생성자");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		 System.out.println("시간 재는 필터 소멸자");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// 요청 필터
		long start = System.nanoTime();
		chain.doFilter(request, response);
		// 응답 필터
		long end = System.nanoTime();
		long result = end-start;
		String uri = ((HttpServletRequest)request).getRequestURI();
		System.out.println(uri+" 걸린 시간: "+result+"ns");
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		 System.out.println("시간 재는 필터 초기화");
	}

}
