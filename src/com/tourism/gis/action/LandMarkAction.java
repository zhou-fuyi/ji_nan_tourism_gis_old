package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.LandMark;
import com.tourism.gis.service.LandMarkService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;


public class LandMarkAction extends ActionSupport implements ModelDriven<LandMark> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LandMarkService landMarkService;
	private LandMark landMark;
	private InputStream inputStream;
	private String pathName = "json\\landMark\\landMark.json";
	private String json = "landJson";

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setLandMarkService(LandMarkService landMarkService) {
		this.landMarkService = landMarkService;
	}

	public String addLandMark() throws UnsupportedEncodingException {
		System.out.println(landMark);
		if(landMark == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return json;
		}
		landMark.setId(CommonUtils.uuid());
		landMarkService.add(landMark);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return json;
	}


	/**
	 * 获取所有的景点信息并将其转化为json写入一个文件中 文件为landMark.json
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getLandMarkList() throws UnsupportedEncodingException {
		List<LandMark> list = landMarkService.getForList();
		System.out.println(list);
		if(list == null || list.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return json;
		}
		String result = new Gson().toJson(list);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return json;
	}
	
	/**
	 * 前台获取地图景点数据
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String sendLandMarks() throws UnsupportedEncodingException {
		@SuppressWarnings("unchecked")
		List<LandMark> list = (List<LandMark>) ActionContext.getContext().getSession().get("landMarks");
		System.out.println("========" + list);

		if (list == null || list.size() == 0) {
			list = this.landMarkService.getForList();
			ActionContext.getContext().getSession().put("landMarks", list);
			System.out.println(list);
		}
		Gson gson = new Gson();
		String result = gson.toJson(list);
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		System.out.println(result);
		// System.out.println(pathName + "landMark\\landMark.json");
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		return json;
	}

	@Override
	public LandMark getModel() {
		// TODO Auto-generated method stub
		this.landMark = new LandMark();
		return landMark;
	}
	
	public void testAdd(List<LandMark> list) {
		for(LandMark land : list) {
			this.landMarkService.add(land);
		}
	}

}
