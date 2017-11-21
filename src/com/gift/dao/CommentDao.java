package com.gift.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.Comment;

@Repository
public class CommentDao extends BaseDao<Comment> {
	// 根据礼品id找到该礼品的所有评论
	public List<Comment> getCommentsByGift_id(int gift_id) {
		String hql = "FROM Comment c WHERE c.gift_id = ? ";
		List<Comment> list = new ArrayList<Comment>();
		list = super.find(hql, new Object[] { gift_id });
		return list;
	}

	// 新增评论
	public void addComment(int gift_id, String user_account, String content) {
		super.save(new Comment(gift_id, user_account, content, new Timestamp(
				new Date().getTime())));
	}
}
