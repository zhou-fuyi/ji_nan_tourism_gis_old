package com.tourism.gis.bean;

/**
 * 图片类
 * 
 * @author Administrator
 *
 */
public class Image {

	private String id;
	private String name;
	private String address;
	private String imageDescribe;

	public Image() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImageDescribe() {
		return imageDescribe;
	}

	public void setImageDescribe(String imageDescribe) {
		this.imageDescribe = imageDescribe;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ",name=" + name + ", address=" + address + ", imageDescribe=" + imageDescribe + "]";
	}

}
