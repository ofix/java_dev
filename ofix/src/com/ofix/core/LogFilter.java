package com.ofix.core;
import javax.servlet.*;
import java.util.*;
public class LogFilter implements Filter {
	public void init(FilterConfig config) throws ServletException{
		String site = config.getInitParameter("Site");
		System.out.println("��־1,��վ����: "+site);
	}
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws java.io.IOException,ServletException{
		System.out.println("��־2::http://www.ofix.github.com");
		chain.doFilter(request,response);
	}
	public void destroy(){
		
	}
}
