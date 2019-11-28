package com.tourism.gis.service;

import java.util.Set;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.User;
import com.tourism.gis.util.bean.PageBean;

public interface UserService {

	/**
	 * 用户注册
	 * 
	 * @param user
	 */
	void registerUser(User user);

	/**
	 * 根据邮箱号进行检测 该邮箱号是否已经被使用
	 * 
	 * @param user
	 */
	boolean isExistUser(User user);

	/**
	 * 根据用户名检测 该用户名是否已经被使用
	 * 
	 * @param user
	 * @return
	 */
	boolean isExistUserName(User user);

	/**
	 * 更新用户
	 * 
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 根据用户名和密码获取指定用户
	 * 
	 * @param user
	 * @return
	 */
	User getUser(User user);

	User getUserByUserId(User user);

	/**
	 * 获取用户列表
	 * 
	 * @param objects
	 * @return
	 */
	Set<User> getUserSet(Object... objects);

	PageBean<Article> loadUserArticles(User user, int pageCode);
}
