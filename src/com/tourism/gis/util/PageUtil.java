package com.tourism.gis.util;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {

	/**
	 * 获取请求的页码
	 * 
	 * @param request
	 * @return
	 */
	public static int getPageCode(HttpServletRequest request) {
		String pc = request.getParameter("pageCode");
		int pageCode = 1;
		if (pc != null && !pc.trim().isEmpty()) {
			try {
				pageCode = Integer.parseInt(pc);
			} catch (NumberFormatException e) {
				System.out.println("pageCode   转化出错了");
				e.printStackTrace();
			}
		}
		System.out.println("pageCode" + pageCode);
		return pageCode;
	}

	/**
	 * 队请求的链接进行处理
	 * 
	 * @param request
	 * @return
	 */
	public static String getURL(HttpServletRequest request) {
		String url = request.getRequestURI() + "?" + request.getQueryString();
		url = url.substring(10);
		int index = url.lastIndexOf("&pageCode=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		System.out.println("url..........." + url);
		return url;
	}

	public static Integer getSign(HttpServletRequest request) {
		Integer sign = Integer.valueOf(request.getParameter("sign"));
		System.out.println(sign);
		return sign;
	}
}
