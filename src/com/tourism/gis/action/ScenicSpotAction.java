package com.tourism.gis.action;

import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.service.ScenicSpotService;
import com.tourism.gis.util.PageUtil;
import com.tourism.gis.util.bean.PageBean;

public class ScenicSpotAction extends ActionSupport implements ModelDriven<ScenicSpot> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ScenicSpotService scenicSpotService;
	private ScenicSpot scenicSpot;
	private InputStream inputStream;
	private Map<String, Object> sessionMap = ActionContext.getContext().getSession();

	private HttpServletRequest request = (HttpServletRequest) ActionContext.getContext()
			.get(StrutsStatics.HTTP_REQUEST);

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setScenicSpotService(ScenicSpotService scenicSpotService) {
		this.scenicSpotService = scenicSpotService;
	}

	public void setScenicSpot(ScenicSpot scenicSpot) {
		this.scenicSpot = scenicSpot;
	}

	public String getScenicSpot() {
		ScenicSpot spot = this.scenicSpotService.getScenicSpot(scenicSpot);
		request.setAttribute("spot", spot);
		return "infoDetail";
	}

	public String loadScenic() {
		int pageCode = PageUtil.getPageCode(request);
		PageBean<ScenicSpot> beanList = this.scenicSpotService.queryScenicSpot(scenicSpot, pageCode);
		if (beanList != null) {
			beanList.setUrl(PageUtil.getURL(request));
		}
		sessionMap.put("scenicPageBean", beanList);
		return "infoList";
	}

	@Override
	public ScenicSpot getModel() {
		// TODO Auto-generated method stub
		scenicSpot = new ScenicSpot();
		return scenicSpot;
	}

}
