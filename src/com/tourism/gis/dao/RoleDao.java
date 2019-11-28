package com.tourism.gis.dao;

import java.util.Set;

import com.tourism.gis.bean.Role;

public interface RoleDao {

	public void add(Role role);

	public void deleteRole(Role role);

	public void update(Role role);

	public Role get(Role role);

	public Set<Role> getForSet(Object... objects);
}
