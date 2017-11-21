package com.gift.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.Address;

@Repository
public class AddressDao extends BaseDao<Address> {

	// 根据帐号查找该找好的所有地址
	public List<Address> getAddressesByAccount(String account) {
		String hql = "FROM Address a WHERE a.user_account = ? ";
		List<Address> list = super.find(hql, new Object[] { account });
		return list;
	}

}
