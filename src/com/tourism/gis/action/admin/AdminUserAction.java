package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.service.AdminUserService;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminUser adminUser;
	private AdminUserService adminUserService;

	/**
	 * 用于向前台发送json
	 */
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	/**
	 * 管理员登陆
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String login() throws UnsupportedEncodingException {
		System.out.println(adminUser);
		if (checkAdminUser(adminUser)) {
			AdminUser queryUser = adminUserService.adminUserLogin(adminUser);
			if (queryUser != null) {
				System.out.println("欢迎您登陆魅力济南后台管理系统！");

				ActionContext.getContext().getSession().put("adminUser", queryUser);
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
				return "adminJson";
			} else {
				System.out.println("登陆失败！");
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
				return "adminJson";
			}
		} else {
			System.out.println("登陆失败！");
			this.addActionError("用户名或密码为空！");
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "adminJson";
		}
	}

	public boolean checkAdminUser(AdminUser adminUser) {
		if (adminUser.getAdminEmail() == null || adminUser.getAdminEmail() == "") {
			return false;
		} else if (adminUser.getAdminPass() == null || adminUser.getAdminPass() == "") {
			return false;
		} else {
			return true;
		}
	}

	public String logout() {
		AdminUser onlineUser = (AdminUser) ActionContext.getContext().getSession().get("adminUser");
		System.out.println(onlineUser);
		System.out.println("管理员注销操作");
		if (onlineUser != null) {
			ActionContext.getContext().getSession().remove("adminUser");
			onlineUser.setLastLoginTime(new Timestamp(new Date().getTime()));
			adminUserService.updateAdminUser(onlineUser);
		}
		return "logout";
	}

	@Override
	public AdminUser getModel() {
		// TODO Auto-generated method stub
		adminUser = new AdminUser();
		return adminUser;
	}

}
