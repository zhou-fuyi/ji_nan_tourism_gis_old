package com.tourism.gis.dao.impl;

import java.util.List;

import com.tourism.gis.bean.LandMark;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.LandMarkDao;


public class LandMarkDaoImpl extends BaseDao<LandMark> implements LandMarkDao{

	@Override
	public void add(LandMark point) {
		super.saveOrUpdate(point);
	}

	@Override
	public void deleteLandMark(LandMark point) {
		delete(point);
	}

	@Override
	public void update(LandMark point) {
		super.saveOrUpdate(point);
	}

	@Override
	public void batch() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LandMark get(LandMark point) {
		// TODO Auto-generated method stub
		String hql = "from LandMark l where l.id = ?";
		return query(hql, point.getId());
	}

	@Override
	public List<LandMark> getForList(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from LandMark";
		return super.queryForList(hql, objects);
	}

}
