<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>礼品主页</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/svwp_style.css" rel="stylesheet" type="text/css" />
<!-- 自动更换图片 -->
<script src="js/jquery.slideViewerPro.1.0.js" type="text/javascript"></script>
<script src="js/jquery.timers.js" type="text/javascript"></script>
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
			style="padding-left: 60px; padding-right: 60px; border-bottom: solid 4px green">
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
		<!-- 新闻巨幕开始 -->
		<div class="row"
			style="margin-top: 40px; padding-left: 60px; padding-right: 60px">
			<!-- 礼品类别分类显示 -->
			<div class="col-md-3"
				style="border-radius: 10px; border-style: dashed; background: white; padding-left: 30px; margin-right: -14px;">
				<s:iterator value="#request.whoMap" var="bigWhoCategories">
					<h4>
						<img
							src="icon/<s:property value='#bigWhoCategories.key.picture' />">
						<s:property value="#bigWhoCategories.key.name" />
					</h4>
					<s:iterator value="#bigWhoCategories.value" status="status">
						<s:if test="#status.index!= 0 && #status.index%4==0">
							<br />
						</s:if>
						&nbsp;&nbsp;<a
							href="show_search.do?who_id=<s:property value='id'/>"
							style="font-size: 10px"><s:property value="name" /></a>
						<input type="hidden" value="<s:property value='id'/>" />
					</s:iterator>
					<br />
					<hr />
				</s:iterator>
			</div>
			<!-- 礼品类别分类结束 -->
			<!-- 大图轮播开始 -->
			<div class="col-md-6">
				<div id="featuredslideshow">
					<ul>
						<s:iterator value="#request.salesGifts" var="salesGift"
							status="status" begin="0" end="4">
							<li><a
								href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"
								target="_parent"> <img width="600" height="450"
									alt="<s:property value='introduction'/>"
									src="jsp/<s:property value='picture'/>" /></a></li>
						</s:iterator>
						<!-- eccetera -->
					</ul>
				</div>
				<script type="text/javascript">
					$("div#featuredslideshow").slideViewerPro({
						thumbs : 4,
						thumbsPercentReduction : 15,
						galBorderWidth : 1,
						galBorderColor : "#CCCCCC",
						thumbsTopMargin : 10,
						thumbsRightMargin : 10,
						thumbsBorderWidth : 2,
						thumbsActiveBorderColor : "#993399",
						thumbsActiveBorderOpacity : 1,
						thumbsBorderOpacity : 1,
						buttonsTextColor : "#333333",
						autoslide : true,
						typo : true
					});
				</script>
			</div>
			<!-- 大图轮播结束 -->
			<div class="col-md-3"
				style="background-color: white; border-radius: 10px; border-style: dashed; padding-left: 30px;">
				<!-- 新品 -->
				<h2 style="font-family: '楷体'">热销新品</h2>
				<hr />
				<s:iterator value="#request.newGifts" var="newGift" status="status"
					begin="0" end="1">
					<div class="row-md-4">
						<a
							href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><img
							src="jsp/<s:property value='picture'/>"
							class="img-circle" height="120px" width="120px" /></a> <br /> <a
							href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><s:property
								value='name' /></a>
					</div>
					<hr />
				</s:iterator>
			</div>
		</div>
		<!-- 新闻巨幕结束 -->
		<!-- 女友礼物div开始 -->
		<div class="row"
			style="margin-top: 3.5%; padding-left: 60px; padding-right: 60px;">
			<div class="btn-group btn-group-lg" role="group" aria-label="...">
				<button type="button" class="btn btn-success">女友礼物</button>
				<button type="button" class="btn btn-default">送女生</button>
				<button type="button" class="btn btn-default">送老婆</button>
				<button type="button" class="btn btn-default">送妈妈</button>
				<button type="button" class="btn btn-default">送女儿</button>
			</div>
			<br /> <br />
			<s:iterator value="#request.girlGifts" var="girlGift" begin="0"
				end="3">
				<div class="col-md-3"
					style="border-radius: 10px; border-style: dotted; padding: 5px">
					<div class="thumbnail">
						<a
							href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><img
							src="jsp/<s:property
									value='picture' />" /></a>
						<div style="text-align: center">
							<br /> <span style="font-size: 16px"><s:property
									value="name" /></span>
							<hr />
							<span style="font-size: 16px; color: red">￥<s:property
									value="price" /></span> <span style="font-size: 16px; color: gray">最近销售<s:property
									value="sales_num" />件
							</span>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
		<!--女友礼物div结束  -->
		<!--男友礼物div开始 -->
		<div class="row"
			style="margin-top: 3.5%; padding-left: 60px; padding-right: 60px;">
			<div class="btn-group btn-group-lg" role="group" aria-label="...">
				<button type="button" class="btn btn-success">男友礼物</button>
				<button type="button" class="btn btn-default">送男生</button>
				<button type="button" class="btn btn-default">送老公</button>
				<button type="button" class="btn btn-default">送爸爸</button>
				<button type="button" class="btn btn-default">送儿子</button>
			</div>
			<br /> <br />
			<s:iterator value="#request.boyGifts" var="boyGift" begin="0" end="3">
				<div class="col-md-3"
					style="border-radius: 10px; border-style: dotted; padding: 5px">
					<div class="thumbnail">
						<a
							href="show_giftDetail.do?id=<s:property value='id'/>&account=<s:property value='#session.loginUser.account'/>"><img
							src="jsp/<s:property
									value='picture' />" /></a>
						<div style="text-align: center">
							<br /> <span style="font-size: 16px"><s:property
									value="name" /></span>
							<hr />
							<span style="font-size: 16px; color: red">￥<s:property
									value="price" /></span> <span style="font-size: 16px; color: gray">最近销售<s:property
									value="sales_num" />件
							</span>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
		<!--男友礼物div结束  -->
	</div>
</body>
</html>