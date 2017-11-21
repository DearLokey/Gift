package com.gift.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.gift.domain.User;

@Repository
public class UserDao extends BaseDao<User> {
	// 根据账号找到用户
	public User findUserByAccount(String name) {
		String sql = "FROM User u WHERE u.account=:account";
		Session session = getSessionFactory().openSession();
		Query query = session.createQuery(sql).setParameter("account", name);
		User user = (User) query.uniqueResult();
		session.flush();
		session.close();
		return user;
	}

	public void addUser(String account, String password) {
		Session session = getSessionFactory().openSession();
		session.save(new User(account, password, "no", "head7.png", 0.0, "新用户"));
		session.flush();
		session.close();
	}

	public List<User> findUsersByWord(String account) {
		String hql = "FROM User u WHERE u.account LIKE '%" + account + "%'";
		return super.find(hql);
	}
}
