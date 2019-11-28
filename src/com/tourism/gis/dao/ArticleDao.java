package com.tourism.gis.dao;

import java.util.List;
import java.util.Set;

import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.User;
import com.tourism.gis.util.bean.PageBean;

public interface ArticleDao {

	/**
	 * 添加文章
	 * 
	 * @param article
	 */
	public void addArticle(Article article);

	/**
	 * 修改文章
	 * 
	 * @param article
	 */
	public void updateArticle(Article article);

	/**
	 * 删除文章
	 * 
	 * @param article
	 */
	public void deleteArticle(Article article);

	/**
	 * 获取指定文章
	 * 
	 * @param article
	 * @return
	 */
	public Article getArticle(Article article);

	/**
	 * 根据指定条件获取一组文章组成的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public Set<Article> getArticleSet(String hql, Object... objects);

	public List<Article> getArticleList(String hql, Object... objects);

	/**
	 * 批量操作
	 * 
	 * @param objects
	 */
	public void batch(Object... objects);

	/**
	 * 分页查询
	 * 
	 * @param article
	 * @param objects
	 * @return
	 */
	public PageBean<Article> queryArticle(Article article, int pageCode);

	public PageBean<Article> loadUserArticle(User user, int pageCode);
}
