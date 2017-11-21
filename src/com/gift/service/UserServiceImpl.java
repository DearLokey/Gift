package com.gift.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sun.net.www.content.image.gif;

import com.gift.dao.AddressDao;
import com.gift.dao.BigWhoCategoryDao;
import com.gift.dao.CollectionDao;
import com.gift.dao.CommentDao;
import com.gift.dao.GiftDao;
import com.gift.dao.GiftPictureDao;
import com.gift.dao.OrderDao;
import com.gift.dao.UserDao;
import com.gift.dao.WhoCategoryDao;
import com.gift.domain.Address;
import com.gift.domain.BigWhoCategory;
import com.gift.domain.Collection;
import com.gift.domain.Comment;
import com.gift.domain.Gift;
import com.gift.domain.GiftPicture;
import com.gift.domain.Order;
import com.gift.domain.User;
import com.gift.domain.WhoCategory;

@Transactional
@Service("userServiceImpl")
public class UserServiceImpl {
	@Autowired
	private AddressDao addressDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private GiftDao giftDao;
	@Autowired
	private GiftPictureDao giftPictureDao;
	@Autowired
	private BigWhoCategoryDao bigWhoCategoryDao;
	@Autowired
	private WhoCategoryDao whoCategoryDao;
	@Autowired
	private CollectionDao collectionDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CommentDao commentDao;

	/* 地址Address方法开始 */
	// 根据用户的帐号找到地址
	public List<Address> getAddressesByAccount(String account) {
		return addressDao.getAddressesByAccount(account);
	}

	// 根据id查找具体的地址信息
	public Address getAddressById(int id) {
		return addressDao.get(id);
	}

	// 增加一条地址
	public void addAddress(Address address) {
		addressDao.save(address);

	}

	// 删除一条地址
	public void deleteAddress(Address address) {
		addressDao.delete(address);
	}

	// 更新一条地址
	public void updateAddress(Address address) {
		addressDao.update(address);
	}

	/* 地址Address方法结束 */

	/* 用户User方法开始 */
	// 注册型用户
	public void registNewUser(String account, String password) {
		userDao.addUser(account, password);
	}

	// 用户登录
	public boolean loginUser(String name, String pass) {
		User user = userDao.findUserByAccount(name);
		if (user != null) {
			if (user.getPassword().equals(pass)) {
				return true;
			} else {
				return false;
			}

		}
		return false;
	}

	// 根据帐号找打用户信息
	public User findUserByAccount(String account) {
		return userDao.findUserByAccount(account);
	}

	// 修改用户信息
	public void updateUser(User user) {
		userDao.update(user);
	}

	public List<User> getAllUsers() {
		return userDao.loadAll();
	}

	/* 用户User方法结束 */

	/* 用户Gift方法开始 */
	// 增加一条礼品信息
	// 新增礼品
	public void addGift(int who_id, String name, double price, String picture,
			int stock_num, String introduction) {
		giftDao.addGift(who_id, name, price, picture, stock_num, introduction);
	}

	// 删除一条礼品信息
	public void deleteGift(Gift gift) {
		giftDao.delete(gift);
	}

	// 修改一条礼品信息
	public void updateGift(Gift gift) {
		giftDao.update(gift);
	}

	// 根据礼品id找到礼品信息
	public Gift getGiftById(int id) {
		return giftDao.get(id);
	}

	// 根据送给谁的id找到该类别下的礼品列表
	public List<Gift> getGiftsByWho_id(int who_id) {
		return giftDao.getGiftsByWho_id(who_id);
	}

	// 模糊查
	public List<Gift> getGiftsByWord(String word) {
		return giftDao.getGiftsByWord(word);
	}

	// 根据礼品上架时间排序
	public List<Gift> getGiftsBySelling_time() {
		return giftDao.getGiftsBySelling_time();
	}

	public List<Gift> getGiftsBySelling_timeD() {
		return giftDao.getGiftBySelling_timeD();
	}

	// 根据销量排序 升序
	public List<Gift> getGiftsBySales_num() {
		return giftDao.getGiftsBySales_num();
	}

