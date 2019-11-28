package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.ScenicType;
import com.tourism.gis.dao.ScenicTypeDao;
import com.tourism.gis.service.ScenicTypeService;

@Transactional
public class ScenicTypeServiceImpl implements ScenicTypeService {
	private ScenicTypeDao scenicTypeDao;

	public void setScenicTypeDao(ScenicTypeDao scenicTypeDao) {
		this.scenicTypeDao = scenicTypeDao;
	}

	@Override
	public void addScenicType(ScenicType type) {
		// TODO Auto-generated method stub
		this.scenicTypeDao.save(type);
	}

	@Override
	public void updateScenicType(ScenicType type) {
		// TODO Auto-generated method stub
		this.scenicTypeDao.update(type);
	}

	@Override
	public void deleteScenicType(ScenicType type) {
		// TODO Auto-generated method stub
		this.scenicTypeDao.delete(type);
	}

	@Override
	public ScenicType getScenicType(ScenicType type) {
		// TODO Auto-generated method stub
		return this.scenicTypeDao.get(type);
	}

	@Override
	public List<ScenicType> getScenicTypeList(Object... objects) {
		// TODO Auto-generated method stub
		return this.scenicTypeDao.getForList(objects);
	}

}
