<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>魅力泉城欢迎您！中国济南</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	
<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="img/icon.jpg" />

<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!--实时路况-->
<link rel="stylesheet" href="css/TrafficControl_min.css" />

<!--检索信息窗口-->
<link rel="stylesheet" href="css/SearchInfoWindow_min.css" />

<link rel="stylesheet" type="text/css"
	href="css/http _www.jq22.com_css_my.css" />
	


<style type="text/css">
body, html, #container {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
/*搜索框7*/
.bar7 input {
	width: 250px;
	border-radius: 42px;
	border: 2px solid #324B4E;
	background: #F9F0DA;
	transition: .3s linear;
	float: right;
}

.bar7 input:focus {
	width: 300px;
}

.bar7 button {
	background: none;
	top: -2px;
	right: 0;
}

.bar7 button:before {
	/*content: "\f002";*/
	font-family: FontAwesome;
	color: #324b4e;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <a
			href="index.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>济</b>南</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>魅力济南</b>在旅途</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">

			<ul class="nav navbar-nav navbar-left" style="margin-right: 300px;">
				<li class="dropdown search bar7">
					<form class="navbar-form form-inline" role="search"
						id="placeSearchForm" method="post">
						<div class="form-group has-success has-feedback">
							<input type="text" id="suggestionId" class="form-control"
								placeholder="请输入您要搜索的内容..."> <span
								class="glyphicon glyphicon-search form-control-feedback"
								aria-hidden="true">
								<button type="submit"></button>
							</span>
							<div id="searchResultPanel"
								style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>
						</div>
					</form>
				</li>
			</ul>

			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a href="index.jsp"> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页
				</a></li>
				<li><a href="user/blog-loadArticles.action?sign=1"><span
						class="glyphicon glyphicon-list"></span> 资讯 </a></li>
				<li><a href="user/spot-loadScenic.action"> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> 景区
				</a></li>
				<li class="active"><a href="map.jsp"><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
				<li><a href="user/blog-loadArticles.action?sign=0"> <span
						class="glyphicon glyphicon-flag"></span> 游记
				</a></li>
				<li><a href="aboutInfo.jsp"><span
						class="glyphicon glyphicon-question-sign"></span> 关于 </a></li>
				<s:if test="#session.user == null">
				    <s:set var="isOnline" value="false"></s:set>
					<li><a href="register.jsp"
						style="padding-right: 0; margin-right: 0;"><span
							class="glyphicon glyphicon-user"></span> 注册/ </a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal"
						style="padding-left: 0; margin-left: 0;">登录</a></li>
				</s:if>
				<s:else>
					<s:set var="isOnline" value="true"></s:set>
				</s:else>
			</ul>
			<s:if test="#request.isOnline == true">
			<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<!-- 菜单栏个人信息 -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <img
							src="dist/img/user2-160x160.jpg" class="user-image"
							alt="User Image"> <span class="hidden-xs">Thread Jian</span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header"><img src="dist/img/user2-160x160.jpg"
								class="img-circle" alt="User Image">
	
								<p>
									Thread Jian - WebGIS Developer <small>04-13 .2018</small>
								</p></li>
							<!-- Menu Body -->
							<!-- <li class="user-body">
								<div class="row">
									<div class="col-xs-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Friends</a>
									</div>
								</div> /.row
							</li> -->
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href='<s:url value="/user/users-loadUserArticles.action"></s:url>' class="btn btn-default btn-flat">个人信息</a>
								</div>
								<div class="pull-right">
									<a href="#" id="logout" onclick="logout()" class="btn btn-default btn-flat">退出</a>
								</div>
							</li>
						</ul></li>
					<!-- 菜单栏个人信息结束 -->
					<!-- Control Sidebar Toggle Button -->
					<li><a href="#" data-toggle="control-sidebar"><i
							class="fa fa-gears"></i></a></li>
				</ul>
				</s:if>
		</div>
		</nav> </header>
		<!--顶部菜单栏结束 -->
		
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
								    data-trigger="manual" data-placement="left" 
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
					<script type="text/javascript" src="js/login.js"></script>
					<script>
						function emdl() {
							//alert("123");
							var flag = check();
							var form = document.getElementById("loginForm");
							//alert(flag);
							if(flag){
								form.submit();
							}
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
		

		<!-- 左侧菜单栏开始 -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user2-160x160.jpg" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Thread Jian</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form 菜单栏搜索 -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." > <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form菜单栏搜索结束 --> <!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<!--MAIN NAVIGATION-->
			<li class="header">主菜单</li>
			<li class="active treeview"><a href="#"> <i
					class="fa fa-dashboard"></i> <span>量算</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="#" onclick="myDis.open()"><i
							class="fa fa-circle-o"></i> 距离量算</a></li>
					<li><a href="#"><i class="fa fa-circle-o"></i> 面积量算</a></li>
					<li><a href="#" onclick="myDrag.open()"><i
							class="fa fa-circle-o"></i> 拉框放大</a></li>
				</ul></li>
			<li><a href="#"> <i class="fa fa-th"></i> <span>谁谁谁</span> <small
					class="label pull-right bg-green">new</small>
			</a></li>
			<li class="header">LABELS</li>

			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a>
			</li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a>
			</li>
		</ul>
		</section> <!-- /.sidebar --> </aside>
		<!-- 左侧菜单栏结束-->

		<!-- 内容显示区开始-->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!--<section class="content-header">
					<h1>Dashboard<small>Control panel</small></h1>
					<ol class="breadcrumb">
						<li>
							<a href="#"><i class="fa fa-dashboard"></i> Home</a>
						</li>
						<li class="active">Dashboard</li>
					</ol>
				</section>-->
			<!--.content {
					min-height: 250px;
					padding: 15px;
					margin-right: auto;
					margin-left: auto;
					padding-left: 15px;
					padding-right: 15px
					在这里对:min-height 属性进行修改就好啦
				}-->
			<section class="content" style="min-height: 627px;padding: 0;">
			<div id="container" style="min-height: 627px;"></div>
			</section>
		</div>

		<!-- /.content-wrapper -->
		<!--
	    	作者：thread_j@163.com
	    	时间：2018-03-28
	    	描述：页脚
	        -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.2.7
		</div>
		<strong>鲁ICP备 1818948. © 20018-2026 魅力济南行官网.
			&nbsp;&nbsp;Powered by Bootstrap.</strong> </footer>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<%-- <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script> --%>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

	<!-- Bootstrap 3.3.5 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!--引入百度地图API文件 -->
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=5vHDEZDCrT5TRRCeQ9vyOmHZSQh7YYQs"></script>
	<!-- <script type="text/javascript" src="js/SearchInfoWindow.js"></script> -->
	<!-- 检索信息窗口 -->
	<script type="text/javascript" src="js/SearchInfoWindow.js"></script>
	<!--测距-->
	<script type="text/javascript" src="js/DistanceTool_min.js"></script>
	<!--拉框放大-->
	<script type="text/javascript" src="js/RectangleZoom_min.js"></script>
	
	<!--实时路况-->
	<script type="text/javascript" src="js/TrafficControl_min.js"></script>
	
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- 自定义js -->
	<script type="text/javascript" src="js/map.js"></script>

	
	
</body>
</html>