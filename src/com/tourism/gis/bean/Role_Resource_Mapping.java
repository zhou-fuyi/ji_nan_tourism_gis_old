package com.tourism.gis.bean;

/**
 * 角色资源映射表
 * 
 * @author Administrator
 *
 */
public class Role_Resource_Mapping {

	private String id;
	private Role role;
	private Resource resource;

	public Role_Resource_Mapping() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

}