	// 根据销量排序 降序
	public List<Gift> getGiftsBySales_numD() {
		return giftDao.getGiftsBySales_numD();
	}

	// 根据价格升序排序
	public List<Gift> getGiftsByPrice() {
		return giftDao.getGiftsByPrice();
	}

	// 根据价格降序排序
	public List<Gift> getGiftsByPriceD() {
		return giftDao.getGiftsByPriceD();
	}

	// 根据时间排序升序
	public List<Gift> getGiftBySelling_time() {
		return giftDao.getGiftBySelling_time();
	}

	// 根据时间排序降序
	public List<Gift> getGiftBySelling_timeD() {
		return giftDao.getGiftBySelling_timeD();
	}

	public Gift getGiftBySelling_time(Timestamp timestamp) {
		return giftDao.getGiftBySelling_time(timestamp);
	}

	/* 用户Gift方法结束 */
	/* 礼品详情GiftDetail方法开始 */
	// 根据礼品的id找打礼品详情图片
	public List<GiftPicture> getGiftPicturesByGift_id(int gift_id) {
		return giftPictureDao.getGiftPicturesByGift_id(gift_id);
	}

	public void addGiftPicture(GiftPicture giftPicture) {
		giftPictureDao.save(giftPicture);
	}

	public void deleteGiftPicture(GiftPicture giftPicture) {
		giftPictureDao.delete(giftPicture);
	}

	/* 礼品详情GiftDetail方法结束 */
	/* 送给谁BigWhoCategory方法开始 */
	// 找到所有送给谁的大类别信息
	public List<BigWhoCategory> getAllBigWhoCategories() {
		return bigWhoCategoryDao.loadAll();
	}

	/* 送给谁BigWhoCategory方法结束 */

	/* 送给谁WhoCategory方法开始 */
	// 根据送给谁的大类别的id找到该类别下的小类别
	public List<WhoCategory> getWhoCategoriesByBigCategoryId(int bigwho_id) {
		return whoCategoryDao.getWhoCategoriesByBigCategoryId(bigwho_id);
	}

	public void addWhoCategory(WhoCategory whoCategory) {
		whoCategoryDao.save(whoCategory);
	}

	/* 送给谁WhoCategory方法结束 */

	/* Collection方法开始 */
	// 增加一条收藏
	public void addCollection(Collection collection) {
		collectionDao.save(collection);
	}

	// 根据帐号找到所有收藏
	public List<Collection> getCollectionsByAccount(String account) {
		return collectionDao.getCollectionsByAccount(account);
	}

	// 根据收藏的id找到收藏信息
	public Collection getCollectionById(int id) {
		return collectionDao.get(id);
	}

	// 删除一条收藏信息
	public void deleteCollection(Collection collection) {
		collectionDao.delete(collection);
	}

	// 根据礼品的id找到该礼品的收藏列表
	public List<Collection> getCollectionsByGift_id(int gift_id) {
		return collectionDao.getCollectionsByGift_id(gift_id);
	}

	/* Collection方法结束 */

	/* Order方法开始 */
	// 新增订单
	// 新增订单
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	// 修改订单状态
	public void updateOrder(Order order) {
		orderDao.update(order);
	}

	// 根据订单生成时间对订单排序
	public List<Order> getOrdersByTime() {
		return orderDao.getOrdersByTime();
	}

	// 根据帐号找到所有订单
	public List<Order> getOrdersByAccount(String user_account) {
		return orderDao.getOrdersByAccount(user_account);
	}

	public Order getOrderById(int id) {
		return orderDao.get(id);
	}

	public void deleteOrder(Order order) {
		orderDao.delete(order);
	}

	/* Order方法结束 */

	/* Comment方法开始 */
	// 根据礼品id找到该礼品的所有评论
	public List<Comment> getCommentsByGift_id(int gift_id) {
		return commentDao.getCommentsByGift_id(gift_id);
	}

	// 新增评论
	public void addComment(int gift_id, String user_account, String content) {
		commentDao.addComment(gift_id, user_account, content);
	}

	public void deleteComment(Comment comment) {
		commentDao.delete(comment);
	}
	/* Comment方法结束 */
}
