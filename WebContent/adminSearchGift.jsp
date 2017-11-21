<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有礼品</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
			<s:iterator value="#request.giftList">
				<h2 class="title">
					<img src="jsp/<s:property value='picture'/>" width="50px"
						height="50px" /><a
						href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><s:property
							value='name' /></a>
				</h2>
				<div class="textfoot">
					<a href="show_updateGift.do?id=<s:property value='id'/>">修改</a> <input
						type="hidden" value="<s:property value='id'/>" /> <a
						href="do_deleteGift.do?id=<s:property value='id'/>">删除</a>
				</div>
				</article>
			</s:iterator>
			<s:iterator value="#session.searchList">
				<h2 class="title">
					<img src="jsp/<s:property value='picture'/>" width="50px"
						height="50px" /><a
						href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><s:property
							value='name' /></a>
				</h2>
				<div class="textfoot">
					<a href="show_updateGift.do?id=<s:property value='id'/>">修改</a> <input
						type="hidden" value="<s:property value='id'/>" /> <a
						href="do_deleteGift.do?id=<s:property value='id'/>">删除</a>
				</div>
				</article>
			</s:iterator>
		</div>
	</div>
	<footer>
	<div class="Copyright">
		<p>Design by Dear me</p>
	</div>
	</footer>
</body>
</html>