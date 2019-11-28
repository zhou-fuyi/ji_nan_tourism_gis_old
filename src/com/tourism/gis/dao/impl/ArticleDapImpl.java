package com.tourism.gis.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.User;
import com.tourism.gis.dao.ArticleDao;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.util.PageConstants;
import com.tourism.gis.util.bean.PageBean;

public class ArticleDapImpl extends BaseDao<Article> implements ArticleDao {

	@Override
	public void addArticle(Article article) {
		saveOrUpdate(article);
	}

	@Override
	public void updateArticle(Article article) {
		saveOrUpdate(article);
	}

	@Override
	public void deleteArticle(Article article) {
		delete(article);
	}

	@Override
	public Article getArticle(Article article) {
		String hql = "from Article a where a.id = ?";
		return query(hql, article.getId());
	}

	@Override
	public Set<Article> getArticleSet(String hql, Object... objects) {
		List<Article> list = queryForList(hql, objects);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return new HashSet<>(queryForList(hql, objects));
		}
	}

	@Override
	public List<Article> getArticleList(String hql, Object... objects) {
		// List<Article> list = queryForList(hql, objects);
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setMaxResults(10);
		List<Article> list = query.list();
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return list;
		}
	}

	@Override
	public PageBean<Article> queryArticle(Article article, int pageCode) {
		// TODO Auto-generated method stub
		int pageSize = PageConstants.BLOG_PAGE_SIZE;
		String hql = "select count(*) from Article a where a.sign = :sign";
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("sign", article.getSign());
		int totalRecoder = ((Number) query.uniqueResult()).intValue();
		System.out.println(totalRecoder);
		hql = "from Article a where a.sign = :sign Order by time Desc";
		int start = (pageCode - 1) * pageSize;
		query = session.createQuery(hql);
		query.setParameter("sign", article.getSign());
		query.setFirstResult(start);// 开始索引
		query.setMaxResults(pageSize);// 每页显示个数
		List<Article> articleList = query.list();
		System.out.println(articleList);
		if (articleList == null || articleList.size() == 0) {
			return null;
		} else {
			PageBean<Article> pageBean = new PageBean<>();

			pageBean.setPageCode(pageCode);
			pageBean.setPageSize(pageSize);
			pageBean.setTotalRecoder(totalRecoder);
			pageBean.setBeanList(articleList);
			System.out.println(pageBean);
			return pageBean;
		}
	}

	@Override
	public PageBean<Article> loadUserArticle(User user, int pageCode) {
		// TODO Auto-generated method stub
		int pageSize = PageConstants.BLOG_PAGE_SIZE;
		String hql = "select count(*) from Article a where a.sign = 0 and a.user.userId = :userId";
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("userId", user.getUserId());
		int totalRecoder = ((Number) query.uniqueResult()).intValue();
		System.out.println(totalRecoder);
		hql = "from Article a where a.sign = 0 and a.user.userId = :userId Order by time Desc";
		int start = (pageCode - 1) * pageSize;
		query = session.createQuery(hql);
		query.setParameter("userId", user.getUserId());
		query.setFirstResult(start);// 开始索引
		query.setMaxResults(pageSize);// 每页显示个数
		List<Article> articleList = query.list();
		System.out.println(articleList);
		if (articleList == null || articleList.size() == 0) {
			return null;
		} else {
			// Set<Article> articleSet = new HashSet<>(articleList);
			PageBean<Article> pageBean = new PageBean<>();
			pageBean.setPageCode(pageCode);
			pageBean.setPageSize(pageSize);
			pageBean.setTotalRecoder(totalRecoder);
			pageBean.setBeanList(articleList);
			System.out.println(pageBean);
			return pageBean;
		}
	}

	/*
	 * private PageBean<Article> queryByCriteria(List<Expression> exprList,
	 * Object... objects) {
	 * 
	 * return null; }
	 */

	@Override
	public void batch(Object... objects) {
		// TODO Auto-generated method stub

	}

}
