package com.gift.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import sun.net.www.content.image.gif;

import com.gift.domain.Gift;

@Repository
public class GiftDao extends BaseDao<Gift> {
	// 新增礼品
	public void addGift(int who_id, String name, double price, String picture,
			int stock_num, String introduction) {
		super.save(new Gift(who_id, 1, name, price, picture, stock_num, 0, 0,
				new Timestamp(new Date().getTime()), introduction));
	}

	// 根据送给谁的id找到该类别下的礼品列表
	public List<Gift> getGiftsByWho_id(int who_id) {
		String hql = "FROM Gift g where g.who_id = ? ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql, new Object[] { who_id });
		return list;
	}

	// 模糊查
	public List<Gift> getGiftsByWord(String word) {
		String hql = "FROM Gift g WHERE g.name LIKE '%" + word + "%'";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据礼品上架时间排序
	public List<Gift> getGiftsBySelling_time() {
		String hql = "FROM Gift g ORDER BY g.selling_time ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据销量排序 升序
	public List<Gift> getGiftsBySales_num() {
		String hql = "FROM Gift g ORDER BY g.sales_num ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据销量排序 升序
	public List<Gift> getGiftsBySales_numD() {
		String hql = "FROM Gift g ORDER BY g.sales_num DESC ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据价格升序排序
	public List<Gift> getGiftsByPrice() {
		String hql = "FROM Gift g ORDER BY g.price ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据价格降序排序
	public List<Gift> getGiftsByPriceD() {
		String hql = "FROM Gift g ORDER BY g.price DESC";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据时间排序升序
	public List<Gift> getGiftBySelling_time() {
		String hql = "FROM Gift g ORDER BY g.selling_time ";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	// 根据时间排序降序
	public List<Gift> getGiftBySelling_timeD() {
		String hql = "FROM Gift g ORDER BY g.selling_time DESC";
		List<Gift> list = new ArrayList<Gift>();
		list = super.find(hql);
		return list;
	}

	public Gift getGiftBySelling_time(Timestamp timestamp){
		String hql ="FROM Gift g WHERE g.selling_time = ? ";
		Object[] param = new Object[]{timestamp};
		return super.find(hql, param).get(0);
	}
	
}
