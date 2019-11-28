package com.tourism.gis.bean;

/**
 * 角色类
 * 
 * @author Administrator
 *
 */
public class Role {

	private String id;
	private String roleName;
	private Integer isUsed;
	private String detail;

	public Role() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Integer isUsed) {
		this.isUsed = isUsed;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ",  isUsed=" + isUsed + ", detail=" + detail + "]";
	}

}
