package com.tourism.gis.dao;

import java.util.Set;

import com.tourism.gis.bean.Role_Resource_Mapping;

public interface Role_Resource_MappingDao {

	public void add(Role_Resource_Mapping mapping);

	public void deleteMapping(Role_Resource_Mapping mapping);

	public void update(Role_Resource_Mapping mapping);

	public Role_Resource_Mapping get(Role_Resource_Mapping mapping);

	public Set<Role_Resource_Mapping> getForSet(String hql, Object... objects);
}
