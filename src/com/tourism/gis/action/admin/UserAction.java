package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.User;
import com.tourism.gis.service.UserService;
import com.tourism.gis.util.WriteJsonFile;

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

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		user = new User();
		return user;
	}

}
