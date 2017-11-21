<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/giftdetail.css" rel="stylesheet" />
<script src="js/searchByWord.js" type="text/javascript"></script>
<title>礼品详情页面</title>
</head>
<script type="text/javascript">
	function setTab(m, n) {
		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");
		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");
		for (i = 0; i < tli.length; i++) {
			tli[i].className = i == n ? "hover" : "";
			mli[i].style.display = i == n ? "block" : "none";
		}
	}
	$(function() {
		$("#buy_btn").click(function() {
			if ($(".navbar-brand").text() == "") {
				alert("请先登录");
				window.location.href = "login.html";
			} else {
				$.ajax({
					url : "show_confirmOrder.do",
					data : {
						"id" : $(this).next().val()
					},
					success : function(data) {
						if (data.info == "ok") {
							window.location.href = "confirmOrder.jsp";
						}
					}
				})
			}
		})
		$("#collect1").click(function() {
			if ($(".navbar-brand").text() == "") {
				alert("请先登录");
				window.location.href = "login.html";
			} else {
				$.ajax({
					url : "do_addCollection.do",
					type : "post",
					data : {
						"collection.user_account" : $(".navbar-brand").text(),
						"collection.gift_id" : $("#gift_id").val(),
					},
					success : function(data) {
						if (data.info == "ok") {
							alert("收藏成功");
							location.reload(true);
						}
					}
				});
			}
		});

		$("#collect2").click(function() {
			$.ajax({
				url : "do_deleteCollection.do",
				type : "post",
				data : {
					"id" : $("#collection_id").val()

				},
				success : function(data) {
					alert("取消收藏成功")
					location.reload(true);
				}
			});
		});
	})
</script>
<link rel="icon" href="icon/logo.png">
<body style="background: url(img/back.jpg)">
	<!-- 导航栏开始 -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<s:if test="#session.loginUser!=null">
					<li><a class="navbar-brand" href="show_selfInfo.do"><s:property
								value="#session.loginUser.account" /> </a></li>
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
		<!-- 礼品详情信息 -->
		<div class="row" style="margin-top: 40px;">
			<div class="col-md-1"></div>
			<div class="col-md-10"
				style="background-color: #fff; border: 1px solid #ccc; padding-bottom: 50px;">
				<hr />
				<div class="col-md-8" style="padding-top: 10px">
					<div style="margin-left: 60px;">
						<img src="jsp/<s:property value="#request.gift.picture" />" /> <input
							type="hidden" id="gift_id"
							value="<s:property value='#request.gift.id'/>" />
					</div>
				</div>
				<div class="col-md-4">
					<h2 style="font-family: '楷体'; font-weight: bold">
						<s:property value="#request.gift.name" />
						<input type="hidden" id="collection_id"
							value="<s:property value='#request.collection.id'/>" />
						<s:if test="#request.collection!=null">
							<input type="image" src="icon/collected.png" id="collect2" />
						</s:if>
						<s:else>
							<input type="image" src="icon/collect.png" id="collect1" />
						</s:else>
					</h2>
					<h4 style="font-family: '楷体'; font-weight: bold; color: green;">
						<s:property value="#request.gift.introduction" />
					</h4>
					<hr />
					<h5 style="font-weight: bold;">
						<div class="input-group">
							<div class="input-group-addon">￥</div>
							<input type="text" class="form-control"
								placeholder="<s:property value="#request.gift.price" />"
								readonly>
						</div>
					</h5>
					<h5>
						<div class="input-group">
							<div class="input-group-addon">销量：</div>
							<input type="text" class="form-control"
								placeholder="<s:property value="#request.gift.sales_num" />"
								readonly>
						</div>
					</h5>
					<h5>
						<div class="input-group">
							<div class="input-group-addon">库存：</div>
							<input type="text" class="form-control"
								placeholder="<s:property value="#request.gift.stock_num" />"
								readonly>
						</div>
					</h5>
					<hr />
					<button type="button" class="btn btn-danger" id="buy_btn">立即购买</button>
					<input type="hidden"
						value="<s:property value="#request.gift.id" />">
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row" style="margin-top: 40px;">
			<div class="col-md-1"></div>
			<div class="col-md-10" style="background-color: #fff;">
				<div class="menu1box" style="margin-left: -40px">
					<ul id="menu1">
						<li class="hover" onclick="setTab(1,0)">商品详情</li>
						<li onclick="setTab(1,1)">用户口碑</li>
					</ul>
				</div>
				<div class="main1box">
					<div class="main" id="main1">
						<ul class="block">
							<s:iterator value="#request.giftPictures" var="giftPicture">
								<li style="padding-left: 30px;"><img
									src="jsp/<s:property value='picture' />" /></li>
							</s:iterator>
						</ul>
						<ul>
							<li>
								<hr /> <s:iterator value="#request.commentUsers">
									<div class="media">
										<div class="media-left media-middle">
											<a href=""> <img class="media-object"
												src="img/<s:property value='head' />" width="100px"
												height="100px" />

											</a>
											<p style="padding-left: 20px;">
												<s:property value='name' />
											</p>
										</div>
										<div class="media-body">
											<p>
												<s:property value="content" />
											</p>
											<p>
												<s:property value="time" />
											</p>
										</div>
									</div>
								</s:iterator>
								<hr />
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<!-- 礼品详情信息 -->
	</div>
</body>
</html>