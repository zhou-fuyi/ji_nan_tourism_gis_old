package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.alibaba.fastjson.JSON;
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
	private String json = "adminLandJson";
	private String formData;

	public void setLandMark(LandMark landMark) {
		this.landMark = landMark;
	}

	public LandMark getLandMark() {
		return landMark;
	}

	public String getFormData() {
		return formData;
	}

	public void setFormData(String formData) {
		try {
			this.formData = URLDecoder.decode(formData, "UTF-8").toString();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setLandMarkService(LandMarkService landMarkService) {
		this.landMarkService = landMarkService;
	}

	public Map<String, String> handleFormData(String args) {
		Map<String, String> map = new HashMap<>();
		String[] strs = args.split("&");
		for (String st : strs) {
			String[] temp = st.split("=");
			if (temp.length == 1) {
				map.put(temp[0], "");
			} else {
				map.put(temp[0], temp[1]);
			}
		}
		System.out.println(map);
		return map;
	}

	public LandMark createLandMarkByFormData(Map<String, String> map) {
		LandMark tempLandMark = new LandMark();
		tempLandMark.setId(map.get("id"));
		tempLandMark.setImg(map.get("img"));
		tempLandMark.setLat(Double.parseDouble(map.get("lat")));
		tempLandMark.setLng(Double.parseDouble(map.get("lng")));
		tempLandMark.setName(map.get("name"));
		tempLandMark.setSubject(map.get("subject"));
		tempLandMark.setTel(map.get("tel"));
		return tempLandMark;
	}

	public String getLandMarkById() throws UnsupportedEncodingException {
		LandMark land = landMarkService.get(landMark);
		String result = JSON.toJSONString(land);
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return this.json;
	}

	public String addLandMark() throws UnsupportedEncodingException {
		System.out.println(formData);
		LandMark tempLand = this.createLandMarkByFormData(this.handleFormData(formData));
		if (tempLand == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
		tempLand.setId(CommonUtils.uuid());
		landMarkService.add(tempLand);
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	public String addLandMarkByStruts() throws UnsupportedEncodingException {
		System.out.println(landMark);
		if (landMark == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
		landMark.setId(CommonUtils.uuid());
		landMarkService.add(landMark);
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	public String editLandMark() throws UnsupportedEncodingException {
		// HttpServletRequest request = (HttpServletRequest)
		// ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		// String result = request.getParameter("formData");
		System.out.println(formData);
		LandMark tempLand = this.createLandMarkByFormData(this.handleFormData(formData));
		landMark.setId(tempLand.getId());
		if (tempLand.getId() != null && tempLand.getId() != "") {
			landMarkService.update(tempLand);
			writeJSonFile();
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return this.json;
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
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
		if (list == null || list.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
		String result = new Gson().toJson(list);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	public void writeJSonFile() {
		List<LandMark> list = landMarkService.getForList();
		System.out.println(list);
		String result = new Gson().toJson(list);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
	}

	public String deleteLandMark() throws UnsupportedEncodingException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		String idStr = request.getParameter("formData[id]");
		String[] ids = idStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			LandMark tempLandMark = new LandMark();
			String id = ids[i];
			tempLandMark.setId(id.substring(1, id.length() - 1));
			System.out.println(tempLandMark);
			tempLandMark = landMarkService.get(tempLandMark);
			System.out.println(tempLandMark);
			if (tempLandMark != null) {
				landMarkService.delete(tempLandMark);
			}
		}
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	/**
	 * 前台获取地图景点数据
	 * 
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
		return this.json;
	}

	@Override
	public LandMark getModel() {
		// TODO Auto-generated method stub
		this.landMark = new LandMark();
		return landMark;
	}

}
