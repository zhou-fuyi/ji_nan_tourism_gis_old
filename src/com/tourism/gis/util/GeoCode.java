package com.tourism.gis.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

public class GeoCode {

	private static final String BAIDU_APP_KEY = "5vHDEZDCrT5TRRCeQ9vyOmHZSQh7YYQs";

	// 正向地址编码
	public static String getGeoCode(String address) {
		try {
			address = URLEncoder.encode(address, "UTF-8");
			URL resjson = new URL(
					"http://api.map.baidu.com/geocoder/v2/?address=" + address + "&output=json&ak=" + BAIDU_APP_KEY);
			BufferedReader in = new BufferedReader(new InputStreamReader(resjson.openStream()));
			String res;
			StringBuilder sb = new StringBuilder("");
			while ((res = in.readLine()) != null) {
				sb.append(res.trim());
			}
			in.close();
			String str = sb.toString();
			System.out.println(str);
			return str;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		GeoCode.getGeoCode("济南市历下区大明湖公园");
	}
}
