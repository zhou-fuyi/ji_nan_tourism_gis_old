package com.tourism.gis.bean;

/**
 * 资源类
 * 
 * @author Administrator
 *
 */
public class Resource {

	private String id; // ID
	private String resName; // 资源名称
	private String remark; // 资源组别
	private String detail; // 资源描述
	private Integer isUsed; // 是否可用

	public Resource() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Integer isUsed) {
		this.isUsed = isUsed;
	}

}
