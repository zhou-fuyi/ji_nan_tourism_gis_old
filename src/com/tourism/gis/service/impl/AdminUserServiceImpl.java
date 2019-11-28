package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.dao.AdminUserDao;
import com.tourism.gis.service.AdminUserService;

@Transactional
public class AdminUserServiceImpl implements AdminUserService {

	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	@Override
	public AdminUser adminUserLogin(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return this.adminUserDao.getAdminUserByLogin(adminUser);
	}

	@Override
	public void addAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		this.adminUserDao.addAdminUser(adminUser);
	}

	@Override
	public void updateAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		this.adminUserDao.updateAdminUser(adminUser);
	}

	@Override
	public void deleteAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		this.adminUserDao.deleteAdminUser(adminUser);
	}

	@Override
	public AdminUser getAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return this.adminUserDao.getAdminUser(adminUser);
	}

	@Override
	public List<AdminUser> getAdminUserList(Object... objects) {
		// TODO Auto-generated method stub
		return this.adminUserDao.getAdminUserList(objects);
	}

}
