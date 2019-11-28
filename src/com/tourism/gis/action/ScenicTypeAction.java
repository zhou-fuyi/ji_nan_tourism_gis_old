package com.tourism.gis.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.ScenicType;
import com.tourism.gis.service.ScenicTypeService;

public class ScenicTypeAction extends ActionSupport implements ModelDriven<ScenicType> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ScenicTypeService scenicTypeService;
	private ScenicType scenicType;

	public void setScenicTypeService(ScenicTypeService scenicTypeService) {
		this.scenicTypeService = scenicTypeService;
	}

	public void setScenicType(ScenicType scenicType) {
		this.scenicType = scenicType;
	}

	@Override
	public ScenicType getModel() {
		// TODO Auto-generated method stub
		scenicType = new ScenicType();
		return scenicType;
	}

}
