<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href='<s:url value="/css/bootstrap.css"></s:url>' />
<link rel="shortcut icon" href='<s:url value="/img/icon.jpg"></s:url>' />

<!-- fancybox -->
<link href='<s:url value="/css/font-awesome.css"></s:url>' rel="stylesheet">
<link href='<s:url value="/js/plugins/fancybox/jquery.fancybox.css"></s:url>' rel="stylesheet">
<link href='<s:url value="/css/animate.css"></s:url>' rel="stylesheet">
<link href='<s:url value="/css/style.css"></s:url>' rel="stylesheet">

<!-- Sweet Alert -->
<link href='<s:url value="/css/plugins/sweetalert/sweetalert.css"></s:url>' rel="stylesheet">

<!-- 登录模态框css -->
<link rel="stylesheet" type="text/css" href='<s:url value="/css/http _www.jq22.com_css_my.css"></s:url>' />
<!--<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />-->
<!-- 地图中的图标 -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!--<link rel="stylesheet" type="text/css" href="css/detail.css" />-->
<!-- 详情页css -->
<link rel="stylesheet" type="text/css" href='<s:url value="/css/datail_1.css"></s:url>' />



<%-- <script type="text/javascript">
    $('#defaultPhoto').css('background-image','url(' + ${request.spot.defaultPhoto} + ')');
