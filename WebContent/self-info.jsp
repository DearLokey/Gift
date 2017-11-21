<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/self-info.css" rel="stylesheet" />
<script src="js/searchByWord.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<title>个人信息</title>
<!-- 联动 -->
<script>
	function getFileUrl(sourceId) {
		var url;
		if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE 
			url = document.getElementById(sourceId).value;
		} else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox 
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		} else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome 
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		}
		return url;
	}
	function preImg(sourceId, targetId) {
		var url = getFileUrl(sourceId);
		var imgPre = document.getElementById(targetId);
		imgPre.src = url;
	}
	$(function() {
		$("#addAddress").click(function() {
			$.ajax({
				url : "do_addAddress.do",
				data : {
					"address.user_account" : $(".navbar-brand").text(),
					"address.address" : $("#address").val()
				},
				type : "post",
				success : function(data) {
					if (data.info == 'ok') {
						location.reload(true);
					}
				}
			})
		})
		$("#updatePassword").click(function() {
			if ($("#password").val() == $("#repassword").val()) {
				$.ajax({
					url : "do_updatePassword.do",
					type : "post",
					data : {
						"user.id" : $("#id").val(),
						"user.account" : $("#account").val(),
						"user.password" : $("#password").val(),
						"user.isAdmin" : $("#isAdmin").val(),
						"user.head" : $("#head").val(),
						"user.balance" : $("#balance").val(),
						"user.name" : $("#name").val()
					},
					success : function(data) {
						if (data.info == "ok") {
							alert("密码修改成功，请重新的登录");
							window.location.href = "user_logOff.do";
						}
					}
				});
			} else {
				alert("两次密码输入不一致！");
			}
		});
	})
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
		。
		<!-- 头部logo和搜索框区 -->
		<!-- 中间信息展示 -->
		<div class="row"
			style="margin-top: 40px; margin-bottom: 60px; padding-left: 60px; padding-right: 60px">
			<div style="background: white; border-radius: 10px; padding: 10px">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab"><img
							src="icon/account-info.png" style="margin-top: -2px;"> 账户信息</a></li>
					<li role="presentation"><a href="#profile"
						aria-controls="profile" role="tab" data-toggle="tab"><img
							src="icon/pass.png" style="margin-top: -2px;"> 修改密码</a></li>
					<li role="presentation"><a href="#messages"
						aria-controls="messages" role="tab" data-toggle="tab"><img
							src="icon/address.png"
							style="margin-top: -2px; padding-left: 28px;"> 管理收货地址</a></li>
				</ul>
				<br />
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="home">
						<h3></h3>
						<HR />
						<form action="do_updateUser.do" method="post"
							enctype="multipart/form-data">
							<div class="row" style="padding-bottom: 20px">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-2 control-label">帐号</label>
										<div class="col-sm-5">
											<p class="form-control-static">
												<s:property value="#session.loginUser.account" />
											</p>
										</div>
									</div>
									<br /> <br />
									<div class="form-group">
										<label class="col-sm-2 control-label">昵称</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" id="inputEmail3"
												placeholder="<s:property
										value='#session.loginUser.name' />"
												name="user.name" /> <input type="hidden"
												value="<s:property
										value='#session.loginUser.id' />"
												name="user.id"> <input type="hidden"
												value="<s:property
										value='#session.loginUser.account' />"
												name="user.account"> <input type="hidden"
												value="<s:property
										value='#session.loginUser.password' />"
												name="user.password"> <input type="hidden"
												value="<s:property
										value='#session.loginUser.isAdmin' />"
												name="user.isAdmin"> <input type="hidden"
												value="<s:property
										value='#session.loginUser.balance' />"
												name="user.balance">
										</div>
									</div>
									<br /> <br />
									<div class="form-group">
										<label class="col-sm-2 control-label">头像</label>
										<div class="col-sm-5">
											<input type="file" name="image" class="form-controlname"
												name="imgOne image" id="imgOne"
												onchange="preImg(this.id,'imgPre');" /><img id="imgPre"
												src="img/<s:property
										value='#session.loginUser.head' />"
												class="img-circle" width="200px" height="200px"
												style="display: block;" />
										</div>
									</div>
									<div class="form-group" style="padding-top: 20px">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default">保存修改</button>
										</div>
									</div>
								</div>
								<div class="col-md-6"></div>
							</div>
						</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
						<h3>修改密码</h3>
						<HR />
						<input type="hidden" id="id"
							value="<s:property	value='#session.loginUser.id'/>" /><input
							type="hidden" id="account"
							value="<s:property	value='#session.loginUser.account'/>" /> <input
							type="hidden" id="isAdmin"
							value="<s:property	value='#session.loginUser.isAdmin'/>" /><input
							type="hidden" id="head"
							value="<s:property	value='#session.loginUser.head'/>" /> <input
							type="hidden" id="head"
							value="<s:property	value='#session.loginUser.balance'/>" /> <input
							type="hidden" id="head"
							value="<s:property	value='#session.loginUser.name'/>" />
						<form class="form-horizontal">
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="password">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">重复新密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="repassword">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-default"
										id="updatePassword">提交</button>
								</div>
							</div>
						</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="messages">
						<h3>用户地址</h3>
						<HR />
						<table class="table" style="background: white">
							<thead>
								<tr>
									<th>地址详情</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="#request.addresses" var="address">
									<tr>
										<td><s:property value="address" /></td>
										<td><a
											href="do_deleteAddress.do?id=<s:property value='id'/>">删除</a></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						<button type="button" class="btn btn-default" data-toggle="modal"
							data-target="#myModal">新增地址</button>
						<!-- 模态框 -->
						<div class="modal fade" id="myModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">地址详情</h4>
									</div>
									<form action="do_updateUser.do" method="post"
										enctype="multipart/form-data">
										<div class="modal-body">
											<input type="hidden"
												value="<s:property	value='#session.loginUser.account'/>"
												name="user.account" />
											<div class="form-group">
												<textarea class="form-control" rows="3" id="address"></textarea>
											</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="addAddress">提交</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
			</div>
		</div>
	</div>
	<!-- 中间信息展示 -->
</body>
</html>