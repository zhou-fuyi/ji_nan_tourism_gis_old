package test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class LocationTest {

	private static final String BAIDU_APP_KEY = "Drr60F7gRQ6C2uG1djy9G9WphKLfTlsi";

	/**
	 * ���������ַ�ľ�γ������ key lng(����),lat(γ��)
	 */
	public static Map<String, String> getLatitude(String address) {
		try {
			// ����ַת����utf-8��16����
			address = URLEncoder.encode(address, "UTF-8");
			// ����д���Ҫ���ô���û�����ע��
			// System.setProperty("http.proxyHost","192.168.172.23");
			// System.setProperty("http.proxyPort","3209");

			// http://api.map.baidu.com/geocoder/v2/?address=�����к������ϵ�ʮ��10��
			// &output=json&ak=����ak&callback=showLocation
			URL resjson = new URL(
					"http://api.map.baidu.com/geocoder/v2/?address=" + address + "&output=json&ak=" + BAIDU_APP_KEY);
			BufferedReader in = new BufferedReader(new InputStreamReader(resjson.openStream()));
			// resjson.openStream()�򿪵��� URL �����Ӳ�����һ�����ڴӸ����Ӷ���� InputStream��
			String res;
			StringBuilder sb = new StringBuilder("");
			while ((res = in.readLine()) != null) {
				sb.append(res.trim());
			}
			in.close();
			String str = sb.toString();
			System.out.println("return json:" + str);
			if (str != null && !str.equals("")) {
				Map<String, String> map = null;
				int lngStart = str.indexOf("lng\":");
				int lngEnd = str.indexOf(",\"lat");
				int latEnd = str.indexOf("},\"precise");
				if (lngStart > 0 && lngEnd > 0 && latEnd > 0) {
					String lng = str.substring(lngStart + 5, lngEnd);
					String lat = str.substring(lngEnd + 7, latEnd);
					map = new HashMap<String, String>();
					map.put("lng", lng);
					map.put("lat", lat);
					return map;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

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

	public static void main(String args[]) {

		/*
		 * Map<String, String> map = LocationTest.getLatitude("济南市历下区大明湖公园"); if (null
		 * != map) { System.out.println(map.get("lng"));
		 * System.out.println(map.get("lat")); }
		 */
		LocationTest.getGeoCode("济南市历下区大明湖公园");
	}
}
