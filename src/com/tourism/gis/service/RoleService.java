package com.tourism.gis.service;

import java.util.Set;

import com.tourism.gis.bean.Role;

public interface RoleService {

	public void addRole(Role role);

	public void deleteRole(Role role);

	public void updateRole(Role role);

	public Role getRole(Role role);

	public Set<Role> getRoleSet(Object... objects);
}
