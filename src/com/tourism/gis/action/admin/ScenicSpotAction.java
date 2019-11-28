package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.Date;
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
import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.service.ResultService;
import com.tourism.gis.service.ScenicSpotService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;

public class ScenicSpotAction extends ActionSupport implements ModelDriven<ScenicSpot> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ScenicSpotService scenicSpotService;
	private ResultService resultService;
	private ScenicSpot scenicSpot;
	private String json = "spotJson";
	private InputStream inputStream;
	private String pathName = "json\\scenicSpot\\scenicSpot.json";
	private String formData;

	public void setResultService(ResultService resultService) {
		this.resultService = resultService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setScenicSpotService(ScenicSpotService scenicSpotService) {
		this.scenicSpotService = scenicSpotService;
	}

	public ScenicSpot getScenicSpot() {
		return scenicSpot;
	}

	public void setScenicSpot(ScenicSpot scenicSpot) {
		this.scenicSpot = scenicSpot;
	}

	public void writeJSonFile() {
		List<ScenicSpot> list = this.scenicSpotService.getScenicSpotList();
		System.out.println(list);
		String result = new Gson().toJson(list);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
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

	/**
	 * 将String字符串解析为一个map集合
	 * 
	 * @param args
	 * @return
	 */
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

	public ScenicSpot createScenicSpotByFormData(Map<String, String> map) {
		ScenicSpot temp = new ScenicSpot();
		temp.setAddress(map.get("address"));
		temp.setBus(map.get("bus"));
		temp.setcName(map.get("cName"));
		temp.setCostTime(map.get("costTime"));
		temp.setDefaultPhoto(map.get("defaultPhoto"));
		temp.setDiscount(map.get("discount"));
		temp.setDriving(map.get("driving"));
		temp.setFeature(map.get("feature"));
		temp.setGuideMan(map.get("guideMan"));
		temp.setId(map.get("id"));
		temp.setIntro(map.get("intro"));
		temp.setLevel(map.get("level"));
		temp.setLine(map.get("line"));
		temp.setManagement(map.get("management"));
		temp.setName(map.get("name"));
		temp.setPark(map.get("park"));
		temp.setPriceDescription(map.get("priceDescription"));
		// temp.setReleaseDate(map.get("releaseDate"));
		temp.setServiceCenter(map.get("serviceCenter"));
		temp.setSupporting(map.get("supporting"));
		temp.setTagline(map.get("tagline"));
		temp.setTel(map.get("tel"));
		temp.setTicketPrice(map.get("ticketPrice"));
		temp.setTime(map.get("time"));
		temp.setWebsite(map.get("website"));
		return temp;
	}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public String addScenicSpot() throws UnsupportedEncodingException {
		System.out.println(this.scenicSpot);
		if (scenicSpot.getName() == null || scenicSpot.getName() == "") {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
		scenicSpot.setId(CommonUtils.uuid());
		scenicSpot.setReleaseDate(new Timestamp(new Date().getTime()));
		Result result = new Result();
		result.setId(CommonUtils.uuid());
		result.setScenicSpotId(scenicSpot.getId());
		if (scenicSpot.getIntro() != null) {
			result.setSubject(scenicSpot.getIntro());
		}
		result.setTime(this.scenicSpot.getReleaseDate());
		result.setTitle(this.scenicSpot.getName());
		result.setType(2);
		result.setTime(new Timestamp(new Date().getTime()));
		scenicSpotService.addScenicSpot(scenicSpot, result);
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	public String addScenicSpotByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		ScenicSpot temp = this.createScenicSpotByFormData(this.handleFormData(formData));
		if (temp == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
		temp.setId(CommonUtils.uuid());
		temp.setReleaseDate(new Timestamp(new Date().getTime()));
		Result result = new Result();
		result.setId(CommonUtils.uuid());
		result.setScenicSpotId(temp.getId());
		result.setSubject(temp.getIntro());
		result.setTime(temp.getReleaseDate());
		result.setTitle(temp.getName());
		result.setType(2);
		result.setTime(new Timestamp(new Date().getTime()));
		System.out.println(result);
		scenicSpotService.addScenicSpot(temp, result);
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	public String deleteScenicSpot() throws UnsupportedEncodingException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		String idStr = request.getParameter("formData[id]");
		String[] ids = idStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			ScenicSpot temp = new ScenicSpot();
			String id = ids[i];
			temp.setId(id.substring(1, id.length() - 1));
			System.out.println(temp);
			temp = this.scenicSpotService.getScenicSpot(temp);
			System.out.println(temp);
			if (temp != null) {
				this.scenicSpotService.deleteScenicSpot(temp);
			}
		}
		writeJSonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.json;
	}

	/**
	 * 修改景区详情
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String editScenicStopByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		ScenicSpot temp = this.createScenicSpotByFormData(this.handleFormData(formData));
		this.scenicSpot.setId(temp.getId());
		if (temp.getId() != null && temp.getId() != "") {
			temp.setReleaseDate(new Timestamp(new Date().getTime()));
			Result result = this.resultService.getResultByScenicSpotId(temp.getId());
			if (temp.getIntro() != null) {
				result.setSubject(temp.getIntro());
			}
			result.setTime(temp.getReleaseDate());
			result.setTitle(temp.getName());
			this.scenicSpotService.updateScenicSpot(temp, result);
			writeJSonFile();
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return this.json;
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.json;
		}
	}

	public String getScenicSpotById() throws UnsupportedEncodingException {
		ScenicSpot temp = this.scenicSpotService.getScenicSpot(this.scenicSpot);
		String result = JSON.toJSONString(temp);
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return this.json;
	}

	public String getScenicSpotList() throws UnsupportedEncodingException {
		List<ScenicSpot> list = this.scenicSpotService.getScenicSpotList();
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

	@Override
	public ScenicSpot getModel() {
		// TODO Auto-generated method stub
		scenicSpot = new ScenicSpot();
		return scenicSpot;
	}

}
