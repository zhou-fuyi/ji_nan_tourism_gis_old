package test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;

public class PlaceTest {

	private static String AK = "Drr60F7gRQ6C2uG1djy9G9WphKLfTlsi";
	private static String query = "ATM��";
	private static String tag = "����";
	private static String region = "����";

	public static String getString() {
		String addr = "http://api.map.baidu.com/place/v2/search?query=";
		try {
			String qu = URLEncoder.encode(query, "UTF-8");
			String ta = URLEncoder.encode(tag, "UTF-8");
			String re = URLEncoder.encode(region, "UTF-8");
			addr = addr + query + "&tag=" + tag + "&region=" + region + "&output=json&ak=";
			return addr;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getSuggestionStr() {
		String str = "http://api.map.baidu.com/place/v2/suggestion?query=";
		try {
			String qu = URLEncoder.encode("������", "UTF-8");
			String re = URLEncoder.encode("����", "UTF-8");
			str += qu + "&region=" + re + "&city_limit=true&output=json&ak=";
			return str;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Result getPlace() {

		//�ص��������
		//http://api.map.baidu.com/place/v2/detail?uid=5a8fb739999a70a54207c130&output=json&scope=2&ak=Drr60F7gRQ6C2uG1djy9G9WphKLfTlsi
		String address = getString();
		//address = "http://api.map.baidu.com/place/v2/detail?uid=9989b558b3777804d3ff233b&output=json&scope=2&ak=";
		
		//�ص�������ʾ
		address = getSuggestionStr();
		System.out.println(address);
		try {
			URL resorceUrl = new URL(address + AK);
			System.out.println(resorceUrl.toString());
			BufferedReader in = new BufferedReader(new InputStreamReader(resorceUrl.openStream(), "UTF-8"));
			String res;
			StringBuilder sb = new StringBuilder("");
			while ((res = in.readLine()) != null) {
				sb.append(res.trim());
			}
			in.close();
			String str = sb.toString().trim();
			if (str != null && !str.equals("")) {
				
				Gson gson = new Gson();

				System.out.println(str);
				Result re = gson.fromJson(str, Result.class);
				return re;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(PlaceTest.getPlace());
	}
}
