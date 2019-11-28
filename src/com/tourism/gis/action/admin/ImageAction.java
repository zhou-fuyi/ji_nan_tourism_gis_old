package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Image;
import com.tourism.gis.service.ImageService;
import com.tourism.gis.util.ImageUtil;
import com.tourism.gis.util.bean.Msg;

public class ImageAction extends ActionSupport implements ModelDriven<Image> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ImageService imageService;
	private Image image;
	private File img;
	private String imgContentType;
	private String imgFileName;
	private String path = ServletActionContext.getServletContext().getRealPath("/") + "images_jinan\\";
	private InputStream inputStream;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String id;

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public File getFile() {
		return file;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getImgContentType() {
		return imgContentType;
	}

	public void setImgContentType(String imgContentType) {
		this.imgContentType = imgContentType;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ImageService getImageService() {
		return imageService;
	}

	public Image getImage() {
		return image;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public InputStream getInputStream() {
		return inputStream;
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
			System.out.println("Src File name: " + img);
			System.out.println("Dst File name: " + imgFileName);
			// System.out.println(file);
			File destFile = new File(path, imgFileName);
			if (!destFile.getParentFile().exists()) {
				destFile.getParentFile().mkdirs();
			}
			FileUtils.copyFile(img, destFile);// 将上传文件进行复制转移
		} catch (IOException e) {
			e.printStackTrace();
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "adminImgJson";
		}
		result += imgFileName;
		inputStream = new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));
		return "adminImgJson";
	}

	public String saveScenicSpotDefaultPhoto() throws UnsupportedEncodingException {
		path = path + "scenicSpot\\";// 存放图片的路径
		if (ImageUtil.saveScenicSpotDefaultPhoto(path, img, imgFileName)) {
			String result = "images_jinan/scenicSpot/" + imgFileName;
			inputStream = new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));
			return "adminImgJson";
		} else {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "adminImgJson";
		}
	}

	@Override
	public Image getModel() {
		// TODO Auto-generated method stub
		image = new Image();
		return image;
	}

	public String uploadLandMarkImg() throws IllegalStateException, IOException {
		System.out.println(id);
		path = path + "scenic\\";// 存放图片的路径
		Msg msg = new Msg();
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
			msg.setCode("400");
			msg.setMsg("上传失败");
			System.out.println(msg);
			inputStream = new ByteArrayInputStream(JSON.toJSONString(msg).getBytes("UTF-8"));
			return "adminImgJson";
		}
		String name = "images_jinan/scenic/" + fileFileName;
		msg.setCode("1");
		msg.setMsg("上传成功");
		msg.getData().add(name);
		msg.setUrl(name);
		System.out.println(msg);
		inputStream = new ByteArrayInputStream(JSON.toJSONString(msg).getBytes("UTF-8"));
		return "adminImgJson";
	}

}
