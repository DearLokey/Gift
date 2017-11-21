package com.gift.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gift.domain.Address;
import com.gift.domain.Comment;
import com.gift.domain.Gift;
import com.gift.domain.Order;
import com.gift.domain.User;
import com.gift.domain.WhoCategory;
import com.gift.service.UserServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class TestService {

	@Autowired
	private UserServiceImpl userServiceImpl;

	/* adress表的测试开始 */
	// @Test
	// public void testGetAllAddressByAccount() {
	// List<Address> list = userServiceImpl
	// .getAddressesByAccount("123@qq.com");
	// for (Address address : list) {
	// System.out.println(address.getAddress());
	// }
	// }

	// @Test
	// public void testAddAddress() {
	// userServiceImpl.addAddress(new Address("111", "江苏南京"));
	// }
	/* adress表的测试结束 */

	/* user表的测试开始 */
	// @Test
	// public void testFindUserByAccount() {
	// User user = userServiceImpl.findUserByAccount("111");
	// System.out.println(user.getIsAdmin());
	// }
	/* user表的测试结束 */

	/* gift表的测试开始 */
	// @Test
	// public void testAddGift() {
	// userServiceImpl.addGift(new Gift(1, 1, "手链", 158.2, "handGift.jpg",
	// 100, 20, 20, new Timestamp(new Date().getTime()), "送女友的最佳选择"));
	// }

	// @Test
	// public void testGetAllGifts() {
	// List<Gift> list = userServiceImpl.getAllGifts();
	// for (Gift gift : list) {
	// System.out.println(gift.getName());
	// }
	// }

	// @Test
	// public void testGetGiftsBySelling_time() {
	// List<Gift> list = userServiceImpl.getGiftsBySelling_time();
	// for (Gift gift : list) {
	// System.out.println(gift.getName());
	// }
	// }

	// @Test
	// public void testUpdateGift() {
	// Gift gift = userServiceImpl.getGiftById(1);
	// gift.setPrice(131.4);
	// userServiceImpl.updateGift(gift);
	// }

	/* gift表的测试结束 */
	/* whoCategory表的测试开始 */
	// @Test
	// public void testGetWhoCategoriesByBigWhoCategoryId() {
	// List<WhoCategory> list = userServiceImpl
	// .getWhoCategoriesByBigCategoryId(1);
	// for (WhoCategory whoCategory : list) {
	// System.out.println(whoCategory.getName());
	// }
	// }

	/* whoCategory表的测试结束 */

	/* Order表的测试开始 */
	// @Test
	// public void testGetOrdersByTime() {
	// List<Order> orders = userServiceImpl.getOrdersByTime();
	// for (Order order : orders) {
	// System.out.println(order.getOrder_num());
	// }
	// }

	// @Test
	// public void testGetOrdersByAccount() {
	// List<Order> list = userServiceImpl.getOrdersByAccount("123@qq.com");
	// for (Order order : list) {
	// System.out.println(order.getOrder_num());
	// }
	// }

	// @Test
	// public void testGetOrderById() {
	// Order order = userServiceImpl.getOrderById(1);
	// System.out.println(order.getOrder_num());
	// }

	// @Test
	// public void testDeleteOrder() {
	// userServiceImpl.deleteOrder(userServiceImpl.getOrderById(1));
	// }

	/* Order表的测试结束 */

	/* Comment表的测试开始 */
	// @Test
	// public void testGetCommentsByGift_id() {
	// List<Comment> list = userServiceImpl.getCommentsByGift_id(1);
	// for (Comment comment : list) {
	// System.out.println(comment.getContent());
	// }
	// }

	/* Comment表的测试结束 */

}
