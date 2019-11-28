package com.tourism.gis.dao;

import java.util.Set;

import com.tourism.gis.bean.Resource;

public interface ResourceDao {

	public void add(Resource res);

	public void deleteResource(Resource res);

	public void update(Resource res);

	public Resource get(Resource res);

	public Set<Resource> getForSet(Object... objects);
}
