package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Resource;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.ResourceDao;

public class ResourceDaoImpl extends BaseDao<Resource> implements ResourceDao {

	@Override
	public void add(Resource res) {
		// TODO Auto-generated method stub
		saveOrUpdate(res);
	}

	@Override
	public void deleteResource(Resource res) {
		// TODO Auto-generated method stub
		delete(res);
	}

	@Override
	public void update(Resource res) {
		// TODO Auto-generated method stub
		saveOrUpdate(res);
	}

	@Override
	public Resource get(Resource res) {
		// TODO Auto-generated method stub
		String hql = "from Resource r where r.id = ?";
		return query(hql, res.getId());
	}

	@Override
	public Set<Resource> getForSet(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from Resource";
		List<Resource> list = queryForList(hql, objects);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return new HashSet<>(list);
		}
	}

}
