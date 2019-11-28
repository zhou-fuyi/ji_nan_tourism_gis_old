package com.tourism.gis.dao;

import java.util.Set;

import com.tourism.gis.bean.Admin_User_Role_Mapping;


public interface Admin_User_Role_MappingDao {

	public void add(Admin_User_Role_Mapping mapping);

	public void deleteMapping(Admin_User_Role_Mapping mapping);

	public void update(Admin_User_Role_Mapping mapping);

	public Admin_User_Role_Mapping get(String hql, Object... objects);

	public Set<Admin_User_Role_Mapping> getForSet(String hql, Object... objects);

}
