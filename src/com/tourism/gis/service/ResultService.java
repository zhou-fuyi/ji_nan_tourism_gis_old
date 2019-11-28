package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.Result;
import com.tourism.gis.util.bean.PageBean;

public interface ResultService {

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
	 * 获取查询结果的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<Result> getResultList(Object... objects);

	public PageBean<Result> queryResultByKeyWord(Result result, String queryName, int pageCode);

	public PageBean<Result> queryResult(Result result, String queryName, int pageCode);

	public Result getResultByArticleId(String articleId);

	public Result getResultByScenicSpotId(String scenicSpotId);

}
