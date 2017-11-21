package com.gift.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.WhoCategory;

@Repository
public class WhoCategoryDao extends BaseDao<WhoCategory> {
	// 根据送给谁的大类别id找到该类别下的小类别
	public List<WhoCategory> getWhoCategoriesByBigCategoryId(int bigwho_id) {
		String hql = "FROM WhoCategory w WHERE w.bigWho_id = ? ";
		List<WhoCategory> list = new ArrayList<WhoCategory>();
		list = super.find(hql, new Object[] { bigwho_id });
		return list;
	}
}
