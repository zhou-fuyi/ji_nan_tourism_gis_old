package com.tourism.gis.service.impl;

import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Resource;
import com.tourism.gis.bean.Role;
import com.tourism.gis.bean.Role_Resource_Mapping;
import com.tourism.gis.dao.Role_Resource_MappingDao;
import com.tourism.gis.service.Role_Resource_MappingService;

@Transactional
public class Role_Resource_MappingServiceImpl implements Role_Resource_MappingService {

	private Role_Resource_MappingDao role_Resource_MappingDao;

	public void setRole_Resource_MappingDao(Role_Resource_MappingDao role_Resource_MappingDao) {
		this.role_Resource_MappingDao = role_Resource_MappingDao;
	}

	@Override
	public void addRole_Resource_Mapping(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		this.role_Resource_MappingDao.add(mapping);
	}

	@Override
	public void deleteRole_Resource_Mapping(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		this.role_Resource_MappingDao.deleteMapping(mapping);
	}

	@Override
	public void updateRole_Resource_Mapping(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		this.role_Resource_MappingDao.update(mapping);
	}

	@Override
	public Role_Resource_Mapping getRole_Resource_MappingById(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		return this.role_Resource_MappingDao.get(mapping);
	}

	@Override
	public Set<Role_Resource_Mapping> getRole_Resource_MappingSetByRoleId(Role role) {
		// TODO Auto-generated method stub
		String hql = "from Role_Resource_Mapping r where r.role.id = ?";
		return this.role_Resource_MappingDao.getForSet(hql, role.getId());
	}

	@Override
	public Set<Role_Resource_Mapping> getRole_Resource_MappingByResourceId(Resource res) {
		// TODO Auto-generated method stub
		String hql = "from Role_Resource_Mapping r where r.resource.id = ?";
		return this.role_Resource_MappingDao.getForSet(hql, res.getId());
	}

	@Override
	public Set<Role_Resource_Mapping> getRole_Resource_Mapping(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from Role_Resource_Mapping";
		return this.role_Resource_MappingDao.getForSet(hql, objects);
	}

}
