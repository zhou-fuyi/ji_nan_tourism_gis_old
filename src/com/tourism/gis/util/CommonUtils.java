package com.tourism.gis.util;

import java.util.UUID;

public class CommonUtils {

	/**
	 * UUID生成器
	 * 
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

	public static void main(String[] args) {
		System.out.println(CommonUtils.uuid());
	}
}
