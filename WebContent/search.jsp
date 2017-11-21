<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>礼品搜索页面</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/svwp_style.css" rel="stylesheet" type="text/css" />
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
		<!-- 头部logo和搜索框区 -->
		<!-- 搜索部分 -->
		<div class="row"
			style="margin-top: 10px; padding-left: 60px; padding-right: 60px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<!-- 品牌开始 -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="media">
							<div class="media-left media-middle">
								<h3>
									<span class="label label-default">送给谁 </span>&nbsp; &nbsp;
								</h3>
							</div>
							<div class="media-body">
								<s:iterator value="#session.whoMap" var="bigWhoCategories">
									<img
										src="icon/<s:property value='#bigWhoCategories.key.picture' />">
									<s:property value="#bigWhoCategories.key.name" />：
									<s:iterator value="#bigWhoCategories.value">
										<s:if test="#status.index%4==3">
											<br />
										</s:if>
						&nbsp;&nbsp;<a
											href="show_search.do?who_id=<s:property value='id'/>"
											style="font-size: 10px"><s:property value="name" /></a>
										<input type="hidden" value="<s:property value='id'/>" />
									</s:iterator>
									<br />
								</s:iterator>
							</div>
						</div>
					</div>
				</div>
				<!-- 品牌结束 -->
				<br />
				<!-- 排序，默认部分 -->
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							价格<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="show_searchByPriceD.do" id="sort_priceD">从高到低</a></li>
							<li><a href="show_searchByPrice.do" id="sort_price">从低到高</a></li>
						</ul>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							销量<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="show_searchBySales_numD.do"
								id="sort_sales_numD">从高到低</a></li>
							<li><a href="show_searchBySales_num.do" id="sort_sales_num">从低到高</a></li>
						</ul>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							上架时间<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="show_searchBySelling_timeD.do"
								id="sort_selling_timeD">从高到低</a></li>
							<li><a href="show_searchBySelling_time.do"
								id="sort_selling_time">从低到高</a></li>
						</ul>
					</div>
				</div>
				<br />
				<div class="row">
					<s:iterator value="#session.searchList">
						<div class="col-md-3">
							<div class="thumbnail" style="height: 380px">
								<a
									href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>">
									<img src="jsp/<s:property value='picture'/>" />
								</a>
								<div>
									<h3>
										<a
											href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><span
											style="color: gray; font-family: '楷体'"><s:property
													value='name' /></span></a><br />
									</h3>
									<div class="input-group">
										<div class="input-group-addon">价格</div>
										<input type="text" class="form-control"
											placeholder="￥<s:property value='price' />" readonly>
									</div>
									<div class="input-group">
										<div class="input-group-addon">销量</div>
										<input type="text" class="form-control"
											placeholder="<s:property value='sales_num' />" readonly>
									</div>
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
				<!-- 搜索出的商品部分结束 -->
			</div>
			<div class="col-md-1"></div>
		</div>
		<!-- 搜索部分 -->
	</div>
</body>
</html>