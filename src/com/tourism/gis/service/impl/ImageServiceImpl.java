package com.tourism.gis.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tourism.gis.bean.Image;
import com.tourism.gis.dao.ImageDao;
import com.tourism.gis.service.ImageService;

@Transactional
public class ImageServiceImpl implements ImageService {

	private ImageDao imageDao;

	public void setImageDao(ImageDao imageDao) {
		this.imageDao = imageDao;
	}

	@Override
	public void addImage(Image img) {
		this.imageDao.addImage(img);
	}

	@Override
	public void updateImage(Image img) {
		// TODO Auto-generated method stub
		this.imageDao.updateImage(img);
	}

	@Override
	public void deleteImage(Image img) {
		// TODO Auto-generated method stub
		this.imageDao.deleteImage(img);
	}

	@Override
	public Image getImage(Image img) {
		// TODO Auto-generated method stub
		return this.imageDao.getImage(img);
	}

	@Override
	public List<Image> getImageList(Object... objects) {
		// TODO Auto-generated method stub
		return this.getImageList(objects);
	}

}
