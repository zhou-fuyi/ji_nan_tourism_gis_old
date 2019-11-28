package com.tourism.gis.bean;

public class Spot_Type_Mapping {

	private String id;
	private ScenicSpot scenicSpot;
	private ScenicType scenicType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ScenicSpot getScenicSpot() {
		return scenicSpot;
	}

	public void setScenicSpot(ScenicSpot scenicSpot) {
		this.scenicSpot = scenicSpot;
	}

	public ScenicType getScenicType() {
		return scenicType;
	}

	public void setScenicType(ScenicType scenicType) {
		this.scenicType = scenicType;
	}

}
