package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.User;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.UserDao;


public class UserDaoImpl extends BaseDao<User> implements UserDao{

	@Override
	public User getUser(User user) {
		String hql = "from User u where u.userEmail = ? and userPass = ?";
		return super.query(hql, user.getUserEmail(),user.getUserPass());
	}

	@Override
	public Set<User> getUserSet(Object... objects) {
		String hql = "from User";
		List<User> list = queryForList(hql, objects);
		if(list == null || list.size() == 0) {
			return null;
		}else {
			return new HashSet<>(super.queryForList(hql, objects));
		}
	}

	@Override
	public void saveUser(User user) {
		super.saveOrUpdate(user);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		super.saveOrUpdate(user);
	}
	
	@Override
	public boolean isExistUser(User user) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.userEmail = ?";
		User result = super.query(hql, user.getUserEmail());
		System.out.println(result);
		return super.query(hql, user.getUserEmail()) == null ? false : true;
	}
	
	@Override
	public boolean isExistUserName(User user) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.userName = ?";
		User result = super.query(hql, user.getUserName());
		System.out.println(result);
		return super.query(hql, user.getUserName()) == null ? false : true;
	}
	
	@Override
	public User loadUser(User user) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.userId = ?";
		return super.query(hql, user.getUserId());
	}
}
