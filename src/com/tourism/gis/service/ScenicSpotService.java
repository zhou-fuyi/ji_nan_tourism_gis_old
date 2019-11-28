package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.util.bean.PageBean;

public interface ScenicSpotService {

	/**
	 * 添加景区详情
	 * 
	 * @param spot
	 */
	public void addScenicSpot(ScenicSpot spot, Result result);

	/**
	 * 修改景区详情
	 * 
	 * @param spot
	 */
	public void updateScenicSpot(ScenicSpot spot, Result result);

	/**
	 * 删除景区详情
	 * 
	 * @param spot
	 */
	public void deleteScenicSpot(ScenicSpot spot);

	/**
	 * 获取指定景区详情
	 * 
	 * @param spot
	 * @return
	 */
	public ScenicSpot getScenicSpot(ScenicSpot spot);

	/**
	 * 获取一组景区详情组成的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<ScenicSpot> getScenicSpotList(Object... objects);

	public PageBean<ScenicSpot> queryScenicSpot(ScenicSpot spot, int pageCode);
}
