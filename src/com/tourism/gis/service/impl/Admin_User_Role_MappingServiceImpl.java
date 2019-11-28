package com.tourism.gis.service.impl;

import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.bean.Admin_User_Role_Mapping;
import com.tourism.gis.bean.Role;
import com.tourism.gis.bean.User;
import com.tourism.gis.dao.Admin_User_Role_MappingDao;
import com.tourism.gis.service.Admin_User_Role_MappingService;

@Transactional
public class Admin_User_Role_MappingServiceImpl implements Admin_User_Role_MappingService {

	private Admin_User_Role_MappingDao admin_User_Role_MappingDao;

	public void setAdmin_User_Role_MappingDao(Admin_User_Role_MappingDao admin_User_Role_MappingDao) {
		this.admin_User_Role_MappingDao = admin_User_Role_MappingDao;
	}

	@Override
	public void addAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		this.admin_User_Role_MappingDao.add(mapping);
	}

	@Override
	public void deleteAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		this.admin_User_Role_MappingDao.deleteMapping(mapping);
	}

	@Override
	public void updateAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		this.admin_User_Role_MappingDao.update(mapping);
	}

	@Override
	public Admin_User_Role_Mapping getAdmin_User_Role_MappingById(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		String hql = "from Admin_User_Role_Mapping a where a.id = ?";
		return this.admin_User_Role_MappingDao.get(hql, mapping.getId());
	}

	@Override
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByAdminId(AdminUser adminUser) {
		// TODO Auto-generated method stub
		String hql = "from Admin_User_Role_Mapping a where a.adminUser.adminId = ?";
		return this.admin_User_Role_MappingDao.getForSet(hql, adminUser.getAdminId());
	}

	@Override
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByUserId(User user) {
		// TODO Auto-generated method stub
		String hql = "from Admin_User_Role_Mapping a where a.user.userId = ?";
		return this.admin_User_Role_MappingDao.getForSet(hql, user.getUserId());
	}

	@Override
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByRoleId(Role role) {
		// TODO Auto-generated method stub
		String hql = "from Admin_User_Role_Mapping a where a.role.id = ?";
		return this.admin_User_Role_MappingDao.getForSet(hql, role.getId());
	}

	@Override
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSet(Object... objects) {
		// TODO Auto-generated method stub
		return null;
	}

}
