package com.tourism.gis.dao;

import java.util.Set;

import com.tourism.gis.bean.User;

public interface UserDao {

	/**
	 * 指定用户查询
	 * 
	 * @param user
	 * @return
	 */
	User getUser(User user);

	/**
	 * 获取用户列表
	 */
	Set<User> getUserSet(Object... objects);

	/**
	 * 新增用户
	 * 
	 * @param user
	 */
	void saveUser(User user);

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 根据邮箱号查询 检测该邮箱号是否已经被使用
	 * 
	 * @param user
	 * @return
	 */
	boolean isExistUser(User user);

	/**
	 * 根据用户名进行查询 检测该用户名是否已经被使用
	 * 
	 * @param user
	 * @return
	 */
	boolean isExistUserName(User user);

	/**
	 * 加载用户信息以及用户发表的文章
	 * 
	 * @param user
	 * @return
	 */
	User loadUser(User user);

}
