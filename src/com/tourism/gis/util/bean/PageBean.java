package com.tourism.gis.util.bean;

import java.io.Serializable;
import java.util.List;

public class PageBean<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pageCode;// 当前页
	private int pageSize;// 每页显示个数
	private int totalRecoder;// 总的记录数
	private int totalPage;// 总个页数
	private String url;// 点击的链接
	private List<T> beanList; // 当前分页的实体类

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecoder() {
		return totalRecoder;
	}

	public void setTotalRecoder(int totalRecoder) {
		this.totalRecoder = totalRecoder;
	}

	public int getTotalPage() {
		totalPage = totalRecoder / pageSize;
		if ((totalRecoder % pageSize) != 0) {
			totalPage += 1;
		}
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PageBean [pageCode=" + pageCode + ", pageSize=" + pageSize + ", totalRecoder=" + totalRecoder
				+ ", totalPage=" + totalPage + ", url=" + url + ", beanList=" + beanList + "]";
	}

}
