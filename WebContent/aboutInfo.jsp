<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="shortcut icon" href="img/icon.jpg" />

<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="css/http _www.jq22.com_css_my.css" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/aboutInfo.css">
<title>魅力泉城欢迎您！中国济南</title>
<style type="text/css">
.mylogo h3 {
	font-family: '楷体';
	font-weight: bold;
	padding-top: 0;
	margin-top: 16px;
}

.mylogo {
	text-decoration: none; /* 在这里进行样式去除无效 */ 
	color: #333;
	margin: 0;
	height: 50px;
	text-align: center;
}

.carousel-inner .item img {
	margin: 0 auto;
}
/*底部css*/
#footer {
	/*background-color: #5E5E5E;在这里北body背景色覆盖，在行内样式设置页脚背景色*/
	
}

.info {
	text-decoration: none;
	color: #666666;
}

.info:hover {
	text-decoration: none;
	color: #666666;
}

.iteminfo {
	white-space: nowrap;
	overflow: hidden;
	/*制定文本溢出时将溢出部分隐藏*/
	text-overflow: ellipsis;
	/*并在边缘处以—— ... 方式显示*/
	/*border: 1px solid black;*/
}
/* 搜索栏样式  */
.formbar {
	margin-left: 120px;
}

.formbar input {
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	background: #F9F0DA;
	color: #9E9C9C;
}

.formbar button {
	top: 0;
	right: 0;
	background: #7BA7AB;
	border-radius: 0 5px 5px 0;
}

.formbar button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

