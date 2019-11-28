package com.tourism.gis.dao.impl;

import java.util.List;

import com.tourism.gis.bean.ScenicType;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.ScenicTypeDao;


public class ScenicTypeDaoImpl extends BaseDao<ScenicType> implements ScenicTypeDao {

	@Override
	public ScenicType get(ScenicType type) {
		String hql = "from ScenicType s where s.id = ?";
		return query(hql, type.getId());
	}

	@Override
	public List<ScenicType> getForList(Object... objects) {
		String hql = "from ScenicType";

		return queryForList(hql, objects);
	}

	@Override
	public void save(ScenicType type) {
		saveOrUpdate(type);
	}

	@Override
	public void update(ScenicType type) {
		saveOrUpdate(type);
	}

	@Override
	public void batch(Object... objects) {
		// TODO Auto-generated method stub

	}

}
