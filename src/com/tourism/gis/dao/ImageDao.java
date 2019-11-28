package com.tourism.gis.dao;

import java.util.List;

import com.tourism.gis.bean.Image;

public interface ImageDao {

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
	 * 获取指定条件下图片组成的List集合
	 * 
	 * @param objects
	 * @return
	 */
	public List<Image> getImageList(Object... objects);

	/**
	 * 批量操作
	 * 
	 * @param objects
	 */
	public void batch(Object... objects);
}
