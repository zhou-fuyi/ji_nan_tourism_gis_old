package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.LandMark;

public interface LandMarkService {

	public void add(LandMark point);

	public void delete(LandMark point);

	public LandMark get(LandMark point);

	public List<LandMark> getForList(Object... objects);

	public void update(LandMark point);
}
