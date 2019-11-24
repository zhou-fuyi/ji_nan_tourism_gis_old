<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>魅力泉城欢迎您！中国济南</title>
<link rel="stylesheet" type="text/css" href='<s:url value="/css/bootstrap.css"></s:url>' />

<!-- Sweet Alert -->
<link href='<s:url value="/css/plugins/sweetalert/sweetalert.css"></s:url>' rel="stylesheet">

<link href='<s:url value="/css/animate.min.css"></s:url>' rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href='<s:url value="/css/http _www.jq22.com_css_my.css"></s:url>' />
<link rel="stylesheet" href='<s:url value="/css/font-awesome.min.css"></s:url>'>
<link rel="shortcut icon" href='<s:url value="/img/icon.jpg"></s:url>' />

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
			<a href='<s:url value="/index.html"></s:url>' class="navbar-brand" style="padding: 0; margin-top: 0;">
				<img src='<s:url value="/img/logo.png"></s:url>' alt="魅力济南">
			</a> <a href='<s:url value="/index.html"></s:url>' class="navbar-nav mylogo"
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
				<li class="active"><a href="index.html"> <span
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
				<li><a href="aboutInfo.jsp"><span
						class="glyphicon glyphicon-question-sign"></span> 关于 </a></li>
				<s:if test="#session.user == null">
				    <li><a href="register.jsp"
						style="padding-right: 0; margin-right: 0;"><span
							class="glyphicon glyphicon-user"></span> 注册/ </a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal"
						style="padding-left: 0; margin-left: 0;">登录</a></li>
				</s:if>
				<s:else>
					<li><a href="user/users-loadUserArticles.action">
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
        	时间：2018-03-27
        	描述：轮播图开始
       -->
	<div class="carousel slide" id="myCarousel">
		<ol class="carousel-indicators ">
			<li class="active" data-slide-to="0" data-target="#myCarousel">
			</li>
			<li data-slide-to="1" data-target="#myCarousel"></li>
			<li data-slide-to="2" data-target="#myCarousel"></li>
			<li data-slide-to="3" data-target="#myCarousel"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img alt="百脉泉" src="img/baimaiquan_1.jpg " />
				<div class="carousel-caption">
					<h4>百脉泉</h4>
					<p>
						百脉泉位于山东省济南市章丘区，是济南五大泉脉之一，与趵突泉齐名并列，是中国北方独具特色的泉景公园。“百脉寒泉珍珠滚”，百脉泉公园因地缘势，沿水之滨，建有儿童乐园区、名泉水景区、花园景树区、幽静学习区、密林散步区、龙泉寺、清照园等
					</p>
				</div>
			</div>
			<div class="item">
				<img alt="红叶谷" src="img/hongyegu1.jpg " />
				<div class="carousel-caption">
					<h4>红叶谷</h4>
					<p>红叶谷生态文化旅游区（Red Leaves
						Canyon），国家重点风景名胜区，国家AAAA级旅游景区。红叶谷位于山东省济南市历城区锦绣川乡南部山区，是济南园林集团开发建设的一个新的旅游区，于2001年9月19日正式对外开放。
						由于红叶谷所处的南部山区是济南泉水的主要涵养补给地，平均气温比市区低5摄氏度左右，景区植被覆盖率较高，所以红叶谷又是一处“天然氧吧”。
					</p>
				</div>
			</div>
			<div class="item">
				<img alt="大明湖" src="img/daminghu.jpg " />
				<div class="carousel-caption">
					<h4>大明湖</h4>
					<p>
						大明湖，位于山东省济南市市中心偏东北处、旧城区北部，是由济南众多泉水汇流而成，湖面58公顷，公园面积103.4公顷，平均水深2米左右，最深处达4.5米，是繁华都市中一处难得的天然湖泊，与趵突泉、千佛山并称为济南三大名胜，也是泉城济南重要的风景名胜、开放窗口和闻名中外的旅游胜地，素有“泉城明珠”的美誉。
					</p>
				</div>
			</div>
			<div class="item">
				<img alt="超然楼" src="img/zhaoranlou.jpg" />
				<div class="carousel-caption">
					<h4>超然楼</h4>
					<p>
						江北第一楼——超然楼，位于济南天下第一泉风景区大明湖畔。是一座拥有几百年历史的名楼，始建于元代。超然楼建筑面积5673平方米，坐落在宽大的汉白玉基上，顶覆铜瓦，楼高51.7米，上下共分七层，气势非常宏伟，号称"江北第一楼
						"。</p>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<!--
        	作者：thread_j@163.com
        	时间：2018-03-27
        	描述：轮播图结束
        -->


	<div class="container" style="margin-top: 50px;">
		<div class="row" style="margin-bottom: 35px;">
			<div class="col-md-6 " style="padding-right: 0;">
				<div style="height: 80px; background-color: white;">
					<img alt="welcome" src="img/welcome.png"
						style="opacity: 0.8; margin-top: 15px; margin-left: 10px;" />
				</div>
			</div>
			<div class="col-md-6" style="height: 70px; padding-left: 0;">
				<img alt="济南天气" src="img/tianqiyubao.jpg" align="left"
					style="padding-right: 0px; margin-left: 30px;" />
				<div style="height: 80px; background-color: white;">
					<iframe
						src="https://www.weaoo.com/cj/index.html?layout=layout1-classic"
						width="468px" height="80px" frameborder="0" marginwidth="0"
						marginheight="0" scrolling="no"
						style="margin-right: 0px; margin-left: 0;"></iframe>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="list-group">
					<a href="#" class="list-group-item active"
						style="font-family: '仿宋'; font-size: 22px; font-weight: bold; text-align: center; background-image: url(img/bg_home_policy.png);">旅游资讯</a>
					<s:iterator var="info" value="#session.myInfoList">
						<s:url value="/blog-getArticleById.action" var="getInfoById">
					  	    <s:param name="id"><s:property value="#info.id"/></s:param>
					  	</s:url>
						<div class="list-group-item iteminfo">
							<a href='<s:property value="#getInfoById"/>' class="info"><s:property value="#info.title"/></a>
						</div>
					</s:iterator>
					
					<a href="user/blog-loadArticles.action?sign=1" class="list-group-item" style="text-align: right;">更多<span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
			<div class="col-md-6">

				<div class="list-group">
					<a href="#" class="list-group-item active"
						style="font-family: '仿宋'; font-size: 22px; font-weight: bold; text-align: center; background-image: url(img/bg_home_policy.png);">旅游小记</a>
					
					<s:iterator var="blog" value="#session.myBlogList">
						<s:url value="/blog-getArticleById.action" var="getBlogById">
					  	    <s:param name="id"><s:property value="#blog.id"/></s:param>
					  	</s:url>
						<div class="list-group-item iteminfo">
							<a href='<s:property value="#getBlogById"/>' class="info"><s:property value="#blog.title"/></a>
						</div>
					</s:iterator>
					
					
					<a href="user/blog-loadArticles.action?sign=0" class="list-group-item" style="text-align: right;">更多<span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
	</div>



	<!--
        	作者：thread_j@163.com
        	时间：2018-03-28
        	描述：页脚
        -->
	<footer id="footer" class="text-muted"
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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#myCarousel').carousel({
				interval : 4000
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
</body>
</html>