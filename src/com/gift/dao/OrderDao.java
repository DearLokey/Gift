package com.gift.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.Order;

@Repository
public class OrderDao extends BaseDao<Order> {
	// 新增订单
	public void addOrder(Order order) {
		super.save(new Order("待发货", order.getUser_account(), order
				.getAddress_id(), new Timestamp(new Date().getTime()), order
				.getGift_id()));
	}

	// 根据订单生成时间对订单排序
	public List<Order> getOrdersByTime() {
		String hql = "FROM Order o ORDER BY o.order_time ";
		List<Order> list = new ArrayList<Order>();
		list = super.find(hql);
		return list;
	}

	// 根据帐号找到所有订单
	public List<Order> getOrdersByAccount(String user_account) {
		String hql = "FROM Order o WHERE o.user_account = ? ";
		List<Order> list = new ArrayList<Order>();
		list = super.find(hql, new Object[] { user_account });
		return list;
	}
}
