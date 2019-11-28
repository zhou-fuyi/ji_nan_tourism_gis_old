package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Image;
import com.tourism.gis.service.ImageService;

public class ImageAction extends ActionSupport implements ModelDriven<Image> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private ImageService imageService;
	private Image image;
	private File file;
	private String fileContentType;
	private String fileFileName;
	private String path = ServletActionContext.getServletContext().getRealPath("/") + "images_jinan\\";
	private InputStream inputStream;

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public File getFile() {
		return file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	/**
	 * 保存景点图片
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String saveLandMarkImg() throws UnsupportedEncodingException {
		path = path + "landMark\\";// 存放图片的路径
		String result = "images_jinan/landMark/";
		try {
			System.out.println("Src File name: " + file);
			System.out.println("Dst File name: " + fileFileName);
			// System.out.println(file);
			File destFile = new File(path, fileFileName);
			if (!destFile.getParentFile().exists()) {
				destFile.getParentFile().mkdirs();
			}
			FileUtils.copyFile(file, destFile);// 将上传文件进行复制转移
		} catch (IOException e) {
			e.printStackTrace();
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "imgJson";
		}
		result += fileFileName;
		inputStream = new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));
		return "imgJson";
	}

	public String saveUserPicture() throws UnsupportedEncodingException {
		path = path + "user\\";// 存放图片的路径
		String result = "/images_jinan/user/";
		try {
			System.out.println("Src File name: " + file);
			System.out.println("Dst File name: " + fileFileName);
			// System.out.println(file);
			File destFile = new File(path, fileFileName);
			if (!destFile.getParentFile().exists()) {
				destFile.getParentFile().mkdirs();
			}
			FileUtils.copyFile(file, destFile);// 将上传文件进行复制转移
		} catch (IOException e) {
			e.printStackTrace();
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "imgJson";
		}
		result += fileFileName;
		System.out.println(result);
		inputStream = new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));
		return "imgJson";
	}

	@Override
	public Image getModel() {
		// TODO Auto-generated method stub
		image = new Image();
		return image;
	}

}
