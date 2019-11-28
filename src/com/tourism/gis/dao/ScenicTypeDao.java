package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.ScenicType;

/**
 * 景区类型接口
 * 
 * @author Administrator
 *
 */
public interface ScenicTypeDao {

	/**
	 * 获取单个类型
	 * 
	 * @param type
	 * @return
	 */
	public ScenicType get(ScenicType type);

	/**
	 * 根据特定条件获取一组景区类型对象
	 * 
	 * @param objects
	 * @return 返回一组景区类型对象的集合
	 */
	public List<ScenicType> getForList(Object... objects);

	/**
	 * 添加单个类型
	 * 
	 * @param type
	 */
	public void save(ScenicType type);

	/**
	 * 删除单个类型
	 * 
	 * @param type
	 */
	public void delete(ScenicType type);

	/**
	 * 修改类型
	 * 
	 * @param type
	 */
	public void update(ScenicType type);

	/**
	 * 批量操作
	 * 
	 * @param objects
	 */
	public void batch(Object... objects);
}
