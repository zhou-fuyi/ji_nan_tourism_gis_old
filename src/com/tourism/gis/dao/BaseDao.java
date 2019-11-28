package com.tourism.gis.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

public class BaseDao<T> extends HibernateDaoSupport implements Dao<T> {

	@Override
	public void saveOrUpdate(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}

	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T query(String hql, Object... objects) {
		List<T> resultList = (List<T>) this.getHibernateTemplate().find(hql, objects);
		System.out.println(resultList.size());
		System.out.println(resultList);
		if (resultList.size() > 0) {
			return resultList.get(0);
		}
		System.out.println("BaseDao--query");
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryForList(String hql, Object... objects) {
		List<T> resultList = (List<T>) this.getHibernateTemplate().find(hql, objects);
		return resultList.size() > 0 ? resultList : null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <E> E getForValue(String hql, Object... objects) {
		List<E> resultList = (List<E>) this.getHibernateTemplate().find(hql, objects);
		if (resultList.size() > 0) {
			return resultList.get(0);
		}
		return null;
	}

	@Override
	public void batch(String hql, Object... objects) {
		// TODO Auto-generated method stub

	}

}
