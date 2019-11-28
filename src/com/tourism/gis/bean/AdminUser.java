package com.tourism.gis.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AdminUser {

	private String adminId;
	private String adminName;
	private String adminPass;
	private String adminCname;
	private Integer adminAge;
	private String adminTel;
	private String adminEmail;
	private String adminPicture;
	private Timestamp registerTime;
	private Timestamp lastLoginTime;
	private Set<Article> articleSet = new HashSet<>();
	//private Role role;

	public AdminUser() {
		// TODO Auto-generated constructor stub
	}

	public AdminUser(String adminId, String adminName, String adminPass, String adminCname, Integer adminAge,
			String adminTel, String adminEmail, String adminPicture, Timestamp registerTime, Timestamp lastLoginTime) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPass = adminPass;
		this.adminCname = adminCname;
		this.adminAge = adminAge;
		this.adminTel = adminTel;
		this.adminEmail = adminEmail;
		this.adminPicture = adminPicture;
		this.registerTime = registerTime;
		this.lastLoginTime = lastLoginTime;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public String getAdminCname() {
		return adminCname;
	}

	public void setAdminCname(String adminCname) {
		this.adminCname = adminCname;
	}

	public Integer getAdminAge() {
		return adminAge;
	}

	public void setAdminAge(Integer adminAge) {
		this.adminAge = adminAge;
	}

	public String getAdminTel() {
		return adminTel;
	}

	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminPicture() {
		return adminPicture;
	}

	public void setAdminPicture(String adminPicture) {
		this.adminPicture = adminPicture;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Set<Article> getArticleSet() {
		return articleSet;
	}

	public void setArticleSet(Set<Article> articleSet) {
		this.articleSet = articleSet;
	}

	/*public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}*/

	/*
	 * @Override public String toString() { return "AdminUser [adminId=" + adminId +
	 * ", adminName=" + adminName + ", adminPass=" + adminPass + ", adminCname=" +
	 * adminCname + ", adminAge=" + adminAge + ", adminTel=" + adminTel +
	 * ", adminEmail=" + adminEmail + ", adminPicture=" + adminPicture +
	 * ", registerTime=" + registerTime + ", lastLoginTime=" + lastLoginTime +
	 * ", articleSet=" + articleSet + "]"; }
	 */

}
