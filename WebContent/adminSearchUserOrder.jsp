<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户订单</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/green.css" rel="stylesheet">
<script src="js/searchByWord.js" type="text/javascript"></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script type="text/javascript">
	$(function() {
		$("#changeOrder_state").click(function() {
			$.ajax({
				url : "do_adminOrderState.do",
				type : "post",
				data : {
					"id" : $("#order_id").text()
				},
				success : function(data) {
					if (data.info == "ok") {
						location.reload(true);
					}
				}
			});
		})
	})
</script>
</head>
<link rel="icon" href="icon/logo.png">
<body>
	<header> <nav id="nav">
	<ul>
		<li><a href="show_admin.do">后台首页</a></li>
		<li><a href="user_logOff.do" target="_blank">注销</a></li>
	</ul>
	<script src="js/silder.js"></script><!--获取当前页导航 高亮显示标题--> </nav> </header>
	<div class="mainContent">
		<div class="ulist">
			<section> <a href=""> <img
				src="img/<s:property
								value='#session.loginUser.head' />"></a>
			<ul>
				<h2>
					<a href=""><s:property value='#session.loginUser.name' /></a>
				</h2>
			</ul>
			</section>
		</div>
	</div>
	<div class="mainContent2">
		<aside> <section class="topspaceinfo">
		<h1>Dear me</h1>
		<p>找到属于你的礼物，我用小信封寄给你。</p>
		</section> <br />
		<div class="input-group">
			<input id="content" type="text" class="form-control"> <span
				class="input-group-btn">
				<button id="adminSearch" class="btn btn-success" type="button">Go!</button>
			</span>
		</div>
		<br />
		<section class="newpic">
		<h2>
			<button type="button" class="btn btn-warning">订单</button>
		</h2>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="show_admin.do"
				style="font-size: 20px">订单管理</a>
		</p>
		</section> <section class="taglist">
		<h2>
			<button type="button" class="btn btn-warning">礼品</button>
		</h2>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="show_gifts.do"
				style="font-size: 20px">查询礼品</a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="addGift.jsp" style="font-size: 20px">新增礼品</a>
		</p>
		</section> <section class="taglist">
		<h2>
			<button type="button" class="btn btn-warning">用户</button>
		</h2>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="show_users.do"
				style="font-size: 20px">查询用户</a>
		</p>
		</section> <section class="newpic">
		<h2>
			<button type="button" class="btn btn-warning">送给谁</button>
		</h2>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="addCategory.jsp"
				style="font-size: 20px">新增类别</a>
		</p>
		</section></aside>
		<div class="blogitem">
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
									<th>订单帐号</th>
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
												width="100px" height="100px" /></a><input type="hidden"
											id="gift_id"
											value="<s:property
								value="#request.orderGifts[#status.index].id" />"></td>
										<td class="user_name"><s:property
												value="#request.orderAddresses[#status.index].address" /><input
											type="hidden" id="address_id"
											value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
										<td class="user-name"><s:property value="order_time" /></td>
										<td><a href=""><s:property value="user_account" /></a></td>
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
									<th>订单帐号</th>
									<th>订单状态</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="#request.orders" var="order" status="status">
									<s:if test="#order.order_state =='待发货'">
										<tr>
											<td class="user-name" id="order_id"><s:property
													value="id" /></td>
											<td class="user_name"><a
												href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
													src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
													width="100px" height="100px" /></a><input type="hidden"
												id="gift_id"
												value="<s:property
								value="#request.orderGifts[#status.index].id" />"></td>
											<td class="user_name"><s:property
													value="#request.orderAddresses[#status.index].address" /><input
												type="hidden" id="address_id"
												value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
											<td class="user-name"><s:property value="order_time" /></td>
											<td><a href=""><s:property value="user_account" /></a></td>
											<td><button type="button" class="btn btn-default"
													id="changeOrder_state">
													<s:property value="order_state" />
												</button></td>
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
									<th>订单帐号</th>
									<th>订单状态</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="#request.orders" var="order" status="status">
									<s:if test="#order.order_state =='待收货'">
										<tr>
											<td class="user-name"><s:property value="id" /></td>
											<td class="user_name"><a
												href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
													src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
													width="100px" height="100px" /></a><input type="hidden"
												id="gift_id"
												value="<s:property
								value="#request.orderGifts[#status.index].id" />"></td>
											<td class="user_name"><s:property
													value="#request.orderAddresses[#status.index].address" /><input
												type="hidden" id="address_id"
												value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
											<td class="user-name"><s:property value="order_time" /></td>
											<td><a href=""><s:property value="user_account" /></a></td>
											<td><s:property value="order_state" /></td>
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
									<th>订单帐号</th>
									<th>订单状态</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="#request.orders" var="order" status="status">
									<s:if test="#order.order_state =='待评价'">
										<tr>
											<td class="user-name"><s:property value="id" /></td>
											<td class="user_name"><a
												href="show_giftDetail.do?id=<s:property value='#request.orderGifts[#status.index].id'/>"><img
													src="jsp/<s:property
								value="#request.orderGifts[#status.index].picture" />"
													width="100px" height="100px" /></a><input type="hidden"
												id="gift_id"
												value="<s:property
								value="#request.orderGifts[#status.index].id" />"></td>
											<td class="user_name"><s:property
													value="#request.orderAddresses[#status.index].address" /><input
												type="hidden" id="address_id"
												value="<s:property
										value="#request.orderAddresses[#status.index].id" />" /></td>
											<td class="user-name"><s:property value="order_time" /></td>
											<td><a href=""><s:property value="user_account" /></a></td>
											<td><s:property value="order_state" /></td>
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
	<footer>
	<div class="Copyright">
		<ul>
			<a href="/">帮助中心</a>
			<a href="/">系统客服</a>
			<a href="/">投诉中心</a>
			<a href="/">系统协议</a>
		</ul>
		<p>Design by Dear me</p>
	</div>
	</footer>
</body>
</html>