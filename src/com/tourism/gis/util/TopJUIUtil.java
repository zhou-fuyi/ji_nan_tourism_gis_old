package com.tourism.gis.util;

import java.util.HashMap;
import java.util.Map;

import com.tourism.gis.bean.LandMark;

public class TopJUIUtil {

	
	public static Map<String, String> handleFormData(String args){
		Map<String, String> map = new HashMap<>();
		String[] strs = args.split("&");
		for(String st: strs) {
			String[] temp = st.split("=");
			if(temp.length == 1) {
				map.put(temp[0], "");
			}else {
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
}
