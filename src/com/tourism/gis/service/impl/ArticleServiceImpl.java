package com.tourism.gis.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.User;
import com.tourism.gis.dao.ArticleDao;
import com.tourism.gis.dao.ResultDao;
import com.tourism.gis.service.ArticleService;
import com.tourism.gis.util.bean.PageBean;

@Transactional
public class ArticleServiceImpl implements ArticleService {

	private ArticleDao articleDao;
	private ResultDao resultDao;

	public void setResultDao(ResultDao resultDao) {
		this.resultDao = resultDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public void addArticle(Article article, Result result) {
		this.resultDao.addResult(result);
		this.articleDao.addArticle(article);
	}

	@Override
	public void deleteArticle(Article article) {
		this.articleDao.deleteArticle(article);
	}

	@Override
	public void updateArticle(Article article, Result result) {
		this.articleDao.updateArticle(article);
		this.resultDao.updateResult(result);
	}

	@Override
	public Article getArticleById(Article article) {
		// TODO Auto-generated method stub
		return this.articleDao.getArticle(article);
	}

	@Override
	public Set<Article> getArticleSetByAdmin(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from Article a where a.sign = ?";
		return this.articleDao.getArticleSet(hql, objects);
	}

	@Override
	public Set<Article> getArticleSetByUser(Object... objects) {
		// TODO Auto-generated method stub
		String hql = "from Article a where a.userId = ?";
		return this.articleDao.getArticleSet(hql, objects);
	}

	@Override
	public PageBean<Article> getArticlePageBean(Article article, int pageCode) {
		// TODO Auto-generated method stub
		return this.articleDao.queryArticle(article, pageCode);
	}

	@Override
	public PageBean<Article> loadUserArticles(User user, int pageCode) {
		// TODO Auto-generated method stub
		return this.articleDao.loadUserArticle(user, pageCode);
	}

	@Override
	public List<Article> getArticleList(String hql, Object... objects) {
		// TODO Auto-generated method stub
		return this.articleDao.getArticleList(hql, objects);
	}

}
