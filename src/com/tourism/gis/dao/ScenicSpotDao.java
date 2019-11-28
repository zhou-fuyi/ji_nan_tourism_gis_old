package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.util.bean.PageBean;

public interface ScenicSpotDao {

	/**
	 * 添加景区详情
	 * 
	 * @param spot
	 */
	public void addScenicSpot(ScenicSpot spot);

	/**
	 * 修改景区详情
	 * 
	 * @param spot
	 */
	public void updateScenicSpot(ScenicSpot spot);

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
	 * 获取指定条件下景区一组景区详情组成的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<ScenicSpot> getScenicSpotList(Object... objects);

	/**
	 * 景点详情分页查询
	 * 
	 * @return
	 */
	public PageBean<ScenicSpot> queryScenicSpot(ScenicSpot spot, int pageCode);

	/**
	 * 批量操作
	 * 
	 * @param objects
	 */
	public void batch(Object... objects);
}
