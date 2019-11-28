package com.tourism.gis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tourism.gis.bean.User;

/**
 * 对一些需要登录才能访问的jsp页面,进行过滤
 */
@WebFilter(urlPatterns = { "/LoginFilter", "/user/*", "/article/addArticle.jsp" })
public class LogInFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LogInFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("LoginFilter...");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			/*
			 * request.setAttribute("code", "error"); request.setAttribute("msg",
			 * "请先进行登录...");
			 */
			response.sendRedirect("/ji_nan_tourism_gis_old/info.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
