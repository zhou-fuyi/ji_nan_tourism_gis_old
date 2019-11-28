package com.tourism.gis.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

public class WriteJsonFile {
	// C:\tomcat\temp\jinan_tourism_gis\json\C:\tomcat\apache-tomcat-9.0.6-windows-x64-java\apache-tomcat-9.0.6\webapps\jinan_tourism_gis\

	private static String WRITE_JSON_FILE_PATH = ServletActionContext.getServletContext().getRealPath("/");

	public static void writeConfigJsonFile(String jsonStr, String fileName) {
		String pathName = WRITE_JSON_FILE_PATH + fileName;
		System.out.println(pathName);
		File file = new File(pathName);
		// System.out.println(file);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}

		try {
			file.delete();
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			FileWriter fw = new FileWriter(file, true);
			fw.write(jsonStr);
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) throws IOException {
		// 可以输入当前文件所在路径
		// System.out.println(new File("").getCanonicalPath());
	}

}
