package com.gift.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gift.domain.GiftPicture;

@Repository
public class GiftPictureDao extends BaseDao<GiftPicture> {
	// 根据礼品的id找打礼品详情图片
	public List<GiftPicture> getGiftPicturesByGift_id(int gift_id) {
		String hql = "FROM GiftPicture g WHERE g.gift_id = ? ";
		List<GiftPicture> list = new ArrayList<GiftPicture>();
		list = super.find(hql, new Object[] { gift_id });
		return list;
	}
	
}
