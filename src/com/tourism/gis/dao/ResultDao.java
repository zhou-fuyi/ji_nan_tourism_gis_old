package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.Result;
import com.tourism.gis.util.bean.PageBean;

/**
 * 查询结果的接口
 * 
 * @author Administrator
 *
 */
public interface ResultDao {

	/**
	 * 添加查询结果
	 * 
	 * @param result
	 */
	public void addResult(Result result);

	/**
	 * 修改查询结果
	 * 
	 * @param result
	 */
	public void updateResult(Result result);

	/**
	 * 删除查询结果
	 * 
	 * @param result
	 */
	public void deleteResult(Result result);

	/**
	 * 获取指定查询结果
	 * 
	 * @param result
	 * @return
	 */
	public Result getResult(Result result);

	/**
	 * 获取指定查询结果的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<Result> getResultList(Object... objects);

	/**
	 * 通过关键字查询 模糊匹配
	 * 
	 * @param result
	 * @param objects
	 * @return
	 */
	public PageBean<Result> queryResultByKeyWord(Result result, String queryName, int pageCode);

	/**
	 * 搜索框查询 包括关键字和标题以及摘要 模糊匹配
	 * 
	 * @param result
	 * @param objects
	 * @return
	 */
	public PageBean<Result> queryResult(Result result, String queryName, int pageCode);

	/**
	 * 批量操作
	 * 
	 * @param objects
	 */
	public void batch(Object... objects);

	public Result getResultByArticleId(String articleId);

	public Result getResultByScenicSpotId(String scenicSpotId);
}
