package com.tourism.gis.service.impl;

import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Role;
import com.tourism.gis.dao.RoleDao;
import com.tourism.gis.service.RoleService;

@Transactional
public class RoleServiceImpl implements RoleService {

	private RoleDao roleDao;

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public void addRole(Role role) {
		// TODO Auto-generated method stub
		roleDao.add(role);
	}

	@Override
	public void deleteRole(Role role) {
		// TODO Auto-generated method stub
		roleDao.deleteRole(role);
	}

	@Override
	public void updateRole(Role role) {
		// TODO Auto-generated method stub
		roleDao.update(role);
	}

	@Override
	public Role getRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.get(role);
	}

	@Override
	public Set<Role> getRoleSet(Object... objects) {
		// TODO Auto-generated method stub
		return roleDao.getForSet(objects);
	}

}
