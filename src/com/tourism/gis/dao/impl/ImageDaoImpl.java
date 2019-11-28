package com.tourism.gis.dao.impl;

import java.util.List;

import com.tourism.gis.bean.Image;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.ImageDao;


public class ImageDaoImpl extends BaseDao<Image> implements ImageDao {

	@Override
	public void addImage(Image img) {
		saveOrUpdate(img);
	}

	@Override
	public void updateImage(Image img) {
		saveOrUpdate(img);
	}

	@Override
	public void deleteImage(Image img) {
		delete(img);
	}

	@Override
	public Image getImage(Image img) {
		String hql = "from Image i where i.id = ?";
		return query(hql, img.getId());
	}

	@Override
	public List<Image> getImageList(Object... objects) {
		String hql = "from Image";
		return queryForList(hql, objects);
	}

	@Override
	public void batch(Object... objects) {
		// TODO Auto-generated method stub

	}

}
