package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Resource;
import com.tourism.gis.service.ResourceService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;

public class ResourceAction extends ActionSupport implements ModelDriven<Resource> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResourceService resourceService;
	private Resource resource;
	private InputStream inputStream;
	private String resJson = "resJson";
	private String pathName = "json\\resource\\resource.json";
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

	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * 向外写入json文件
	 */
	public void writeJsonFile() {
		Set<Resource> set = this.resourceService.getResourceSet();
		if (set != null) {
			List<Resource> temp = new ArrayList<>(set);
			String result = JSON.toJSONString(temp);
			WriteJsonFile.writeConfigJsonFile(result, pathName);
		}
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
	public Resource createResourceByFormData(Map<String, String> map) {
		Resource temp = new Resource();
		temp.setId(map.get("id"));
		temp.setRemark(map.get("reMark"));
		temp.setResName(map.get("resName"));
		try {
			temp.setIsUsed(Integer.parseInt(map.get("isUsed")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Resource IsUsed  字符串转整型失败...");
		}
		temp.setDetail(map.get("detail"));
		return temp;
	}

	// =================================================================================================

	public String addResourceByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		Resource temp = this.createResourceByFormData(this.handleFormData(formData));
		if (temp == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.resJson;
		}
		temp.setId(CommonUtils.uuid());
		this.resourceService.addResource(temp);
		writeJsonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.resJson;
	}

	public String addResource() throws UnsupportedEncodingException {
		if (resource == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return resJson;
		} else {
			resource.setId(CommonUtils.uuid());
			resourceService.addResource(resource);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return resJson;
		}
	}

	public String editResourceByTOPJUI() throws UnsupportedEncodingException {
		System.out.println(formData);
		Resource temp = this.createResourceByFormData(this.handleFormData(formData));
		if (temp.getId() != null && temp.getId() != "") {
			this.resourceService.updateResource(temp);
			writeJsonFile();
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return this.resJson;
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return this.resJson;
		}
	}

	public String deleteResourceByTOPJUI() throws UnsupportedEncodingException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		String idStr = request.getParameter("formData[id]");
		String[] ids = idStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			Resource temp = new Resource();
			String id = ids[i];
			temp.setId(id.substring(1, id.length() - 1));
			System.out.println(temp);
			temp = this.resourceService.getResource(temp);
			System.out.println(temp);
			if (temp != null) {
				this.resourceService.deleteResource(temp);
			}
		}
		writeJsonFile();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return this.resJson;
	}

	public String getResourceById() throws UnsupportedEncodingException {
		Resource temp = this.resourceService.getResource(resource);
		String result = "-1";
		if (temp != null) {
			result = JSON.toJSONString(temp);
		}
		System.out.println(result);
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return resJson;
	}

	public String getResourceSet() throws UnsupportedEncodingException {
		Set<Resource> set = resourceService.getResourceSet();
		if (set == null || set.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return resJson;
		} else {
			String result = JSON.toJSONString(set);
			WriteJsonFile.writeConfigJsonFile(result, pathName);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			return resJson;
		}
	}

	@Override
	public Resource getModel() {
		// TODO Auto-generated method stub
		resource = new Resource();
		return resource;
	}
}
