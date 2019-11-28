package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.User;
import com.tourism.gis.service.UserService;
import com.tourism.gis.util.PageUtil;
import com.tourism.gis.util.WriteJsonFile;
import com.tourism.gis.util.bean.PageBean;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private UserService userService;
	private InputStream inputStream;
	private String userJson = "userJson";
	private String pathName = "json\\user\\user.json";

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String getUserSet() throws UnsupportedEncodingException {
		Set<User> userSet = userService.getUserSet();
		if (userSet == null || userSet.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		String result = new Gson().toJson(userSet);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return userJson;
	}

	public String loadUserArticles() {
		User loginUser = (User) ActionContext.getContext().getSession().get("user");
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		int pageCode = PageUtil.getPageCode(request);
		if (loginUser != null) {
			PageBean<Article> pageBean = userService.loadUserArticles(loginUser, pageCode);
			System.out.println(pageBean);
			ActionContext.getContext().getSession().put("userArticle", pageBean);
			return "self";
		} else {
			System.out.println("当前会话已失效，请重新登陆！");
			return "info";
		}
	}

	public String updateUserInfo() throws UnsupportedEncodingException {
		System.out.println(user);
		if (user.getUserId() == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		User temp = this.userService.getUserByUserId(user);
		System.out.println(temp);
		temp.setUserName(user.getUserName());
		temp.setUserCname(user.getUserCname());
		temp.setUserGender(user.getUserGender());
		temp.setUserAge(user.getUserAge());
		temp.setUserTel(user.getUserTel());
		this.userService.updateUser(temp);
		ActionContext.getContext().getSession().put("user", userService.getUserByUserId(temp));
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return userJson;
	}

	public String updateUserPass() throws UnsupportedEncodingException {
		System.out.println(user);
		if (user.getUserId() == null || user.getUserId() == "") {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		if (user.getUserPass() == null || user.getUserPass() == "") {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		if (user.getRePassword() == null || user.getRePassword() == "") {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		User temp = userService.getUserByUserId(user);
		System.out.println(temp.getUserPass() == user.getUserPass());
		System.out.println(temp.getUserPass().equals(user.getUserPass()));
		if (temp.getUserPass().equals(user.getUserPass())) {
			temp.setUserPass(user.getRePassword());
			temp.setRePassword(user.getRePassword());
			userService.updateUser(temp);
			ActionContext.getContext().getSession().remove("user");
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return userJson;
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
	}

	public String updateUserPicture() throws UnsupportedEncodingException {
		User onlineUser = (User) ActionContext.getContext().getSession().get("user");
		if (onlineUser == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		if (user.getUserPicture() == null || user.getUserPicture() == "") {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return userJson;
		}
		User temp = userService.getUserByUserId(onlineUser);
		temp.setUserPicture(user.getUserPicture());
		userService.updateUser(temp);
		ActionContext.getContext().getSession().put("user", userService.getUserByUserId(temp));
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return userJson;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		user = new User();
		return user;
	}

}
