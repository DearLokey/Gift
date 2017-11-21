<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新添礼品</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/green.css" rel="stylesheet">
<script type="text/javascript" src="ueditor.config.js"></script>
<script type="text/javascript" src="ueditor.all.min.js"></script>
<script src="js/searchByWord.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
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
</script>
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
				style="margin-top: -20px; padding-left: 60px; padding-right: 60px; padding-bottom: 60px">
				<div class="col-md-1"></div>
				<div class="col-md-8">
					<form action="do_addGift.do" method="post"
						enctype="multipart/form-data">
						<p>商品信息</p>
						<hr />
						<div class="form-group">
							<label>送给谁</label><br /> <select id="whoCategory"
								name="gift.who_id">
								<s:iterator value="#session.whoMap" var="bigWhoCategories">
									<s:iterator value="#bigWhoCategories.value" status="status">
										<option select="selected" style="font-size: 12px"
											value="<s:property value='id'/>"><s:property
												value="name" /></option>
									</s:iterator>
								</s:iterator>
							</select>
						</div>
						<div class="form-group">
							<label>名称</label> <input type="text" class="form-control"
								name="gift.name">
						</div>
						<div class="form-group">
							<label>价格</label> <input type="text" class="form-control"
								name="gift.price">
						</div>
						<div class="form-group">
							<label>库存</label> <input type="text" class="form-control"
								name="gift.stock_num">
						</div>
						<div class="form-group">
							<label>介绍</label>
							<textarea class="form-control" row="3" name="gift.introduction"></textarea>
						</div>
						<div class="form-group">
							<label>图片</label><input type="file" class="form-controlname"
								name="image" id="imgOne" onchange="preImg(this.id,'imgPre');" /><img
								id="imgPre" src="" width="100px" height="100px"
								style="display: block;" />
						</div>
						<div class="form-group">
							<script id="editor" type="text/plain"
								style="width:500px;height:200px;"></script>
							<script type="text/javascript">
								var ue = UE.getEditor('editor', {
									toolbars : [ [ 'insertimage' ] ],
									autoHeightEnabled : true,
									autoFloatEnabled : true
								});
							</script>
							<br> <br>
						</div>
						<br />
						<button id="add" type="submit" class="btn btn-default">添加</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer>
	<div class="Copyright">
		<p>Design by Dear me</p>
	</div>
	</footer>
</body>
</html>