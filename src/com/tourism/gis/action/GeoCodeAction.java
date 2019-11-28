package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.tourism.gis.util.GeoCode;

public class GeoCodeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String address;

	public void setAddress(String address) {
		this.address = address;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String getCode() {
		System.out.println("GeoCode.....");
		Gson gson = new Gson();
		String result = gson.toJson(GeoCode.getGeoCode(address));
		try {
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "geoJson";
	}

}
