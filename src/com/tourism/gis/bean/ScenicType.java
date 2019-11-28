package com.tourism.gis.bean;

/**
 * 景区类型
 * 
 * @author Administrator
 *
 */
public class ScenicType {

	private String id;
	private String name;
	private String color;
	private String subject;

	public ScenicType() {

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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "ScenicType [id=" + id + ", name=" + name + ", color=" + color + ", subject=" + subject + "]";
	}

}
