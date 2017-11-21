package com.gift.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.BigWhoCategory;

@Repository
public class BigWhoCategoryDao extends BaseDao<BigWhoCategory> {
	// 得到所有送给谁的大分类
	public List<BigWhoCategory> getAllBigWhoCategories() {
		List<BigWhoCategory> list = new ArrayList<BigWhoCategory>();
		list = super.loadAll();
		return list;
	}
}
