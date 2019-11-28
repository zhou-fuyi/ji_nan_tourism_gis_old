package com.tourism.gis.service.impl;

import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.User;
import com.tourism.gis.dao.ArticleDao;
import com.tourism.gis.dao.UserDao;
import com.tourism.gis.service.UserService;
import com.tourism.gis.util.bean.PageBean;

@Transactional
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	private ArticleDao articleDao;

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void registerUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public boolean isExistUser(User user) {
		return userDao.isExistUser(user);
	}

	@Override
	public boolean isExistUserName(User user) {
		// TODO Auto-generated method stub
		return userDao.isExistUserName(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return userDao.getUser(user);
	}

	@Override
	public Set<User> getUserSet(Object... objects) {
		// TODO Auto-generated method stub
		return userDao.getUserSet(objects);
	}

	@Override
	public PageBean<Article> loadUserArticles(User user, int pageCode) {
		// TODO Auto-generated method stub
		return this.articleDao.loadUserArticle(user, pageCode);
	}

	@Override
	public User getUserByUserId(User user) {
		// TODO Auto-generated method stub
		return this.userDao.loadUser(user);
	}
}
