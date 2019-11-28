package com.tourism.gis.dao;

import java.util.List;

public interface Dao<T> {

	/**
	 * 保存或更新
	 * 
	 * @param t
	 */
	void saveOrUpdate(T t);

	/**
	 * 删除
	 * 
	 * @param hql
	 * @param objects
	 */
	void delete(T t);

	/**
	 * 查询指定实体
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 */
	T query(String hql, Object... objects);

	/**
	 * 查询指定条件的实体集合
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 */
	List<T> queryForList(String hql, Object... objects);

	/**
	 * 根据条件查询指定一个对象
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 */
	<E> E getForValue(String hql, Object... objects);

	/**
	 * 批量操作
	 * 
	 * @param hql
	 * @param objects
	 */
	void batch(String hql, Object... objects);

}
