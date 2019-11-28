package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Role_Resource_Mapping;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.Role_Resource_MappingDao;


public class Role_Resource_MappingDaoImpl extends BaseDao<Role_Resource_Mapping> implements Role_Resource_MappingDao {

	@Override
	public void add(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		saveOrUpdate(mapping);
	}

	@Override
	public void deleteMapping(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		delete(mapping);
	}

	@Override
	public void update(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		saveOrUpdate(mapping);
	}

	@Override
	public Role_Resource_Mapping get(Role_Resource_Mapping mapping) {
		// TODO Auto-generated method stub
		String hql = "from Role_Resource_Mapping r where r.id = ?";
		return query(hql, mapping.getId());
	}

	@Override
	public Set<Role_Resource_Mapping> getForSet(String hql, Object... objects) {
		// TODO Auto-generated method stub
		List<Role_Resource_Mapping> list = queryForList(hql, objects);
		if(list == null || list.size() == 0) {
			return null;
		}else {
			return new HashSet<>(list);
		}
	}

}
