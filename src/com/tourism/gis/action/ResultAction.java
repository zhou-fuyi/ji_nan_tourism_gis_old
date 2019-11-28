package com.tourism.gis.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Result;
import com.tourism.gis.service.ResultService;
import com.tourism.gis.util.PageUtil;
import com.tourism.gis.util.bean.PageBean;

public class ResultAction extends ActionSupport implements ModelDriven<Result> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResultService resultService;
	private Result result;
	private String queryName;
	private HttpServletRequest request = (HttpServletRequest) ActionContext.getContext()
			.get(StrutsStatics.HTTP_REQUEST);
	private float costTime;

	public float getCostTime() {
		return costTime;
	}

	public void setQueryName(String queryName) {
		if (queryName == null) {
			queryName = "";
			System.out.println("查询数据为null  已将设置为 ('')空");
		} else {
			this.queryName = queryName;
		}

	}

	public String getQueryName() {
		return queryName;
	}

	public void setResultService(ResultService resultService) {
		this.resultService = resultService;
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public String queryByKeyWord() {
		float startTime = (float) System.currentTimeMillis();
		System.out.println(startTime);
		System.out.println(queryName);
		if (queryName == null) {
			System.out.println("queryName              NULL ");
			queryName = "";
		}
		int pageCode = PageUtil.getPageCode(request);

		PageBean<Result> pageBean = this.resultService.queryResultByKeyWord(result, queryName, pageCode);

		request.setAttribute("resultList", pageBean);
		request.setAttribute("queryFlag", 0);
		request.setAttribute("queryResultName", queryName);
		float endTime = (float) System.currentTimeMillis();
		System.out.println(endTime);
		this.costTime = (endTime - startTime) / 1000;
		request.setAttribute("costTime", this.costTime);
		return "query";
	}

	public String queryResult() {
		float startTime = (float) System.currentTimeMillis();
		System.out.println(queryName);
		if (queryName == null) {
			System.out.println("queryName              NULL ");
			queryName = "";
		}
		int pageCode = PageUtil.getPageCode(request);
		PageBean<Result> pageBean = this.resultService.queryResult(result, queryName, pageCode);

		request.setAttribute("resultList", pageBean);
		request.setAttribute("queryFlag", 1);
		request.setAttribute("queryName", queryName);
		float endTime = (float) System.currentTimeMillis();
		this.costTime = (endTime - startTime) / 1000;
		request.setAttribute("costTime", this.costTime);
		return "query";
	}

	@Override
	public Result getModel() {
		// TODO Auto-generated method stub
		result = new Result();
		return result;
	}

}
