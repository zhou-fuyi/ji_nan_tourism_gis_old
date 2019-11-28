package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Resource;
import com.tourism.gis.service.ResourceService;
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

	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public InputStream getInputStream() {
		return inputStream;
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
