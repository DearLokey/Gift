<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增类别</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/green.css" rel="stylesheet">
<script src="js/searchByWord.js" type="text/javascript"></script>
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
			<div class="row"
				style="margin-top: -20px; padding-left: 60px; padding-right: 60px;">
				<div class="col-md-1"></div>
				<div class="col-md-8" style="padding-bottom: 30px">
					<form action="do_addCategory.do" method="post"
						enctype="multipart/form-data">
						<p>商品信息</p>
						<hr />
						<div class="form-group">
							<label>送给谁大类别</label><br /> <select id="bigWhoCategory"
								name="whoCategory.bigWho_id">
								<s:iterator value="#session.whoMap" var="bigWhoCategories">
									<option select="selected" style="font-size: 12px"
										value="<s:property value="#bigWhoCategories.key.id" />"><s:property
											value="#bigWhoCategories.key.name" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="form-group">
							<label>新增类别名称</label> <input type="text" name="whoCategory.name"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-default">添加</button>
					</form>
				</div>
				<div class="col-md-3"></div>
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