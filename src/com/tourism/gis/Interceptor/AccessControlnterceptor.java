package com.tourism.gis.Interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.bean.User;

public class AccessControlnterceptor extends AbstractInterceptor {

	/**
	 * 权限控制
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		// 从session中获取当前用户信息
		User user = (User) ActionContext.getContext().getSession().get("user");
		AdminUser adminUser = (AdminUser) ActionContext.getContext().getSession().get("adminUser");
		String namespace = invocation.getProxy().getNamespace();
		if(namespace.equals("/admin")) {
			namespace += "/";
		}
		String actionName = invocation.getProxy().getActionName();
		//String realPath = ServletActionContext.getServletContext().getRealPath("/");
		//System.out.println(realPath);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST); 
		String result = request.getRequestURI();
		System.out.println(result);
		System.out.println(request.getParameter("name"));
		//result = request.getParameter("formData");
		
		//System.out.println(result);
		System.out.println("AccessControl...");
		/**
		 * 对应的权限URL，用户要访问的URL
		 * 也是 资源对应的URL
		 */
		String preUrl = namespace + actionName; 
		System.out.println(preUrl);
		/*if(namespace.equals("/admin/")) {
			if (adminUser == null) {
				System.out.println("管理员未登录");
				if(preUrl.startsWith("/admin/user-login")) {
					//如果是登录  就放行
					System.out.println("放行");
					return invocation.invoke();
				}else {
					System.out.println("转到首页");
					return "adminLoginUI";
				}
			}else {
				// 普通用户暂时没有权限控制
				System.out.println("暂时没有权限控制");
				return invocation.invoke();
			}
		}else {
			if (user == null) {
				System.out.println("用户未登录");
				if(preUrl.startsWith("/user-login")) {
					//如果是登录  就放行
					System.out.println("放行");
					return invocation.invoke();
				}else {
					System.out.println("转到首页");
					return "loginUI";
				}
			}else {
				// 普通用户暂时没有权限控制
				System.out.println("暂时没有权限控制");
				return invocation.invoke();
			}
		}*/
		return invocation.invoke();
		
	}
	
	public boolean adminCheckRole(AdminUser adminUser, String url) {
		return false;
	}
	
	public boolean userCheckRole(AdminUser adminUser, String url) {
		return false;
	}

}
