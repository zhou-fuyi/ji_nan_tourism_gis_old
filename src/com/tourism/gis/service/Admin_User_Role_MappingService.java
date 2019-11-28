package com.tourism.gis.service;

import java.util.Set;

import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.bean.Admin_User_Role_Mapping;
import com.tourism.gis.bean.Role;
import com.tourism.gis.bean.User;

public interface Admin_User_Role_MappingService {

	public void addAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping);

	public void deleteAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping);

	public void updateAdmin_User_Role_Mapping(Admin_User_Role_Mapping mapping);

	/**
	 * 根据ID获取
	 * 
	 * @param mapping
	 * @return
	 */
	public Admin_User_Role_Mapping getAdmin_User_Role_MappingById(Admin_User_Role_Mapping mapping);

	/**
	 * 根据AdminId获取set集合
	 * 
	 * @param adminUser
	 * @return
	 */
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByAdminId(AdminUser adminUser);

	/**
	 * 根据UserId 获取Set集合
	 * 
	 * @param user
	 * @return
	 */
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByUserId(User user);

	/**
	 * 根据RoleId 获取Set 集合
	 * 
	 * @param role
	 * @return
	 */
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSetByRoleId(Role role);

	/**
	 * 获取set集合
	 * 
	 * @param objects
	 * @return
	 */
	public Set<Admin_User_Role_Mapping> getAdmin_User_Role_MappingSet(Object... objects);
}
