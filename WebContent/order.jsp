<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单页面</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/searchByWord.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#changeOrder_state").click(function() {
			if ($("#payPassword").val() == $("#password").val()) {
				$.ajax({
					url : "do_orderState.do",
					type : "post",
					data : {
						"id" : $("#order_id").text()
					},
					success : function(data) {
						if (data.info == "ok") {
							alert("收货成功");
							location.reload(true);
						}
					}
				});
			} else {
				alert("密码错误");
			}
		})
	})
</script>
</head>
<link rel="icon" href="icon/logo.png">
<body style="background: url(img/back.jpg)">
	<input type="hidden" id="password"
		value="<s:property
								value="#session.loginUser.password" />" />
	<!-- 导航栏开始 -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<s:if test="#session.loginUser!=null">
					<li><a class="navbar-brand" href="show_selfInfo.do"
						id="account"><s:property value="#session.loginUser.account" />
					</a></li>
					<li><a href="user_logOff.do"><img src="icon/log_out.png" />&nbsp;注销</a></li>
					<li><a href="show_collections.do"><img
							src="icon/collection.png" />&nbsp;收藏</a></li>
					<li><a href="show_orders.do"><img src="icon/order.png" />我的订单</a></li>
					<li><a href="show_selfInfo.do"><img
							src="icon/self_info.png" />个人中心</a></li>
				</s:if>
				<s:else>
					<li><a href="login.html"><img src="icon/login.png" />&nbsp;登录</a></li>
					<li><a href="regist.html"><img src="icon/regist.png" />&nbsp;注册</a></li>
				</s:else>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 导航栏结束 -->
	<div class="container-fluid">
		<!-- 头部logo和搜索框区 -->
		<div class="row"
			style="margin-top: -20px; padding-left: 60px; padding-right: 60px; border-bottom: solid 2px green">
			<div class="col-md-3">
				<a href="show_index.do"><img src="icon/logo.png" /></a> <span
					style="font-size: 26px; color: orange">Dear Me</span>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-6">
				<br /> <br />
				<div class="col-lg-6">
					<div class="input-group">
						<input id="content" type="text" class="form-control"> <span
							class="input-group-btn">
							<button id="search" class="btn btn-success" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 头部logo和搜索框区 -->
		<div class="row"
			style="margin-top: 40px; margin-bottom: 60px; padding-left: 60px; padding-right: 60px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div style="background: white; border-radius: 10px; padding: 10px">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">全部订单</a></li>
						<li role="presentation"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab">待发货</a></li>
						<li role="presentation"><a href="#messages"
							aria-controls="messages" role="tab" data-toggle="tab">待收货</a></li>
						<li role="presentation"><a href="#settings"
							aria-controls="settings" role="tab" data-toggle="tab">待评价</a></li>
					</ul>
					<br />
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th>礼品图片</th>
										<th>订单地址</th>
										<th>订单时间</th>
										<th>订单操作</th>
										<th>订单状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#request.orders" var="order" status="status">
										<tr>
											<td class="user-name"><s:property value="id" /></td>
											<td class="user_name"><a
												href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
													src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
													width="100px" height="100px" /></a></td>
											<td class="user_name"><s:property
													value="#request.orderAddresses[#status.index].address" /><input
												type="hidden" id="address_id"
												value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
											<td class="user-name"><s:property value="order_time" /></td>
											<td><a
												href="do_deleteOrder.do?id=<s:property value="id" />">删除</a></td>
											<td><s:property value="order_state" /></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="profile">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th>礼品图片</th>
										<th>订单地址</th>
										<th>订单时间</th>
										<th>订单操作</th>
										<th>订单状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#request.orders" var="order" status="status">
										<s:if test="#order.order_state =='待发货'">
											<tr>
												<td class="user-name"><s:property value="id" /></td>
												<td class="user_name"><a
													href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
														src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
														width="100px" height="100px" /></a></td>
												<td class="user_name"><s:property
														value="#request.orderAddresses[#status.index].address" /><input
													type="hidden" id="address_id"
													value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
												<td class="user-name"><s:property value="order_time" /></td>
												<td><a
													href="do_deleteOrder.do?id=<s:property value="id" />">删除</a></td>
												<td><s:property value="order_state" /></td>
											</tr>
										</s:if>
									</s:iterator>
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="messages">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th>礼品图片</th>
										<th>订单地址</th>
										<th>订单时间</th>
										<th>订单操作</th>
										<th>订单状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#request.orders" var="order" status="status">
										<s:if test="#order.order_state =='待收货'">
											<tr>
												<td class="user-name" id="order_id"><s:property
														value="id" /></td>
												<td class="user_name"><a
													href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
														src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
														width="100px" height="100px" /></a></td>
												<td class="user_name"><s:property
														value="#request.orderAddresses[#status.index].address" /><input
													type="hidden" id="address_id"
													value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
												<td class="user-name"><s:property value="order_time" /></td>
												<td><a
													href="do_deleteOrder.do?id=<s:property value="id" />">删除</a></td>
												<td><button type="button" class="btn btn-default"
														data-toggle="modal" data-target="#myModal1">
														<s:property value="order_state" />
													</button></td>
												<div class="modal fade" id="myModal1" tabindex="-1"
													role="dialog" aria-labelledby="myModalLabel">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h4 class="modal-title" id="myModalLabel">收货弹框</h4>
															</div>
															<div class="modal-body">
																<form>
																	<div class="form-group">
																		<label for="recipient-name" class="control-label">支付密码:</label>
																		<input type="password" class="form-control"
																			id="payPassword">
																	</div>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
																<button type="button" class="btn btn-primary"
																	id="changeOrder_state">确认收货</button>
															</div>
														</div>
													</div>
												</div>
												<!--支付密码弹框  -->
											</tr>
										</s:if>
									</s:iterator>
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="settings">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th>礼品图片</th>
										<th>订单地址</th>
										<th>订单时间</th>
										<th>订单操作</th>
										<th>订单状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#request.orders" var="order" status="status">
										<s:if test="#order.order_state =='待评价'">
											<tr>
												<td class="user-name" id="order_id"><s:property
														value="id" /></td>
												<td class="user_name"><a
													href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
														src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
														width="100px" height="100px" /></a></td>
												<td class="user_name"><s:property
														value="#request.orderAddresses[#status.index].address" /><input
													type="hidden" id="address_id"
													value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
												<td class="user-name"><s:property value="order_time" /></td>
												<td><a
													href="do_deleteOrder.do?id=<s:property value="id" />">删除</a></td>
												<td><button type="button" class="btn btn-default"
														data-toggle="modal" data-target="#myModalF">
														<s:property value="order_state" />
													</button></td>
												<!-- 模态框 -->
												<div class="modal fade" id="myModalF">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h4 class="modal-title">礼品评价</h4>
															</div>
															<form action="do_addComment.do" method="post"
																enctype="multipart/form-data">
																<div class="modal-body">
																	<input type="hidden"
																		value="<s:property
														value="id" />"
																		name="id" /> <input type="hidden"
																		value="<s:property	value='#session.loginUser.account'/>"
																		name="comment.user_account" />
																	<div class="form-group">
																		<img
																			src="jsp/<s:property
															value="#request.orderGifts[#status.index].picture" />"
																			width="100px" height="100px" /> <input type="hidden"
																			id="gift_id"
																			value="<s:property
								value="#request.orderGifts[#status.index].id" />"
																			name="comment.gift_id"><label
																			for="exampleInputEmail1"><s:property
																				value="#request.orderGifts[#status.index].name" /></label>
																	</div>
																	<div class="form-group">
																		<label for="exampleInputPassword1">评价内容</label>
																		<textarea class="form-control" rows="3"
																			id="commentContent" name="comment.content"></textarea>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">关闭</button>
																		<button type="submit" class="btn btn-primary"
																			id="commentGift">提交</button>
																	</div>
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
												</div>
												<!-- /.modal -->
											</tr>
										</s:if>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>