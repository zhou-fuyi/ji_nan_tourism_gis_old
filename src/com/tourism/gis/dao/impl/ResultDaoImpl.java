package com.tourism.gis.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.tourism.gis.bean.Result;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.ResultDao;
import com.tourism.gis.util.PageConstants;
import com.tourism.gis.util.bean.PageBean;


public class ResultDaoImpl extends BaseDao<Result> implements ResultDao {

	@Override
	public void addResult(Result result) {
		saveOrUpdate(result);
	}

	@Override
	public void updateResult(Result result) {
		saveOrUpdate(result);
	}

	@Override
	public void deleteResult(Result result) {
		delete(result);
	}

	@Override
	public Result getResult(Result result) {
		String hql = "from Result r where r.id = ?";
		return query(hql, result.getId());
	}

	@Override
	public List<Result> getResultList(Object... objects) {
		String hql = "from Result";
		return queryForList(hql, objects);
	}

	@Override
	public void batch(Object... objects) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageBean<Result> queryResultByKeyWord(Result result, String queryName, int pageCode) {
		int pageSize = PageConstants.BLOG_PAGE_SIZE;
		String hql = "select count(*) from Result r where 1=1 and r.keyWord like :keyWord";
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("keyWord", "%"+queryName+"%");
		int totalRecoder = ((Number)query.uniqueResult()).intValue();
		System.out.println(totalRecoder);
		hql = "from Result r where 1=1 and r.keyWord like :keyWord ";
		System.out.println(hql);
		int start = (pageCode - 1) * pageSize;
		query = session.createQuery(hql);
		query.setParameter("keyWord", "%"+queryName+"%");
		query.setFirstResult(start);//开始索引
		query.setMaxResults(pageSize);//每页显示个数
		List<Result> resultList = query.list();
		System.out.println(resultList);
		if(resultList == null || resultList.size() == 0) {
			return null;
		}else {
			PageBean<Result> pageBean = new PageBean<>();
			
			pageBean.setPageCode(pageCode);
			pageBean.setPageSize(pageSize);
			pageBean.setTotalRecoder(totalRecoder);
			pageBean.setBeanList(resultList);
			System.out.println(pageBean);
			return pageBean;
		}
	}

	@Override
	public PageBean<Result> queryResult(Result result, String queryName, int pageCode) {
		int pageSize = PageConstants.BLOG_PAGE_SIZE;
		String hql = "select count(*) from Result r where 1=1 and r.title like :title ";
		hql += " or r.subject like :subject ";
		hql += " or r.keyWord like :keyWord Order by r.time Desc";
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("title", "%"+queryName+"%");
		query.setParameter("subject", "%"+queryName+"%");
		query.setParameter("keyWord", "%"+queryName+"%");
		int totalRecoder = ((Number)query.uniqueResult()).intValue();
		System.out.println(totalRecoder);
		hql = "from Result r where 1=1 and r.title like :title ";
		hql += " or r.subject like :subject ";
		hql += " or r.keyWord like :keyWord Order by r.time Desc";
		System.out.println(hql);
		int start = (pageCode - 1) * pageSize;
		query = session.createQuery(hql);
		query.setParameter("title", "%"+queryName+"%");
		query.setParameter("subject", "%"+queryName+"%");
		query.setParameter("keyWord", "%"+queryName+"%");
		query.setFirstResult(start);//开始索引
		query.setMaxResults(pageSize);//每页显示个数
		List<Result> resultList = query.list();
		System.out.println(resultList);
		if(resultList == null || resultList.size() == 0) {
			return null;
		}else {
			PageBean<Result> pageBean = new PageBean<>();
			
			pageBean.setPageCode(pageCode);
			pageBean.setPageSize(pageSize);
			pageBean.setTotalRecoder(totalRecoder);
			pageBean.setBeanList(resultList);
			System.out.println(pageBean);
			return pageBean;
		}
	}
	
	@Override
	public Result getResultByArticleId(String articleId) {
		// TODO Auto-generated method stub
		String hql = "from Result r where r.articleId = ?";
		return query(hql, articleId);
	}
	
	@Override
	public Result getResultByScenicSpotId(String scenicSpotId) {
		// TODO Auto-generated method stub
		String hql = "from Result r where r.scenicSpotId = ?";
		return query(hql, scenicSpotId);
	}

}
