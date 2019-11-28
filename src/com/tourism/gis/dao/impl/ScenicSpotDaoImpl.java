package com.tourism.gis.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.tourism.gis.bean.ScenicSpot;
import com.tourism.gis.dao.BaseDao;
import com.tourism.gis.dao.ScenicSpotDao;
import com.tourism.gis.util.PageConstants;
import com.tourism.gis.util.bean.PageBean;


public class ScenicSpotDaoImpl extends BaseDao<ScenicSpot> implements ScenicSpotDao {

	@Override
	public void addScenicSpot(ScenicSpot spot) {
		saveOrUpdate(spot);
	}

	@Override
	public void updateScenicSpot(ScenicSpot spot) {
		saveOrUpdate(spot);
	}

	@Override
	public void deleteScenicSpot(ScenicSpot spot) {
		delete(spot);
	}

	@Override
	public ScenicSpot getScenicSpot(ScenicSpot spot) {
		String hql = "from ScenicSpot s where s.id = ?";
		return query(hql, spot.getId());
	}

	@Override
	public List<ScenicSpot> getScenicSpotList(Object... objects) {
		String hql = "from ScenicSpot";
		return queryForList(hql, objects);
	}
	
	@Override
	public PageBean<ScenicSpot> queryScenicSpot(ScenicSpot spot, int pageCode) {
		// TODO Auto-generated method stub
		int pageSize = PageConstants.SCENIC_PAGE_SIZE;
		String hql = "select count(*) from ScenicSpot";
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);

		int totalRecoder = ((Number)query.uniqueResult()).intValue();
		System.out.println(totalRecoder);
		hql = "from ScenicSpot Order by releaseDate Desc";
		int start = (pageCode - 1) * pageSize;
		query = session.createQuery(hql);
		query.setFirstResult(start);//开始索引
		query.setMaxResults(pageSize);//每页显示个数
		List<ScenicSpot> scenicList = query.list();
		System.out.println(scenicList);
		if(scenicList == null || scenicList.size() == 0) {
			return null;
		}else {
			PageBean<ScenicSpot> pageBean = new PageBean<>();
			
			pageBean.setPageCode(pageCode);
			pageBean.setPageSize(pageSize);
			pageBean.setTotalRecoder(totalRecoder);
			pageBean.setBeanList(scenicList);
			System.out.println(pageBean);
			return pageBean;
		}
	}

	@Override
	public void batch(Object... objects) {
		// TODO Auto-generated method stub

	}

}
