package com.tourism.gis.bean;

/**
 * 用户 管理员 角色 关系映射表
 * 
 * @author Administrator
 *
 */
public class Admin_User_Role_Mapping {

	private String id;
	private AdminUser adminUser;
	private User user;
	private Role role;

	public Admin_User_Role_Mapping() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
