package com.tourism.gis.service.impl;

import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Resource;
import com.tourism.gis.dao.ResourceDao;
import com.tourism.gis.service.ResourceService;

@Transactional
public class ResourceServiceImpl implements ResourceService {

	private ResourceDao resourceDao;

	public void setResourceDao(ResourceDao resourceDao) {
		this.resourceDao = resourceDao;
	}

	@Override
	public void addResource(Resource res) {
		// TODO Auto-generated method stub
		this.resourceDao.add(res);
	}

	@Override
	public void deleteResource(Resource res) {
		// TODO Auto-generated method stub
		this.resourceDao.deleteResource(res);
	}

	@Override
	public void updateResource(Resource res) {
		// TODO Auto-generated method stub
		this.resourceDao.update(res);
	}

	@Override
	public Resource getResource(Resource res) {
		// TODO Auto-generated method stub
		return this.resourceDao.get(res);
	}

	@Override
	public Set<Resource> getResourceSet(Object... objects) {
		// TODO Auto-generated method stub
		return this.resourceDao.getForSet(objects);
	}

}
