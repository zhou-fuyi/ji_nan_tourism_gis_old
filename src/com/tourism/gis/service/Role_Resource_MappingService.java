package com.tourism.gis.service;

import java.util.Set;

import com.tourism.gis.bean.Resource;
import com.tourism.gis.bean.Role;
import com.tourism.gis.bean.Role_Resource_Mapping;

public interface Role_Resource_MappingService {

	public void addRole_Resource_Mapping(Role_Resource_Mapping mapping);

	public void deleteRole_Resource_Mapping(Role_Resource_Mapping mapping);

	public void updateRole_Resource_Mapping(Role_Resource_Mapping mapping);

	public Role_Resource_Mapping getRole_Resource_MappingById(Role_Resource_Mapping mapping);

	public Set<Role_Resource_Mapping> getRole_Resource_MappingSetByRoleId(Role role);

	public Set<Role_Resource_Mapping> getRole_Resource_MappingByResourceId(Resource res);

	public Set<Role_Resource_Mapping> getRole_Resource_Mapping(Object... objects);
}
