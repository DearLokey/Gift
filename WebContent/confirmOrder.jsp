<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>礼品搜索页面</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/svwp_style.css" rel="stylesheet" type="text/css" />
<script src="js/searchByWord.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script type="text/javascript">
	
</script>
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
		<!-- 订单信息 -->
		<div class="row"
			style="margin-top: 3.5%; padding-left: 60px; padding-right: 60px; backrgound: slideshow/back.jpg">
			<div class="col-md-2"></div>
			<div class="col-md-6"
				style="background: white; border-radius: 10px; padding: 80px">
				<form action="do_addOrder.do" method="post"
					enctype="multipart/form-data">
					<label style="font-size: 24px">请选择地址：</label> <select
						name="order.address_id">
						<s:iterator value="#session.addresses">
							<option select="selected" style="font-size: 12px"
								value="<s:property value='id'/>"><s:property
									value="address" /></option>
						</s:iterator>
					</select> <input type="hidden" id="password"
						value="<s:property
								value="#session.loginUser.password" />" />
					<input type="hidden"
						value="<s:property
								value="#session.loginUser.account" />"
						name="order.user_account" /> <input type="hidden" id="gift_id"
						value="<s:property value='#session.gift.id' />"
						name="order.gift_id" />
					<table>
						<thead>
							<tr>
								<th>礼品名称</th>
								<th>礼品图片</th>
								<th>礼品价格</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="user-name"><s:property
										value='#session.gift.name' /></td>
								<td class="user-name"><img
									src="jsp/<s:property
										value='#session.gift.picture' />"
									width="100px" height="100px" /></td>
								<td class="user-name"><s:property
										value='#session.gift.price' /></td>
							</tr>
						</tbody>
					</table>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal">确认订单</button>
					<div class="login-bg"></div>
					<!--支付密码弹框  -->
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">付款弹框</h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="recipient-name" class="control-label">支付密码:</label>
											<input type="password" class="form-control" id="payPassword">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary" id="payButton">确认付款</button>
								</div>
							</div>
						</div>
					</div>
					<!--支付密码弹框  -->
				</form>
				<br />
			</div>
			<div class="col-md-4"></div>
		</div>
		<!-- 订单信息 -->
	</div>
</body>
</html>