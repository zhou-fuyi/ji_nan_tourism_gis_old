package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.dao.ResultDao;
import com.tourism.gis.dao.ScenicSpotDao;
import com.tourism.gis.service.ScenicSpotService;
import com.tourism.gis.util.bean.PageBean;

@Transactional
public class ScenicSpotServiceImpl implements ScenicSpotService {

	private ScenicSpotDao scenicSpotDao;
	private ResultDao resultDao;

	public void setScenicSpotDao(ScenicSpotDao scenicSpotDao) {
		this.scenicSpotDao = scenicSpotDao;
	}

	public void setResultDao(ResultDao resultDao) {
		this.resultDao = resultDao;
	}

	@Override
	public void addScenicSpot(ScenicSpot spot, Result result) {
		// TODO Auto-generated method stub
		this.scenicSpotDao.addScenicSpot(spot);
		this.resultDao.addResult(result);
	}

	@Override
	public void updateScenicSpot(ScenicSpot spot, Result result) {
		// TODO Auto-generated method stub
		this.scenicSpotDao.updateScenicSpot(spot);
		this.resultDao.updateResult(result);
	}

	@Override
	public void deleteScenicSpot(ScenicSpot spot) {
		// TODO Auto-generated method stub
		this.scenicSpotDao.deleteScenicSpot(spot);
	}

	@Override
	public ScenicSpot getScenicSpot(ScenicSpot spot) {
		// TODO Auto-generated method stub
		return this.scenicSpotDao.getScenicSpot(spot);
	}

	@Override
	public List<ScenicSpot> getScenicSpotList(Object... objects) {
		// TODO Auto-generated method stub
		return this.scenicSpotDao.getScenicSpotList(objects);
	}

	@Override
	public PageBean<ScenicSpot> queryScenicSpot(ScenicSpot spot, int pageCode) {
		// TODO Auto-generated method stub
		return this.scenicSpotDao.queryScenicSpot(spot, pageCode);
	}

}
