package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.LandMark;
import com.tourism.gis.dao.LandMarkDao;
import com.tourism.gis.service.LandMarkService;

@Transactional
public class LandMarkServiceImpl implements LandMarkService {

	private LandMarkDao landMarkDao;

	public void setLandMarkDao(LandMarkDao landMarkDao) {
		this.landMarkDao = landMarkDao;
	}

	@Override
	public void add(LandMark point) {
		// TODO Auto-generated method stub
		landMarkDao.add(point);
	}

	@Override
	public void delete(LandMark point) {
		// TODO Auto-generated method stub
		this.landMarkDao.deleteLandMark(point);
	}

	@Override
	public LandMark get(LandMark point) {
		// TODO Auto-generated method stub
		return this.landMarkDao.get(point);
	}

	@Override
	public List<LandMark> getForList(Object... objects) {
		// TODO Auto-generated method stub
		return this.landMarkDao.getForList(objects);
	}

	@Override
	public void update(LandMark point) {
		// TODO Auto-generated method stub
		this.landMarkDao.update(point);
	}

}
