package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.LandMark;

public interface LandMarkDao {

	/**
	 * 增加标注
	 * 
	 * @param point
	 */
	public void add(LandMark point);

	/**
	 * 删除标注
	 * 
	 * @param point
	 */
	public void deleteLandMark(LandMark point);

	/**
	 * 更改标注
	 * 
	 * @param point
	 */
	public void update(LandMark point);

	/**
	 * 获取指定标注
	 * 
	 * @param point
	 * @return
	 */
	public LandMark get(LandMark point);

	/**
	 * 获取所有标注
	 * 
	 * @param objects
	 * @return
	 */
	public List<LandMark> getForList(Object... objects);

	/**
	 * 批量操作
	 */
	public void batch();
}
