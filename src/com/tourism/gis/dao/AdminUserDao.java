package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.AdminUser;


public interface AdminUserDao {

	/**
	 * 添加管理员
	 * @param adminUser
	 */
	public void addAdminUser(AdminUser adminUser);

	/**
	 * 修改管理员
	 * @param adminUser
	 */
	public void updateAdminUser(AdminUser adminUser);

	/**
	 * 删除管理员
	 * @param adminUser
	 */
	public void deleteAdminUser(AdminUser adminUser);

	/**
	 * 获取指定管理员
	 * @param adminUser
	 * @return
	 */
	public AdminUser getAdminUser(AdminUser adminUser);

	/**
	 * 获取所有管理员
	 * @param objects
	 * @return
	 */
	public List<AdminUser> getAdminUserList(Object... objects);
	
	/**
	 * 管理员登陆查询
	 * @param adminUser
	 * @return
	 */
	public AdminUser getAdminUserByLogin(AdminUser adminUser);
}
