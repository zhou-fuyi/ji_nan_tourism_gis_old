package com.tourism.gis.dao.impl;

import java.util.List;

import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.dao.AdminUserDao;
import com.tourism.gis.dao.BaseDao;

public class AdminUserDaoImpl extends BaseDao<AdminUser> implements AdminUserDao {

	@Override
	public void addAdminUser(AdminUser adminUser) {
		saveOrUpdate(adminUser);
	}

	@Override
	public void updateAdminUser(AdminUser adminUser) {
		saveOrUpdate(adminUser);
	}

	@Override
	public void deleteAdminUser(AdminUser adminUser) {
		delete(adminUser);
	}

	@Override
	public AdminUser getAdminUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		String hql = "from AdminUser a where a.adminId = ?";
		return query(hql, adminUser.getAdminId());
	}

	@Override
	public List<AdminUser> getAdminUserList(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from AdminUser";
		return queryForList(hql, objects);
	}

	@Override
	public AdminUser getAdminUserByLogin(AdminUser adminUser) {
		// TODO Auto-generated method stub
		String hql = "from AdminUser a where a.adminEmail = ? and a.adminPass = ?";
		return query(hql, adminUser.getAdminEmail(), adminUser.getAdminPass());
	}

}
