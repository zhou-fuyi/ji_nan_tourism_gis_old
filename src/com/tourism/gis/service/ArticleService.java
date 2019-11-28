package com.tourism.gis.service;

import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.User;
import com.tourism.gis.util.bean.PageBean;

public interface ArticleService {

	/**
	 * 添加文章
	 * 
	 * @param article
	 */
	public void addArticle(Article article, Result result);

	/**
	 * 删除文章
	 * 
	 * @param article
	 */
	public void deleteArticle(Article article);

	/**
	 * 修改文章
	 * 
	 * @param article
	 */
	public void updateArticle(Article article, Result result);

	/**
	 * 通过ID获取指定文章
	 * 
	 * @param article
	 * @return
	 */
	public Article getArticleById(Article article);

	/**
	 * 通过指定条件获取文章集合
	 * 
	 * @param objects
	 * @return
	 */
	public Set<Article> getArticleSetByAdmin(Object... objects);

	public Set<Article> getArticleSetByUser(Object... objects);

	public PageBean<Article> getArticlePageBean(Article article, int pageCode);

	public PageBean<Article> loadUserArticles(User user, int pageCode);

	public List<Article> getArticleList(String hql, Object... objects);

}
