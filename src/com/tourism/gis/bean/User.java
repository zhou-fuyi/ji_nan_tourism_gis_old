package com.tourism.gis.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class User {

	private String userId;
	private String userName;
	private String userPass;
	private String userCname;
	private String userGender;
	private Integer userAge;
	private String userTel;
	private String userEmail;
	private String userPicture;
	private Timestamp registerTime;
	private Timestamp lastLoginTime;
	private Integer isOnline;
	private Integer userStatus;
	private Integer userLevel;
	private String activationCode;
	private Integer disabled;
	private String rePassword;
	private Set<Article> articleSet = new HashSet<>();

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String userName, String userPass, String userCname, String userGender, Integer userAge,
			String userTel, String userEmail, String userPicture, Timestamp registerTime, Timestamp lastLoginTime,
			Integer isOnline, Integer userStatus, Integer userLevel, String activationCode, Integer disabled) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userCname = userCname;
		this.userGender = userGender;
		this.userAge = userAge;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.userPicture = userPicture;
		this.registerTime = registerTime;
		this.lastLoginTime = lastLoginTime;
		this.isOnline = isOnline;
		this.userStatus = userStatus;
		this.userLevel = userLevel;
		this.activationCode = activationCode;
		this.disabled = disabled;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserCname() {
		return userCname;
	}

	public void setUserCname(String userCname) {
		this.userCname = userCname;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
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

	public Integer getIsOnline() {
		return isOnline;
	}

	public void setIsOnline(Integer isOnline) {
		this.isOnline = isOnline;
	}

	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	public Integer getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public Integer getDisabled() {
		return disabled;
	}

	public void setDisabled(Integer disabled) {
		this.disabled = disabled;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getRePassword() {
		return rePassword;
	}

	public Set<Article> getArticleSet() {
		return articleSet;
	}

	public void setArticleSet(Set<Article> articleSet) {
		this.articleSet = articleSet;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPass=" + userPass + ", userCname="
				+ userCname + ", userGender=" + userGender + ", userAge=" + userAge + ", userTel=" + userTel
				+ ", userEmail=" + userEmail + ", userPicture=" + userPicture + ", registerTime=" + registerTime
				+ ", lastLoginTime=" + lastLoginTime + ", isOnline=" + isOnline + ", userStatus=" + userStatus
				+ ", userLevel=" + userLevel + ", activationCode=" + activationCode + ", disabled=" + disabled
				+ ", rePassword=" + rePassword + ", articleSet=" + articleSet + "]";
	}

}
