package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Role;
import com.tourism.gis.service.RoleService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;

public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RoleService roleService;
	private Role role;
	private InputStream inputStream;
	private String roleJson = "roleJson";
	private String pathName = "json\\role\\role.json";

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String addRole() throws UnsupportedEncodingException {
		if (role == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return roleJson;
		} else {
			role.setId(CommonUtils.uuid());
			roleService.addRole(role);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return roleJson;
		}
	}

	/**
	 * 获取所有Role
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getRoleSet() throws UnsupportedEncodingException {
		Set<Role> set = roleService.getRoleSet();
		if (set == null || set.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return roleJson;
		} else {
			String result = JSON.toJSONString(set);
			WriteJsonFile.writeConfigJsonFile(result, pathName);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return roleJson;
		}
	}

	@Override
	public Role getModel() {
		// TODO Auto-generated method stub
		role = new Role();
		return role;
	}

}
