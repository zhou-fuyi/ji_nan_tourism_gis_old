package com.tourism.gis.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateUtil {

	public static String timeStampToString(Timestamp time) {

		// Timestamp ts = new Timestamp(System.currentTimeMillis());
		String tsStr = "";
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			// 方法一
			tsStr = sdf.format(time);
			System.out.println(tsStr);
			// 方法二
			// tsStr = ts.toString();
			// System.out.println(tsStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tsStr;

	}

	public static void main(String[] args) {
		// DateUtil.timeStampToString();
	}
}
