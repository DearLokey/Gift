<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>礼品收藏</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/searchByWord.js" type="text/javascript"></script>
</head>
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
		<div class="row"
			style="margin-top: 40px; margin-bottom: 60px; padding-left: 60px; padding-right: 60px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div style="background: white; border-radius: 10px; padding: 10px">
					<table>
						<thead>
							<tr>
								<th>礼品图片</th>
								<th>名称</th>
								<th>收藏时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.collectGifts" var="collectGift"
								status="st">
								<tr>
									<td class="user-name"><a
										href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><img
											src="jsp/<s:property value='picture'/>"
											width="100px" height="100px" /></a></td>
									<td class="user-email"><a
										href="show_giftDetail.do?id=<s:property value='id'/>"><s:property
												value="name" /></a></td>
									<td class="user-phone"><s:property
											value="#request.collections[#st.index].collect_time" /></td>
									<td class="user-mobile"><a
										href="do_deleteCollection.do?id=<s:property value='#request.collections[#st.index].id' />"
										id="deleteCollection">删除</a> <input type="hidden"
										value="<s:property value="#request.collections[#st.index].id" />" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div
			style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">
		</div>
</body>
</html>