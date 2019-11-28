package com.tourism.gis.service;

import java.util.List;

import com.tourism.gis.bean.Image;

public interface ImageService {

	/**
	 * 添加图片
	 * 
	 * @param img
	 */
	public void addImage(Image img);

	/**
	 * 修改图片
	 * 
	 * @param img
	 */
	public void updateImage(Image img);

	/**
	 * 删除图片
	 * 
	 * @param img
	 */
	public void deleteImage(Image img);

	/**
	 * 获取指定图片
	 * 
	 * @param img
	 * @return
	 */
	public Image getImage(Image img);

	/**
	 * 获取一组图片集合
	 * 
	 * @return
	 */
	public List<Image> getImageList(Object... objects);
}
