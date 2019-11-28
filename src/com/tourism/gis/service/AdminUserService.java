package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.AdminUser;

public interface AdminUserService {

	/**
	 * 管理员登陆
	 * 
	 * @param adminUser
	 * @return
	 */
	public AdminUser adminUserLogin(AdminUser adminUser);

	/**
	 * 添加管理员
	 * 
	 * @param adminUser
	 */
	public void addAdminUser(AdminUser adminUser);

	/**
	 * 修改管理员
	 * 
	 * @param adminUser
	 */
	public void updateAdminUser(AdminUser adminUser);

	/**
	 * 删除管理员
	 * 
	 * @param adminUser
	 */
	public void deleteAdminUser(AdminUser adminUser);

	/**
	 * 获取指定管理员
	 * 
	 * @param adminUser
	 * @return
	 */
	public AdminUser getAdminUser(AdminUser adminUser);

	/**
	 * 获取所有管理员
	 * 
	 * @param objects
	 * @return
	 */
	public List<AdminUser> getAdminUserList(Object... objects);
}
