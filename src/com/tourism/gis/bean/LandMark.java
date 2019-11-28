package com.tourism.gis.bean;

/**
 * 地标类
 * 
 * @author Administrator
 *
 */
public class LandMark {

	private String id;// 主键
	// private ScenicSpot scenicSpot; // 景区ID
	private double lat;// 纬度
	private double lng;// 经度
	private String name;// 地标名称
	private String tel;// 目标联系方式
	private String img;// 地标代表图
	private String subject;// 目标简介

	public LandMark() {

	}

	public LandMark(String id, double lat, double lng, String name, String tel, String img, String subject) {
		super();
		this.id = id;
		this.lat = lat;
		this.lng = lng;
		this.name = name;
		this.tel = tel;
		this.img = img;
		this.subject = subject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/*
	 * public ScenicSpot getScenicSpot() { return scenicSpot; }
	 * 
	 * public void setScenicSpot(ScenicSpot scenicSpot) { this.scenicSpot =
	 * scenicSpot; }
	 */
	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "LandMark [id=" + id + ", lat=" + lat + ", lng=" + lng + ", name=" + name + ", tel=" + tel + ", img="
				+ img + ", subject=" + subject + "]";
	}

}
