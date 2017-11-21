package com.gift.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.gift.domain.Address;
import com.gift.domain.Collection;
import com.gift.domain.Comment;
import com.gift.domain.Gift;
import com.gift.domain.GiftPicture;
import com.gift.domain.Order;
import com.gift.domain.User;
import com.gift.domain.WhoCategory;
import com.gift.service.UserServiceImpl;
import com.opensymphony.xwork2.ActionContext;

public class DoAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserServiceImpl userServiceImpl;
	private Collection collection;
	private Order order;
	private Address address;
	private User user;
	private Comment comment;
	private Gift gift;
	private WhoCategory whoCategory;
	private int id;
	private File image;// 上传的文件
	private String imageFileName;// 上传的文件名
	private String imageContentType;// 文件类型

	public Collection getCollection() {
		return collection;
	}

	public void setCollection(Collection collection) {
		this.collection = collection;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Gift getGift() {
		return gift;
	}

	public void setGift(Gift gift) {
		this.gift = gift;
	}

	public WhoCategory getWhoCategory() {
		return whoCategory;
	}

	public void setWhoCategory(WhoCategory whoCategory) {
		this.whoCategory = whoCategory;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String updateUser() throws IOException {
		System.out.println("修改个人信息");
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/img");
		System.out.println("realPath" + realPath);
		if (image != null) {
			System.out.println("begin to copy file");
			imageFileName = new Date().getTime() + ".png";
			System.out.println("*******" + imageFileName);
			File saveFile = new File(realPath, imageFileName);
			if (!saveFile.getParentFile().exists()) {
				saveFile.getParentFile().mkdirs();
			}
			FileUtils.copyFile(image, saveFile);
			user.setHead(imageFileName);
		}
		userServiceImpl.updateUser(user);
		session.put("loginUser", user);
		return "updateUser";
	}
	public String updatePassword() {
		callbackInfo.clear();
		userServiceImpl.updateUser(user);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String addCollection() {
		callbackInfo.clear();
		List<Collection> collections = userServiceImpl
				.getCollectionsByAccount(collection.getUser_account());
		collection.setCollect_time(new Timestamp(new Date().getTime()));
		userServiceImpl.addCollection(collection);
		if (collections.contains(userServiceImpl.getGiftById(collection
				.getGift_id()))) {
			System.out.println("该收藏已存在");
		} else {
			collections.add(collection);
		}
		request.put("collections", collections);
		request.put("collection", collection);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String deleteCollection() {
		userServiceImpl.deleteCollection(userServiceImpl.getCollectionById(id));
		return "deleteCollection";
	}

	public String addOrder() {
		callbackInfo.clear();
		System.out.println(order.getUser_account());
		userServiceImpl.addOrder(order);
		Gift gift = userServiceImpl.getGiftById(order.getGift_id());
		gift.setStock_num(gift.getStock_num() - 1);
		gift.setSales_num(gift.getSales_num() + 1);
		userServiceImpl.updateGift(gift);
		callbackInfo.put("info", "ok");
		return "addOrder";
	}

	public String deleteOrder() {
		userServiceImpl.deleteOrder(userServiceImpl.getOrderById(id));
		return "deleteOrder";
	}

	public String orderState() {
		callbackInfo.clear();
		Order order = userServiceImpl.getOrderById(id);
		order.setOrder_state("待评价");
		userServiceImpl.updateOrder(order);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String adminOrderState() {
		callbackInfo.clear();
		Order order = userServiceImpl.getOrderById(id);
		order.setOrder_state("待收货");
		userServiceImpl.updateOrder(order);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String addAddress() {
		callbackInfo.clear();
		System.out.println(address.getUser_account());
		userServiceImpl.addAddress(address);
		callbackInfo.put("info", "ok");
		return "callback";
	}

	public String deleteAddress() {
		userServiceImpl.deleteAddress(userServiceImpl.getAddressById(id));
		return "deleteAddress";
	}

	public String addComment() {
		callbackInfo.clear();
		System.out.println(comment.getUser_account());
		userServiceImpl.addComment(comment.getGift_id(),
				comment.getUser_account(), comment.getContent());
		Order order = userServiceImpl.getOrderById(id);
		order.setOrder_state("已评价");
		userServiceImpl.updateOrder(order);
		Gift gift = userServiceImpl.getGiftById(comment.getGift_id());
		gift.setEvaluation_num(gift.getEvaluation_num() + 1);
		userServiceImpl.updateGift(gift);
		callbackInfo.put("info", "ok");
		return "addComment";
	}

	public String deleteGift() {
		userServiceImpl.deleteGift(userServiceImpl.getGiftById(id));
		List<GiftPicture> giftPictures = userServiceImpl
				.getGiftPicturesByGift_id(id);
		for (GiftPicture giftPicture : giftPictures) {
			userServiceImpl.deleteGiftPicture(giftPicture);
		}
		List<Comment> comments = userServiceImpl.getCommentsByGift_id(id);
		for (Comment comment : comments) {
			userServiceImpl.deleteComment(comment);
		}
		return "deleteGift";
	}

	@SuppressWarnings({ "unchecked", "null" })
	public String addGift() throws IOException {
		callbackInfo.clear();
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/jsp/giftPictures");
		System.out.println("realPath" + realPath);
		System.out.println(image);
		if (image != null) {
			System.out.println("begin to copy file");
			imageFileName = new Date().getTime() + ".png";
			File saveFile = new File(realPath, imageFileName);
			if (!saveFile.getParentFile().exists()) {
				saveFile.getParentFile().mkdirs();
			}
			FileUtil.copyFile(image, saveFile);
			gift.setPicture(imageFileName);
		}
		userServiceImpl.addGift(gift.getWho_id(), gift.getName(),
				gift.getPrice(), "giftPictures/" + gift.getPicture(),
				gift.getStock_num(), gift.getIntroduction());
		List<Gift> giftList = userServiceImpl
				.getGiftsByWho_id(gift.getWho_id());
		Gift gift1 = giftList.get(giftList.size() - 1);
		List<String> list = null;
		ActionContext act = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) act
				.get(ServletActionContext.HTTP_REQUEST);
		list = (List<String>) request.getSession().getAttribute("picPathList");
		System.out.println("要传的照片数量：" + list.size());
		for (int i = 0, len = list.size(); i < len; i++) {
			System.out.println(list.get(i));
			GiftPicture giftPicture = new GiftPicture();
			giftPicture.setGift_id(gift1.getId());
			giftPicture.setPicture(list.get(i));
			userServiceImpl.addGiftPicture(giftPicture);
		}
		list.removeAll(list);
		callbackInfo.put("info", "ok");
		return "addGift";
	}

	public String updateGiftInfo() {
		userServiceImpl.updateGift(gift);
		return "updateGift";
	}

	public String addCategory() {
		userServiceImpl.addWhoCategory(whoCategory);
		return "addCategory";
	}
}
