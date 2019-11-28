package com.tourism.gis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter;

/**
 * 这里使用filter 对 struts2 拦截器做一些处理 上传图片需要使用自定义过滤器 不然接收不到file
 * 
 * @author Administrator
 *
 */
@WebFilter("/*")
public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();
		System.out.println(url);
		String ueditorPath = "/ji_nan_tourism_gis_old/ueditor/jsp/";
		String ueditorPath2 = "/ji_nan_tourism_gis_old/admin/static/plugins/ueditor/jsp/";
		if (url.contains(ueditorPath) || url.contains(ueditorPath2)) {
			System.out.println("使用自定义过滤器");
			chain.doFilter(request, response);
		} else {
			System.out.println("使用默认过滤器");
			super.doFilter(request, response, chain);
		}
	}

}
