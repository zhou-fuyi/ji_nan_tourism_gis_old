package com.tourism.gis.bean;

public class Spot_LandMark_Mapping {

	private String id;
	private ScenicSpot scenicSpot;
	private LandMark landMark;

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

	public LandMark getLandMark() {
		return landMark;
	}

	public void setLandMark(LandMark landMark) {
		this.landMark = landMark;
	}

}
