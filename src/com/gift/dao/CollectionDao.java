package com.gift.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.Collection;

@Repository
public class CollectionDao extends BaseDao<Collection> {
	// 找到指定账户下的所有收藏礼品
	public List<Collection> getCollectionsByAccount(String account) {
		String hql = "FROM Collection c where c.user_account = ? ";
		List<Collection> list = new ArrayList<Collection>();
		list = super.find(hql, new Object[] { account });
		return list;
	}

	// 根据礼品的id找到该礼品的收藏列表
	public List<Collection> getCollectionsByGift_id(int gift_id) {
		String hql = "FROM Collection c WHERE c.gift_id = ? ";
		List<Collection> list = new ArrayList<Collection>();
		list = super.find(hql, new Object[] { gift_id });
		return list;
	}
}
