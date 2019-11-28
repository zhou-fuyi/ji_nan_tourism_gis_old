<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="shortcut icon" href="<s:url value="/img/icon.jpg"></s:url>" />

<!-- 文章页引入css -->
<link href='<s:url value="/css/font-awesome.css"></s:url>' rel="stylesheet">
<link href="<s:url value="/css/animate.css"></s:url>" rel="stylesheet">
<link href="<s:url value="/css/style.css"></s:url>" rel="stylesheet">

<!-- Sweet Alert -->
<link href='<s:url value="/css/plugins/sweetalert/sweetalert.css"></s:url>' rel="stylesheet">

<!-- 登录模态框css -->
<link rel="stylesheet" type="text/css" href="<s:url value="/css/http _www.jq22.com_css_my.css"></s:url>" />


<link href="<s:url value="/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"></s:url>" rel="stylesheet">
<script type="text/javascript" src='<s:property value="/ueditor/third-party/SyntaxHighlighter/shCore.js"/>'></script>
<link rel="stylesheet" href='<s:url value="/ueditor/themes/default/css/ueditor.css"></s:url>'>

<link rel="stylesheet" type="text/css" href='<s:url value="/css/blog.css"></s:url>' />
<title><s:property value="#blog.title"/></title>
<style type="text/css">
.mylogo h3 {
	font-family: '楷体';
	font-weight: bold;
	padding-top: 0;
	margin-top: 16px;
}

.mylogo {
	text-decoration: none; /* 在这里进行样式去除无效  */
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
<body class="gray-bg">
    <nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
		    <div class="navbar-header">
			    <a href='<s:url value="/index.html"></s:url>' class="navbar-brand" style="padding: 0; margin-top: 0;">
				    <img src="<s:url value="/img/logo.png"></s:url>" alt="魅力济南">
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
						<a href='<s:url value="/user/blog-loadArticles.action?sign=1"></s:url>'>
							<span class="glyphicon glyphicon-list"></span> 资讯 
						</a>
					</li>
					<li><a href='<s:url value="/user/spot-loadScenic.action"></s:url>'><span class="glyphicon glyphicon-fire"></span>
						景区 </a></li>
					<li><a href='<s:url value="/map.jsp"></s:url>'><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
					<li  class="active">
						<a href='<s:url value="/user/blog-loadArticles.action?sign=0"></s:url>'>
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
						<li><a href="#">
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
    
   
    <!-- 文章内容开始   -->
    <div class="wrapper wrapper-content  animated fadeInRight article" style="margin-top: 50px;">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="pull-right">
                       		<s:iterator value="#request.keyWords" var="keys">
                            	<button class="btn btn-white btn-xs queryButton" type="button"><s:property value="keys"/></button>
                            </s:iterator>
                        </div>
                        <div class="text-center article-title">
                            <h1><s:property value="#request.blog.title"/> </h1>
                        </div>
                        <div class="blog_info" style="text-align: center">
							发布时间：『 <s:date name="#request.blog.time" format="yyyy/MM/dd HH:mm:ss"/>』&nbsp;&nbsp;博客类别：<s:if test="#request.blog.sign == 0">旅游小记</s:if><s:else>旅游资讯</s:else>&nbsp;&nbsp;阅读(<s:property value="#request.blog.clickHit"/>) 评论(<s:property value="#request.blog.repleHit"/>)
						</div>
						<br>
                        <div id="content">
                            
                        </div>
                        <!-- <div class="blog_lastAndNextPage">
							123456
						</div> -->
                        <hr>

                        <%-- <div class="row">
                            <div class="col-lg-12">

                                <h2>评论：</h2>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="./../img/a1.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    逆光狂胜蔡舞娘
                                                </a>
                                            <small class="text-muted">17 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            好东西，我朝淘宝准备跟进，1折开卖
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="./../img/a2.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    避雷范儿
                                                </a>
                                            <small class="text-muted"> 16 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            第一个真的好美 就是噪音太大了 挺唯美的意境瞬间变成工厂了
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="./../img/a3.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    kamppi
                                                </a>
                                            <small class="text-muted"> 6 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            好美的装置艺术，第二个让我想起了海中缓缓游动的鲸鱼。
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="./../img/a5.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    kamppi
                                                </a>
                                            <small class="text-muted">6 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            “Flylight 的灯管并不固定，由一套软件控制：每一个灯管都根据与其它灯管的互动进行移动，就像一群真正的鸟群一样。” 好像介绍的描述不对，灯管是固定的，控制的只是点亮和熄灭的时间，模拟成一团亮点移动
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div> --%>
                        
                        
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- 文章内容结束   -->
    
	<!-- 页脚 -->
	<footer id="footer " class="text-muted "
		style="background-color: #5E5E5E;padding: 20px;text-align: center;border-top: 1px solid #8C8C8C;color: #E3E3E3;margin-top: 20px; ">
	<div class="container ">
		<p>地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525" &nbsp;&nbsp;
			电话:178-6298-0863</p>
		<p>鲁ICP备 1818948. © 2018-2026 魅力济南行官网. &nbsp;&nbsp;Powered by
			Bootstrap.</p>
	</div>
	</footer>
	<!-- 页脚结束 -->
	
	<input type="hidden" id="hiddenContent" value='<s:property value="#request.blog.content"/>'>
	
	<!-- 全局js -->
    <script type="text/javascript" src='<s:url value="/js/jquery-3.3.1.min.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/js/bootstrap.min.js"></s:url>'></script>
	<script type="text/javascript" src="<s:url value="/js/login.js"></s:url>"></script>
	<script src="<s:url value="/js/plugins/sweetalert/sweetalert.min.js"></s:url>"></script>
	<script src='<s:url value="/ueditor/ueditor.parse.js"></s:url>'></script>



    <!-- 自定义js -->
    <script src='<s:url value="/js/content.js"></s:url>'></script>
	<script type="text/javascript">
		function loadContent(){
			document.getElementById('content').innerHTML = $('#hiddenContent').val();
			console.log($('#hiddenContent').val());
			console.log(document.getElementById('content').innerHTML);
		}
		loadContent();
		$('.queryButton').each(function(){
			$(this).click(function(){
				location.href = "/ji_nan_tourism_gis_old/user/result-queryByKeyWord.action?queryName=" + $(this).text();
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