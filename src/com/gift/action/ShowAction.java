package com.gift.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gift.domain.Address;
import com.gift.domain.BigWhoCategory;
import com.gift.domain.Collection;
import com.gift.domain.Comment;
import com.gift.domain.CommentUser;
import com.gift.domain.Gift;
import com.gift.domain.GiftPicture;
import com.gift.domain.Order;
import com.gift.domain.User;
import com.gift.domain.WhoCategory;
import com.gift.service.UserServiceImpl;

public class ShowAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	private String account;
	private int who_id;
	private int id;
	private String word;// 模糊查的搜索字段
	private Collection collection;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getWho_id() {
		return who_id;
	}

	public void setWho_id(int who_id) {
		this.who_id = who_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public Collection getCollection() {
		return collection;
	}

	public void setCollection(Collection collection) {
		this.collection = collection;
	}

	@Autowired
	private UserServiceImpl userServiceImpl;

	// 用户主页面的初始信息
	public String index() {
		Map<BigWhoCategory, List<WhoCategory>> whoMap = new HashMap<BigWhoCategory, List<WhoCategory>>();
		// 送给谁的大类别
		List<BigWhoCategory> bigWhoCategories = userServiceImpl
				.getAllBigWhoCategories();
		List<WhoCategory> whoCategories = new ArrayList<WhoCategory>();
		for (BigWhoCategory bigWhoCategory : bigWhoCategories) {
			// 每个送给谁大类别下对应的小类别
			whoCategories = userServiceImpl
					.getWhoCategoriesByBigCategoryId(bigWhoCategory.getId());
			whoMap.put(bigWhoCategory, whoCategories);
		}
		// 右侧上新礼品图片
		List<Gift> newGifts = userServiceImpl.getGiftBySelling_timeD();
		// 图片轮播的销量排行礼品
		List<Gift> salesGifts = userServiceImpl.getGiftsBySales_numD();
		// 女友礼物
		List<Gift> girlGifts = userServiceImpl.getGiftsByWho_id(1);
		// 男友礼物
		List<Gift> boyGifts = userServiceImpl.getGiftsByWho_id(2);
		request.put("whoMap", whoMap);
		request.put("whoCategories", whoCategories);
		request.put("newGifts", newGifts);
		request.put("salesGifts", salesGifts);
		request.put("girlGifts", girlGifts);
		request.put("boyGifts", boyGifts);
		return "success";
	}

	// 确认订单
	public String confirmOrder() {
		callbackInfo.clear();
		Gift gift = userServiceImpl.getGiftById(id);
		session.put("gift", gift);
		String account = ((User) session.get("loginUser")).getAccount();
		// 地址
		List<Address> addresses = userServiceImpl
				.getAddressesByAccount(account);
		session.put("addresses", addresses);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	// 根据送给谁的id找到礼品列表
	public String search() {
		Map<BigWhoCategory, List<WhoCategory>> whoMap = new HashMap<BigWhoCategory, List<WhoCategory>>();
		// 送给谁的大类别
		List<BigWhoCategory> bigWhoCategories = userServiceImpl
				.getAllBigWhoCategories();
		List<WhoCategory> whoCategories = new ArrayList<WhoCategory>();
		for (BigWhoCategory bigWhoCategory : bigWhoCategories) {
			// 每个送给谁大类别下对应的小类别
			whoCategories = userServiceImpl
					.getWhoCategoriesByBigCategoryId(bigWhoCategory.getId());
			whoMap.put(bigWhoCategory, whoCategories);
		}
		session.put("whoMap", whoMap);
		session.put("whoCategories", whoCategories);
		List<Gift> WhoIdGifts = userServiceImpl.getGiftsByWho_id(who_id);
		session.put("searchList", WhoIdGifts);
		return "search";
	}

	// 模糊查
	public String searchByWord() {
		callbackInfo.clear();
		Map<BigWhoCategory, List<WhoCategory>> whoMap = new HashMap<BigWhoCategory, List<WhoCategory>>();
		// 送给谁的大类别
		List<BigWhoCategory> bigWhoCategories = userServiceImpl
				.getAllBigWhoCategories();
		List<WhoCategory> whoCategories = new ArrayList<WhoCategory>();
		for (BigWhoCategory bigWhoCategory : bigWhoCategories) {
			// 每个送给谁大类别下对应的小类别
			whoCategories = userServiceImpl
					.getWhoCategoriesByBigCategoryId(bigWhoCategory.getId());
			whoMap.put(bigWhoCategory, whoCategories);
		}
		session.put("whoMap", whoMap);
		session.put("whoCategories", whoCategories);
		List<Gift> searchList = userServiceImpl.getGiftsByWord(word);
		session.put("searchList", searchList);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String searchBySales_num() {
		List<Gift> searchList = userServiceImpl.getGiftsByPrice();
		session.put("searchList", searchList);
		return "searchBySales_num";

	}

	public String searchBySales_numD() {
		List<Gift> searchList = userServiceImpl.getGiftsByPriceD();
		session.put("searchList", searchList);
		return "searchBySales_numD";
	}

	public String searchByPrice() {
		List<Gift> searchList = userServiceImpl.getGiftsByPrice();
		session.put("searchList", searchList);
		return "searchByPrice";
	}

	public String searchByPriceD() {
		List<Gift> searchList = userServiceImpl.getGiftsByPriceD();
		session.put("searchList", searchList);
		return "searchByPriceD";
	}

	public String searchBySelling_time() {
		List<Gift> searchList = userServiceImpl.getGiftsBySelling_time();
		session.put("searchList", searchList);
		return "searchBySelling_time";
	}

	public String searchBySelling_timeD() {
		List<Gift> searchList = userServiceImpl.getGiftsBySelling_timeD();
		session.put("searchList", searchList);
		return "searchBySelling_timeD";
	}

	// 礼品详情信息
	public String giftDetail() {
		Gift gift = userServiceImpl.getGiftById(id);
		request.put("gift", gift);
		List<GiftPicture> giftPictures = userServiceImpl
				.getGiftPicturesByGift_id(id);
		Gift gift2 = userServiceImpl.getGiftById(id);

		request.put("giftPictures", giftPictures);
		List<Comment> comments = userServiceImpl.getCommentsByGift_id(id);
		List<CommentUser> commentUsers = new ArrayList<CommentUser>();
		for (Comment comment : comments) {
			User user = userServiceImpl.findUserByAccount(comment
					.getUser_account());
			CommentUser commentUser = new CommentUser(comment.getGift_id(),
					comment.getUser_account(), comment.getContent(),
					comment.getTime(), user.getHead(), user.getName());
			commentUsers.add(commentUser);
		}
		request.put("commentUsers", commentUsers);
		List<Collection> collectionsByAccount = userServiceImpl
				.getCollectionsByAccount(account);
		for (Collection collection : collectionsByAccount) {
			System.out.println(collection.getId());
			if (collection.getGift_id() == id) {
				request.put("collection", collection);
			}
		}
		return "giftDetail";
	}

	// 根据帐号找到该帐号的收藏礼品列表
	public String collections() {
		String account = ((User) session.get("loginUser")).getAccount();
		List<Collection> collections = userServiceImpl
				.getCollectionsByAccount(account);
		List<Gift> collectGifts = new ArrayList<Gift>();
		for (Collection collection : collections) {
			Gift gift = userServiceImpl.getGiftById(collection.getGift_id());
			collectGifts.add(gift);
		}
		request.put("collections", collections);
		request.put("collectGifts", collectGifts);
		return "collections";
	}

	// 根据帐号找到该帐号的订单
	public String orders() {
		String account = ((User) session.get("loginUser")).getAccount();
		List<Order> orders = userServiceImpl.getOrdersByAccount(account);
		List<Address> orderAddresses = new ArrayList<Address>();
		List<Gift> orderGifts = new ArrayList<Gift>();
		for (Order order : orders) {
			orderAddresses.add(userServiceImpl.getAddressById(order
					.getAddress_id()));
			orderGifts.add(userServiceImpl.getGiftById(order.getGift_id()));
		}
		request.put("orders", orders);
		request.put("orderAddresses", orderAddresses);
		request.put("orderGifts", orderGifts);
		return "orders";
	}

	// 根据帐号找到所有地址
	public String selfInfo() {
		String account = ((User) session.get("loginUser")).getAccount();
		// 地址
		List<Address> addresses = userServiceImpl
				.getAddressesByAccount(account);
		request.put("addresses", addresses);
		return "selfInfo";
	}

	// 管理员主页面内容
	public String admin() {
		Map<BigWhoCategory, List<WhoCategory>> whoMap = new HashMap<BigWhoCategory, List<WhoCategory>>();
		// 送给谁的大类别
		List<BigWhoCategory> bigWhoCategories = userServiceImpl
				.getAllBigWhoCategories();
		List<WhoCategory> whoCategories = new ArrayList<WhoCategory>();
		for (BigWhoCategory bigWhoCategory : bigWhoCategories) {
			// 每个送给谁大类别下对应的小类别
			whoCategories = userServiceImpl
					.getWhoCategoriesByBigCategoryId(bigWhoCategory.getId());
			whoMap.put(bigWhoCategory, whoCategories);
		}
		session.put("whoMap", whoMap);
		session.put("whoCategories", whoCategories);
		List<Order> orders = userServiceImpl.getOrdersByTime();
		List<Address> orderAddresses = new ArrayList<Address>();
		List<Gift> orderGifts = new ArrayList<Gift>();
		for (Order order : orders) {
			Address address = userServiceImpl.getAddressById(order
					.getAddress_id());
			orderAddresses.add(address);
			Gift gift = userServiceImpl.getGiftById(order.getGift_id());
			System.out.println(gift.getName());
			orderGifts.add(gift);
		}
		request.put("orders", orders);
		request.put("orderAddresses", orderAddresses);
		request.put("orderGifts", orderGifts);
		return "admin";
	}

	// 后台所有礼品信息
	public String gifts() {
		callbackInfo.clear();
		List<Gift> giftList = new ArrayList<Gift>();
		giftList = userServiceImpl.getGiftBySelling_timeD();
		request.put("giftList", giftList);
		callbackInfo.put("info", "ok");
		return "gifts";
	}

	// 后台所有用户信息
	public String users() {
		callbackInfo.clear();
		List<User> users = userServiceImpl.getAllUsers();
		request.put("users", users);
		callbackInfo.put("info", "ok");
		return "users";
	}

	public String adminOrders() {
		List<Order> orders = userServiceImpl.getOrdersByAccount(account);
		List<Address> orderAddresses = new ArrayList<Address>();
		List<Gift> orderGifts = new ArrayList<Gift>();
		for (Order order : orders) {
			orderAddresses.add(userServiceImpl.getAddressById(order
					.getAddress_id()));
			orderGifts.add(userServiceImpl.getGiftById(order.getGift_id()));
		}
		request.put("orders", orders);
		request.put("orderAddresses", orderAddresses);
		request.put("orderGifts", orderGifts);
		return "adminOrders";
	}

	public String updateGift() {
		Gift gift = userServiceImpl.getGiftById(id);
		request.put("gift", gift);
		return "updateGift";
	}

}
