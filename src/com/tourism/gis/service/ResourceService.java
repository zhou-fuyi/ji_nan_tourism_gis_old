package com.tourism.gis.service;

import java.util.Set;

import com.tourism.gis.bean.Resource;

public interface ResourceService {

	public void addResource(Resource res);

	public void deleteResource(Resource res);

	public void updateResource(Resource res);

	public Resource getResource(Resource res);

	public Set<Resource> getResourceSet(Object... objects);
}