</script> --%>
<title>景区详情</title>
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
</style>
</head>
<body style="background-color: #f4f4f4;">
	<nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
		    <div class="navbar-header">
			    <a href='<s:url value="/index.html"></s:url>' class="navbar-brand" style="padding: 0; margin-top: 0;">
				    <img src='<s:url value="/img/logo.png"></s:url>' alt="魅力济南">
			    </a>
			    <a href='<s:url value="/index.html"></s:url>' class="navbar-nav mylogo" style="text-decoration: none;">
                	<h3 style="font-size: 24px;">在旅途</h3>
			    </a>
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">切换导航</span><span class="icon-bar"></span>
					<span class="icon-bar"></span><span class="icon-bar"></span>
				</button>
		    </div>
	        <div class="collapse navbar-collapse" id="navbar-collapse">
		        <ul class="nav navbar-nav navbar-left" style="margin-top: 0; margin-left: 38px;">
					<li>
						<a href='<s:url value="/index.html"></s:url>'>
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 
						</a>
					</li>
					<li>
						<a href='<s:url value="user/blog-loadArticles.action?sign=1"></s:url>'>
							<span class="glyphicon glyphicon-list"></span> 资讯 
						</a>
					</li>
					<li  class="active"><a href='<s:url value="/user/spot-loadScenic.action"></s:url>'><span class="glyphicon glyphicon-fire"></span>
						景区 </a></li>
					<li><a href='<s:url value="/map.jsp"></s:url>'><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
					<li>
						<a href='<s:url value="user/blog-loadArticles.action?sign=0"></s:url>'>
							<span class="glyphicon glyphicon-flag"></span> 游记
						</a>
					</li>
					<li>
						<a href='<s:url value="/aboutInfo.jsp"></s:url>'>
							<span class="glyphicon glyphicon-question-sign"></span> 关于 
						</a>
					</li>
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
					<s:form action="user/user-login.action" name="loginForm"
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
	<!--
       	作者：thread_j@163.com
       	时间：2018-05-17
       	描述：景点标题
    -->
	<div class="container-fluid" style="margin-top: 60px; background-color: white;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="" style="margin-left: 180px; padding-bottom: 10px;">
					<h1 style="font-family: inherit; color: #00659b; font-size: 36px; font-weight: 500; line-height: 1.1;padding-bottom: 2px;"><s:property value="#request.spot.name"/>
						<span style="position: absolute; right: 0; font-size: 16px;"></span><br>
						<div style="height: 14px;"></div>
						<small><s:property value="#request.spot.tagline"/> </small>
					</h1>

					<p class="level-title" style="margin-right: 200px; margin-bottom: 20px;">
						<a class="btn btn-primary btn-large" href="#">景区等级：<s:property value="#request.spot.level"/> </a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="default-photo" style="background-image: url(/ji_nan_tourism_gis_old/img/placehold.jpg)">
					<div id="defaultPhoto" class="default-photo" style="background-image: url(/ji_nan_tourism_gis_old/${requestScope.spot.defaultPhoto})"></div>
				</div>
			</div>
		</div>

		<div id="firstTop">
			<div id="float">
				<ul class="sceneTitle" style="width: 100%">
					<li><a href="#ota" class="">门票预订</a></li>
					<li><a href="#basic" class="">景区简介</a></li>
					<!-- <li><a href="#media" class="">多媒体</a></li> -->
					<li><a href="#gallery" class="">景区相册</a></li>
					<li><a href="#line" class="">交通指南</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
		</div>
		<!--标签  和上面定义的链接对应 ：门票预订-->
		<a name="ota"></a>

		<div class="info ota" id="ota">
			<div class="header">
				<h4 class="title" style="background-image: url(/ji_nan_tourism_gis_old/img/search-icon-ticket.png)">门票预订</h4>
				<div class="clearfix"></div>
				<div class="row table-title">
					<div class="col-xs-4">供应商</div>
					<div class="col-xs-4 ">门票种类</div>
					<div class="col-xs-2">票价</div>
					<div class="col-xs-2">操作</div>
				</div>
				<div class="row table-row">
					<div class="col-xs-4">
						<a href="http://www.56ren.com " target="_blank" class="website">五六人网</a>
					</div>
					<div class="col-xs-4">成人票</div>
					<div class="col-xs-2">
						<span class="price">¥ <strong><s:property value="#request.spot.ticketPrice"/> </strong></span>
					</div>
					<div class="col-xs-2">
						<a href="#" class="book">暂无</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 景区简介 -->
		<a name="basic"></a>
		<div class="info" id="basic">
			<div class="header">
				<h4 class="title" style="background-image: url(/ji_nan_tourism_gis_old/img/info.png)">景区简介</h4>

				<div class="clearfix"></div>
			</div>
			<p><s:property value="#request.spot.intro"/> </p>
			<div class="divide-line"></div>
			<div class="detail">
				<div class="row">
					<div class="col-md-6">
						<ul>
							<li>
								<p><span class="title">管理机构：</span><s:property value="#request.spot.management"/></p>
							</li>
							<li>
								<p class="not-fold"><span class="title">景区类型：</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-danger>名人故居</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-info>园林</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-primary>溪流泉水</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-success>湖泊</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-danger>文物古迹</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-info>纪念建筑</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-info>宗祠</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-warning>园林</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-danger>亭台楼阁</span><span style="color: #ffffff; padding: 1px; padding-left: 4px; padding-right: 4px; margin-top: 5px;" class=label-primary>名人遗迹</span></p>
							</li>
							<li>
								<p><span class="title">客服电话：</span><s:property value="#request.spot.tel"/></p>
							</li>
							<li>
								<p><span class="title">地址：</span><s:property value="#request.spot.address"/></p>
							</li>
							<li>
								<p><span class="title">营业时间：</span><s:property value="#request.spot.time"/></p>
							</li>
							<li>
								<p><span class="title">游览时间：</span><s:property value="#request.spot.costTime"/></p>
							</li>
							<li>
								<p><span class="title">景区网址：</span><a href='<s:property value="#request.spot.website"/>' target="_blank"><s:property value="#request.spot.website"/></a></p>
							</li>
							<li>
								<p><span class="title">价格：</span><s:property value="#request.spot.ticketPrice"/>元/人</p>
							</li>
							<li>
								<p><span class="title">价格描述：</span><s:property value="#request.spot.priceDescription"/></p>
							</li>
							<li>
								<p><span class="title">门票优惠政策：</span><s:property value="#request.spot.discount"/></p>
							</li>
						</ul>
					</div>
					<div class="col-md-6">
						<ul>
							<li>
								<p><span class="title">特色景观：</span><s:property value="#request.spot.feature"/></p>
							</li>
							<li>
								<p><span class="title">游览线路：</span><s:property value="#request.spot.line"/></p>
							</li>
							<li>
								<p><span class="title">讲解员说明：</span><s:property value="#request.spot.guideMan"/></p>
							</li>
							<li>
								<p><span class="title">配套服务设施：</span><br><s:property value="#request.spot.supporting"/></p>
							</li>
							<li>
								<p><span class="title">游客服务中心：</span><s:property value="#request.spot.serviceCenter"/></p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--景区简介结束-->


		<!--景区相册开始-->
		<a name="gallery"></a>
		<div class="clearfix"></div>
		<div class="info" id="gallery">
			<div class="header">
				<h4 class="title" style="background-image: url(./../img/gallery.png)">景区相册</h4>
				<div class="clearfix"></div>
			</div>

			<!--相册图片开始-->
			<div id="grid">
				<div class="ibox-content">

					<a class="fancybox" href="./../img/baimaiquan/1-1.jpg" title="图片1">
						<img alt="image" src="./../img/baimaiquan/1.jpg" />
					</a>
					<a class="fancybox" href="./../img/p2.jpg" title="图片2"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
					<a class="fancybox" href="img/p3.jpg" title="图片3"> <img
						alt="image" src="./../img/p_big3.jpg" />
					</a>
					<a class="fancybox" href="img/p1.jpg" title="图片4"> <img
						alt="image" src="./../img/p_big1.jpg" />
					</a>
					<a class="fancybox" href="img/p2.jpg" title="图片5"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
					<a class="fancybox" href="./../img/p3.jpg" title="图片6"> <img
						alt="image" src="./../img/p_big3.jpg" />
					</a>
					<a class="fancybox" href="./../img/p1.jpg" title="图片7"> <img
						alt="image" src="./../img/p_big1.jpg" />
					</a>
					<a class="fancybox" href="./../img/p2.jpg" title="图片8"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
					<a class="fancybox" href="./../img/p1.jpg" title="图片9"> <img
						alt="image" src="./../img/p_big1.jpg" />
					</a>
					<a class="fancybox" href="img/p2.jpg" title="图片10"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
					<a class="fancybox" href="./../img/p3.jpg" title="图片11"> <img
						alt="image" src="./../img/p_big3.jpg" />
					</a>
					<a class="fancybox" href="./../img/p1.jpg" title="图片12"> <img
						alt="image" src="./../img/p_big1.jpg" />
					</a>
					<a class="fancybox" href="./../img/p2.jpg" title="图片13"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
					<a class="fancybox" href="./../img/p3.jpg" title="图片14"> <img
						alt="image" src="./../img/p_big3.jpg" />
					</a>
					<a class="fancybox" href="./../img/p1.jpg" title="图片15"> <img
						alt="image" src="./../img/p_big1.jpg" />
					</a>
					<a class="fancybox" href="./../img/p2.jpg" title="图片16"> <img
						alt="image" src="./../img/p_big2.jpg" />
					</a>
				</div>
			</div>
			<!-- #grid -->
		</div>
		<!--相册结束-->


		<!--交通指南-->
		<a name="line"></a>
		<div class="clearfix"></div>
		<div class="info" id="line">


			<div class="header">
				<h4 class="title" style="background-image: url(/ji_nan_tourism_gis_old/img/car.png)">交通指南</h4>
				<div class="clearfix"></div>
			</div>
			<div class="map-area">
				<div class="navigator">
					<div class="intro" id="info">
						<div class="row">
							<div class="col-xs-8">
								<p class="name"><s:property value="#request.spot.name"/></p>
								<p class="small"><span>地址：</span><s:property value="#request.spot.address"/></p>
								<p class="small"><span>电话：</span><s:property value="#request.spot.tel"/></p>
							</div>
							<div class="col-xs-4">
								<div class="image"
									style="background-image: url(/ji_nan_tourism_gis_old/img/placehold.jpg)">
									<div class="image"
										style="background-image: url(/ji_nan_tourism_gis_old/img/baimaiquan/1506328100-1506328100-200x_.JPG)"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="map-tab">
									<ul>
										<li><a
											href="http://api.map.baidu.com/marker?location=36.7230190000,117.5447670000&title=章丘百脉泉公园&content=济南市章丘区汇泉路2017号&output=html&src=sdta"
											target="_blank"><i class="fa fa-location-arrow"></i>查看路线导航</a>
										</li>

									</ul>
								</div>
							</div>
						</div>

					</div>

				</div>


				<div id="map"></div>
			</div>
			<div class="divide-line"></div>

			<div class="detail">
				<ul class="with-icon">
					<li>
						<p style="background-image: url(/ji_nan_tourism_gis_old/img/bus.png)">公交车：</p>
						<p><s:property value="#request.spot.bus"/></p>
					</li>
					<li>
						<p style="background-image: url(/ji_nan_tourism_gis_old/img/car.png)">自驾车指南：</p>
						<p style="border: none; background-color: #ffffff"><s:property value="#request.spot.driving"/></p>
					</li>
					<li>
						<p style="background-image: url(/ji_nan_tourism_gis_old/img/park.png)">停车场信息:</p>
						<p><s:property value="#request.spot.park"/></p>
					</li>
				</ul>
			</div>
		</div>
		<!--交通指南结束-->
	</div>


	<!--
        	作者：thread_j@163.com
        	时间：2018-03-28
        	描述：页脚
        -->
	<footer id="footer " class="text-muted "
		style="background-color: #5E5E5E;padding: 20px;text-align: center;border-top: 1px solid #8C8C8C;color: #E3E3E3;margin-top: 20px; ">
	<div class="container ">
		<p>地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525" &nbsp;&nbsp;
			电话:178-6298-0863</p>
		<p>鲁ICP备 1818948. © 20018-2026 魅力济南行官网. &nbsp;&nbsp;Powered by
			Bootstrap.</p>
	</div>
	</footer>

	<!--
        	作者：thread_j@163.com
        	时间：2018-03-27
        	描述：将引入的脚本文件放置在后面，因为js文件的加载比较慢，这样可以减少对页面加载速度的影响
        -->


	<script type="text/javascript" src='<s:url value="/js/jquery-3.3.1.min.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/js/bootstrap.min.js"></s:url>'></script>
	<script type="text/javascript" src="<s:url value="/js/login.js"></s:url>"></script>
	<script src="<s:url value="/js/plugins/sweetalert/sweetalert.min.js"></s:url>"></script>
	<script type="text/javascript"
		src='<s:url value="http://api.map.baidu.com/api?v=2.0&ak=5vHDEZDCrT5TRRCeQ9vyOmHZSQh7YYQs"></s:url>'></script>

	<script type="text/javascript" src='<s:url value="/js/detail/detail.js"></s:url>'></script>


	<!-- Peity -->
	<script src="./../js/plugins/peity/jquery.peity.min.js"></script>

	<!-- 自定义js -->
	<script src="./../js/content.js?"></script>


	<!-- Fancy box -->
	<script src="./../js/plugins/fancybox/jquery.fancybox.js"></script>
	<script>
		$(document).ready(function() {
			$('.fancybox').fancybox({
				//openEffect: 'none',
				//closeEffect: 'none',
				//wrapCSS:"fancybox-custom"
				live : false
			});
		});

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


	<script type="text/javascript">
		/*var map = new BMap.Map("map");
		//创建点坐标
		var point = new BMap.Point(116.799642, 36.543993);
		//初始化地图,设置地图中心点和地图级别
		map.centerAndZoom(point, 16);
		//开启地图的鼠标滚动,默认是关闭的
		map.enableScrollWheelZoom(true);
		map.setCurrentCity("济南");
		var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
		map.addControl(top_left_navigation);*/
		loadMap("117.5447670000", "36.7230190000");
	</script>
</body>
</html>