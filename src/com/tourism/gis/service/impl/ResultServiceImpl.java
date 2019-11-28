package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Result;
import com.tourism.gis.dao.ResultDao;
import com.tourism.gis.service.ResultService;
import com.tourism.gis.util.bean.PageBean;

@Transactional
public class ResultServiceImpl implements ResultService {

	private ResultDao resultDao;

	public void setResultDao(ResultDao resultDao) {
		this.resultDao = resultDao;
	}

	@Override
	public void addResult(Result result) {
		// TODO Auto-generated method stub
		this.resultDao.addResult(result);
	}

	@Override
	public void updateResult(Result result) {
		// TODO Auto-generated method stub
		this.resultDao.updateResult(result);
	}

	@Override
	public void deleteResult(Result result) {
		// TODO Auto-generated method stub
		this.resultDao.deleteResult(result);
	}

	@Override
	public Result getResult(Result result) {
		// TODO Auto-generated method stub
		return this.resultDao.getResult(result);
	}

	@Override
	public List<Result> getResultList(Object... objects) {
		// TODO Auto-generated method stub
		return this.resultDao.getResultList(objects);
	}

	@Override
	public PageBean<Result> queryResultByKeyWord(Result result, String queryName, int pageCode) {
		// TODO Auto-generated method stub
		return this.resultDao.queryResultByKeyWord(result, queryName, pageCode);
	}

	@Override
	public PageBean<Result> queryResult(Result result, String queryName, int pageCode) {
		// TODO Auto-generated method stub
		return this.resultDao.queryResult(result, queryName, pageCode);
	}

	@Override
	public Result getResultByArticleId(String articleId) {
		// TODO Auto-generated method stub
		return this.resultDao.getResultByArticleId(articleId);
	}

	@Override
	public Result getResultByScenicSpotId(String scenicSpotId) {
		// TODO Auto-generated method stub
		return this.resultDao.getResultByScenicSpotId(scenicSpotId);
	}
}
