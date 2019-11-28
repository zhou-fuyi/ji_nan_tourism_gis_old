package com.tourism.gis.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class ImageUtil {

	public static boolean saveScenicSpotDefaultPhoto(String path, File file, String fileName) {
		System.out.println("Src File name: " + file);
		System.out.println("Dst File name: " + fileName);
		// System.out.println(file);
		File destFile = new File(path, fileName);
		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		try {
			FileUtils.copyFile(file, destFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("图片上传失败！");
			return false;
		} // 将上传文件进行复制转移
		System.out.println("图片上传成功！");
		return true;

	}
}
