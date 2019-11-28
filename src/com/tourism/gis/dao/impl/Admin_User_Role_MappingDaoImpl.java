package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Admin_User_Role_Mapping;
import com.tourism.gis.dao.Admin_User_Role_MappingDao;
import com.tourism.gis.dao.BaseDao;

public class Admin_User_Role_MappingDaoImpl extends BaseDao<Admin_User_Role_Mapping>
		implements Admin_User_Role_MappingDao {

	@Override
	public void add(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		saveOrUpdate(mapping);
	}

	@Override
	public void update(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		saveOrUpdate(mapping);
	}

	@Override
	public Admin_User_Role_Mapping get(String hql, Object... objects) {
		// TODO Auto-generated method stub
		return query(hql, objects);
	}

	@Override
	public Set<Admin_User_Role_Mapping> getForSet(String hql, Object... objects) {
		// TODO Auto-generated method stub
		List<Admin_User_Role_Mapping> list = queryForList(hql, objects);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return new HashSet<>(list);
		}
	}

	@Override
	public void deleteMapping(Admin_User_Role_Mapping mapping) {
		// TODO Auto-generated method stub
		delete(mapping);
	}

}
