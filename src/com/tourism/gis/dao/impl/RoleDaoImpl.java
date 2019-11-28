package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Role;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.RoleDao;


public class RoleDaoImpl extends BaseDao<Role> implements RoleDao {

	@Override
	public void add(Role role) {
		// TODO Auto-generated method stub
		saveOrUpdate(role);
	}

	@Override
	public void deleteRole(Role role) {
		// TODO Auto-generated method stub
		delete(role);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		saveOrUpdate(role);
	}

	@Override
	public Role get(Role role) {
		// TODO Auto-generated method stub
		String hql = "from Role r where r.id = ?";
		return query(hql, role.getId());
	}

	@Override
	public Set<Role> getForSet(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from Role";
		List<Role> list = queryForList(hql, objects);
		if(list == null || list.size() == 0) {
			return null;
		}else {
			return new HashSet<>(list);
		}
	}

}
