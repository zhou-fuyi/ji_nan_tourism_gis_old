package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.ScenicType;

public interface ScenicTypeService {

	/**
	 * 添加景区类型
	 * 
	 * @param type
	 */
	public void addScenicType(ScenicType type);

	/**
	 * 修改指定的景区类型
	 * 
	 * @param type
	 */
	public void updateScenicType(ScenicType type);

	/**
	 * 删除指定的景区类型
	 * 
	 * @param type
	 */
	public void deleteScenicType(ScenicType type);

	/**
	 * 获取指定的景区类型
	 * 
	 * @param type
	 * @return
	 */
	public ScenicType getScenicType(ScenicType type);

	/**
	 * 获取一组景区类型组成的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<ScenicType> getScenicTypeList(Object... objects);
}
