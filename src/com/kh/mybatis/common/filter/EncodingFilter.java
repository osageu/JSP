package com.kh.mybatis.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(urlPatterns="/*")
public class EncodingFilter implements Filter {

    public EncodingFilter() {
    	
    }

	public void destroy() {
		
	}

	// 내가 등록한 서블릿 가기 전에 이 doFilter가 먼저 호출됨
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response); // servlet과의 연결다리
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
