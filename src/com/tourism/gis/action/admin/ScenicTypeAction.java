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
import com.tourism.gis.bean.ScenicType;
import com.tourism.gis.service.ScenicTypeService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;

public class ScenicTypeAction extends ActionSupport implements ModelDriven<ScenicType> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ScenicTypeService scenicTypeService;
	private ScenicType scenicType;
	private String pathName = "json\\scenicType\\scenicType.json";
	private String typeJson = "typeJson";
	private InputStream inputStream;
	private String formData; // topjui 自己封装的数据提交data

	public void setFormData(String formData) {
		try {
			this.formData = URLDecoder.decode(formData, "UTF-8").toString();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
	}

	public String getFormData() {
		return formData;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setScenicTypeService(ScenicTypeService scenicTypeService) {
		this.scenicTypeService = scenicTypeService;
	}

	public void setScenicType(ScenicType scenicType) {
		this.scenicType = scenicType;
	}

	/**
	 * 向外写入json文件
	 */
	public void writeJsonFile() {
		List<ScenicType> list = scenicTypeService.getScenicTypeList();
		System.out.println(list);
		String result = new Gson().toJson(list);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
	}

	/**
	 * 自定义解析FormData
	 * 
	 * @param map
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

	/**
	 * 将解析后的formData封装为对象
	 * 
	 * @param map
	 * @return
	 */
	public ScenicType createScenicTypeByFormData(Map<String, String> map) {
		ScenicType temp = new ScenicType();
		temp.setId(map.get("id"));
		temp.setName(map.get("name"));
		temp.setColor(map.get("color"));
		temp.setSubject(map.get("subject"));
		return temp;
	}

	// =================================================================================

	/**
	 * 通过我自己的数据提交方式添加景点类型
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String addScenicTypeByStruts() throws UnsupportedEncodingException {
		System.out.println(scenicType);
		if (scenicType.getName() == null) {
			this.inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.typeJson;
		} else {
			scenicType.setId(CommonUtils.uuid());
			scenicTypeService.addScenicType(scenicType);
			this.inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return this.typeJson;
		}
	}

	/**
	 * 通过TOPJUI 封装的数据提交方式添加景点类型
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String addScenicTypeByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		ScenicType temp = this.createScenicTypeByFormData(this.handleFormData(formData));
		if (temp == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.typeJson;
		}
		temp.setId(CommonUtils.uuid());
		scenicTypeService.addScenicType(temp);
		writeJsonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.typeJson;
	}

	/**
	 * 删除勾选的行
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String deleteScenicTypeByTOPJUI() throws UnsupportedEncodingException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		String idStr = request.getParameter("formData[id]");
		String[] ids = idStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			ScenicType temp = new ScenicType();
			String id = ids[i];
			temp.setId(id.substring(1, id.length() - 1));
			System.out.println(temp);
			temp = this.scenicTypeService.getScenicType(temp);
			System.out.println(temp);
			if (temp != null) {
				this.scenicTypeService.deleteScenicType(temp);
			} else {
				inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
				return this.typeJson;
			}
		}
		writeJsonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.typeJson;
	}

	/**
	 * 修改选中的行 只能单个选中 不是使用的checkbox 而是选中行
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String editScenicTypeByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		ScenicType temp = this.createScenicTypeByFormData(this.handleFormData(formData));
		// temp.setId(CommonUtils.uuid());
		if (temp.getId() != null && temp.getId() != "") {
			this.scenicTypeService.updateScenicType(temp);
			writeJsonFile();
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return this.typeJson;
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.typeJson;
		}
	}

	public String getScenicTypeById() throws UnsupportedEncodingException {
		ScenicType type = this.scenicTypeService.getScenicType(scenicType);
		inputStream = new ByteArrayInputStream(JSON.toJSONString(type).getBytes("UTF-8"));
		return this.typeJson;
	}

	/**
	 * 获取所有景点类型信息 并写入一个json文件
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getScenicTypeList() throws UnsupportedEncodingException {
		try {
			List<ScenicType> list = this.scenicTypeService.getScenicTypeList();
			String result = JSON.toJSONString(list);
			WriteJsonFile.writeConfigJsonFile(result, pathName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.typeJson;
		}
		this.inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.typeJson;
	}

	@Override
	public ScenicType getModel() {
		// TODO Auto-generated method stub
		scenicType = new ScenicType();
		return scenicType;
	}

}