.btnbar {
	border: none;
	outline: none;
	height: 34px;
	cursor: pointer;
	/*position: absolute;*/
}
/* 搜索栏样式  */
</style>
</head>
<body style="background-color: #EFF6F9;">
    <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="index.html" class="navbar-brand" style="padding: 0; margin-top: 0;">
				<img src="img/logo.png" alt="魅力济南">
			</a> <a href="index.html" class="navbar-nav mylogo"
				style="text-decoration: none;">
				<h3>在旅途</h3>
			</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav navbar-left"
				style="margin-top: 0; margin-left: 38px;">
				<li><a href="index.html"> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页
				</a></li>
				<li><a href="user/blog-loadArticles.action?sign=1"><span class="glyphicon glyphicon-list"></span>
						资讯 </a></li>
				<li><a href="user/spot-loadScenic.action"><span class="glyphicon glyphicon-fire"></span>
						景区 </a></li>
				<li><a href="map.jsp"><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
				<li>
					<a href="user/blog-loadArticles.action?sign=0">
						<span class="glyphicon glyphicon-flag"></span> 游记
					</a>
				</li>
				<li class="active"><a href="aboutInfo.jsp"><span
						class="glyphicon glyphicon-question-sign"></span> 关于 </a></li>
				<s:if test="#session.user == null">
				    <li><a href="register.jsp"
						style="padding-right: 0; margin-right: 0;"><span
							class="glyphicon glyphicon-user"></span> 注册/ </a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal"
						style="padding-left: 0; margin-left: 0;">登录</a></li>
				</s:if>
				<s:else>
					<li><a href='<s:url value="/user/users-loadUserArticles.action"></s:url>'>
						<span class="glyphicon glyphicon-asterisk"></span> 设置 </a></li>
				    <li><a href="#" id="logout" onclick="logout()"><span
							class="glyphicon glyphicon-user"></span> 下线 </a></li>
				</s:else>

			</ul>
			<form class="navbar-form navbar-right formbar form-inline"
				role="search" action='<s:url value="/user/result-queryResult.action"></s:url>' method="post">
				<div class="form-group">
					<div class="input-group" style="height: 35px;">
						<input class="form-control" name="queryName" id="searchInput" type="text" style="height: 35px;" />
						<div class="input-group-addon" style="height: 35px; padding: 0;">
							<button type="submit" onclick="searchResult()" class="btnbar btn" style="margin: 0;"></button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	</nav>
	<!--
        	作者：thread_j@163.com
        	时间：2018-03-28
        	描述：导航栏结束
        -->

	<!-- 模态框（Modal）开始 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content2 tcc">
				<div class="modal-header2 top20">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body tcck">
					<s:form namespace="/" action="user-login.action" name="loginForm"
						id="loginForm" method="post">
						<div class="input-group input-group-lg parentCls">
							<span class="input-group-addon" id="emailLogo"><i title="请输入您注册使用的邮箱号！"
							    data-trigger="manual" data-placement="left" style="width: 18px"
								class="glyphicon glyphicon-envelope youxiang"></i></span> <input type="text"
								class="form-control inputElem " placeholder="请输入登录邮箱 "
								aria-describedby="email" id="email" name="userEmail"
								style="width: 466px;" onblur="emailgs(this)">
						</div>
						<div class="input-group input-group-lg top20 ">
							<span class="input-group-addon" id="pwd"><i
								class="glyphicon glyphicon-lock i-pwd" style="width: 18px"  data-trigger="manual" data-placement="left"></i></span> <input
								type="password" class="form-control " placeholder="请输入登录密码 " style="height: 50px;"
								aria-describedby="pwd" id="password" name="userPass" onblur="pwdpd()"> <span
								class="input-group-btn tccBut">
								<button class="btn btn-success" type="button" onclick="emdl()">登
									录</button>
							</span>
						</div>
					</s:form>
				</div>

				<div class="modal-footer2">
					<div class="f">
						<a href="#">忘记密码?</a>
					</div>
					<div class="r">
						<a href="register.jsp">注册新用户</a>
					</div>
					<div class="dr"></div>
				</div>

				<div class="d3f modal-body tcck2 ">
					<a href="#" onClick="tz() " class="qq"></a> <a
						href="https://api.weibo.com:443/oauth2/authorize?client_id=3364913104&redirect_uri=http%3A%2F%2Fwww.jq22.com%2FWeiboReturn.aspx&response_type=code&display=default "
						class="sina"></a> <a href="http://www.jq22.com/zfbReturn.aspx "
						class="zfb"></a> <a href="# " onClick="gt() " class="git "></a>
				</div>
				<script>
					function emdl() {
						alert("123");
						var form = document.getElementById("loginForm");
						form.submit();
					}

					function tz() {
						var urldz = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101135281&redirect_uri=http://www.jq22.com/QQReturn.aspx?tjurl="
								+ window.location.href;
						window.location.href = urldz;
					}

					function gt() {
						var urldz = " https://github.com/login/oauth/authorize?client_id=cf869185ea7d8fcab6df&state=jq22&redirect_uri=http://www.jq22.com/github.aspx?tjurl="
								+ window.location.href;
						window.location.href = urldz;
					}
				</script>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--
       	作者：thread_j@163.com
       	时间：2018-03-28
       	描述：模态框结束
    -->
    
    <!-- 关于页面开始 -->
    <div class="jumbotron" style="margin-top: 50px;">
		<div class="container">
			<hgroup>
				<h1>关于</h1>
				<h4>本网站的成长介绍...</h4>
			</hgroup>
		</div>
	</div>
	
	<div id="about">
		<div class="container">
			<div class="row">
				<div class="col-md-3 hidden-sm hidden-xs">
					<div class="list-group">
						<a class="list-group-item" href="#1">1.网站简介</a>
						<a class="list-group-item" href="#2">2.加入我们</a>
						<a class="list-group-item" href="#3">3.联系方式</a>
					</div>
				</div>
		 		<div class="col-md-9 about">
					<a name="1"></a>
					<h3>网站简介</h3>
					<p>魅力济南行官网是一家专业以智能化弱电工程为主的高科技民营企业，公司自创立以来一直专业致力于智能化弱电工程；始终坚持发扬"诚信、创新、沟通"为企业宗旨，以"技术、服务"为立业之本的团体精神，并形成一套完整的设计、安装、调试、培训、维护一站式服务体系。</p>
					<a name="2"></a>
					<h3>加入我们</h3>
					<p>网络已深刻改变着人们的生活，本地化生活服务市场前景巨大，生活半径团队坚信本地化生活服务与互联网的结合将会成就一家梦幻的公司，我们脚
	踏实地的相信梦想，我们相信你的加入会让生活半径更可能成为那家梦幻公司！生活半径人有梦想，有魄力，强执行力，但是要实现这个伟大的梦想，需要更多的有
	创业精神的你一路前行。公司将提供有竞争力的薪酬、完善的福利（五险一金）、期权、广阔的上升空间。只要你有能力、有激情、有梦想，愿意付出，愿意与公司
	共同成长，请加入我们！</p>
					<p>请发送您的简历到：hr@thread_j.com，我们会在第一时间联系您！</p>
					<a name="3"></a>
					<h3>联系方式</h3>
					<p>地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525</p>
					<p>邮编：250300</p>
					<p>电话：178-6298-0863</p>
					<p>传真：178-6298-0863</p>
				</div>
			</div>
		</div>
	</div>
    
    <footer id="footer" class="text-muted"
		style="background-color: #5E5E5E;padding: 20px;text-align: center;border-top: 1px solid #8C8C8C;color: #E3E3E3;margin-top: 20px; ">
	<div class="container ">
		<p>地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525" &nbsp;&nbsp;
			电话:178-6298-0863</p>
		<p>鲁ICP备 1818948. © 20018-2026 魅力济南行官网. &nbsp;&nbsp;Powered by
			Bootstrap.</p>
	</div>
	</footer>

	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		function searchResult(){
			var queryField = $('#searchInput').val();
			//alert(queryField);
			var flag = true;
			if(queryField == null){
				queryField == "";
			}
			$('#searchForm').submit();
		}
	</script>
</body>
</html>