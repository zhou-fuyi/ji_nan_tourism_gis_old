<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/http _www.jq22.com_css_my.css" />
<link rel="stylesheet" href="css/http _www.jq22.com_css_dl.css" />
<link rel="shortcut icon" href="img/icon.jpg" />

<style type="text/css">
.mylogo h3 {
	font-family: '楷体';
	font-weight: bold;
	padding-top: 0;
	margin-top: 16px;
}

.mylogo {
	text-decoration: none; /*在这里进行样式去除无效 */
	color: #333;
	margin: 0;
	height: 50px;
	text-align: center;
}

.carousel-inner .item img {
	margin: 0 auto;
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

/* .formbar button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
} */
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
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="index.html" class="navbar-brand"
				style="padding: 0; margin-top: 0;"> <img src="img/logo.png"
				alt="魅力济南">
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
				style="margin-top: 0; margin-left: 80px;">
				<li><a href="index.html"> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页
				</a></li>
				<li><a href="user/blog-loadArticles.action?sign=1"><span
						class="glyphicon glyphicon-list"></span> 资讯 </a></li>
				<li><a href="user/spot-loadScenic.action"><span class="glyphicon glyphicon-fire"></span>
						景区 </a></li>
				<li><a href="map.jsp"><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
				<li><a href="user/blog-loadArticles.action?sign=0"> <span
						class="glyphicon glyphicon-flag"></span> 游记
				</a></li>
				<li><a href="aboutInfo.jsp"><span
						class="glyphicon glyphicon-question-sign"></span> 关于 </a></li>

				<li class="active"><a href="register.jsp"><span
						class="glyphicon glyphicon-user"></span> 注册 </a></li>
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

	<div class="login" style="margin-top: 30px;">
		<div class="loingnr">
			<div class="modal-body">
				<s:form action="user-register.action" namespace="/"
					name="registerForm" id="registerForm" method="post">
					<div class="input-group input-group-lg" style="position: relative;">
						<span class="input-group-addon" id="sizing-s1"><i
							class="glyphicon glyphicon-envelope youxiang" style="width: 18px"
							data-trigger="manual" data-placement="left" title="对不起，不支持此邮箱！"></i></span>
						<input id="myemail" class="form-control " placeholder="请输入登录邮箱"
							style="height: 50px;" aria-describedby="sizing-addon1"
							type="text" name="userEmail" size="30" onblur="emailgs(this)">
						<span class="input-group-btn tccBut"> <input type="button"
							id="bt" class="btn btn-success "
							style="width: 130px; font-size: 15px; line-height: 28px"
							value="获取验证码" />
						</span>
					</div>
					<div class="alert alert-danger errts top10" id="empdts"
						role="alert" style="display: none">
						<i class="fa fa-info-circle"></i> <span id="erremailts">
							此邮箱已经被注册过</span>
					</div>

					<div class="input-group input-group-lg top20">
						<span class="input-group-addon" id="sizing-s2"><i
							class="glyphicon glyphicon-user fa-user-secret"
							style="width: 18px" data-trigger="manual" data-placement="left"></i>
						</span> <input type="text" class="form-control" id="myhm"
							placeholder="用户名" name="userName"
							aria-describedby="sizing-addon1" onblur="yhmok(this)">
					</div>
					<div class="alert alert-danger errts top10" id="yhts" role="alert"
						style="display: none">
						<i class="fa fa-info-circle"></i> <span id="erreyhmts">
							此用户名已经被使用过</span>
					</div>

					<div class="input-group input-group-lg top20">
						<span class="input-group-addon" id="sizing-s5"><i
							class="glyphicon glyphicon-qrcode activationCode"
							data-placement="left" style="width: 18px"></i></span> <input type="text"
							class="form-control" id="yzm" name="activationCode"
							onblur="verification(this)" placeholder="请输入验证码"
							aria-describedby="sizing-addon1">
					</div>
					<div class="input-group input-group-lg top20">
						<span class="input-group-addon" id="sizing-s3"> <i
							id="userPass" class="glyphicon glyphicon-lock fa-lock"
							style="width: 18px" data-trigger="manual" data-placement="left"></i></span>
						<input type="password" class="form-control" id="pwd1"
							name="userPass" placeholder="请输入登录密码"
							aria-describedby="sizing-addon1" onblur="pwdpd()">
					</div>
					<div class="input-group input-group-lg top20">
						<span class="input-group-addon" id="sizing-s4"><i
							class="glyphicon glyphicon-retweet fa-key" style="width: 18px"
							data-trigger="manual" data-placement="left" title="确认密码输入错误！"></i></span>
						<input type="password" class="form-control" id="pwd2"
							name="rePassword" style="height: 50px;" placeholder="确认登录密码"
							aria-describedby="sizing-addon1" onblur="confirmPass()">
						<span class="input-group-btn tccBut"> <input type="button"
							class="btn btn-success" style="width: 130px" onclick="tj()"
							value="注册">
						</span>
					</div>
					<p>
						<input type="checkbox" class="check" checked>同意 <a
							class="modalLink" href="#" class="btn btn-default"
							data-toggle="tooltip" data-html="true" data-placement="top"
							title="注册声明
		一、用户注册、登陆，视为接受本协议的约束。
		二、用户承诺遵守国家的法律法规及部门规章
		三、用户承诺遵守“jQuery插件库”的知识产权政策.
		四、站内插件用于行业交流、学习。
		五、用户侵犯第三人的知识产权，由该用户承担全部法律责任。
        
        版权声明
		jQuery插件库（www.jq22.com）站内所有涉及插件及代码由会员上传而来，jQuery插件库不拥有此类插件及代码的版权
		jQuery插件库作为jQuery插件网络服务提供者，对非法转载，盗版行为的发生不具备充分的监控能力。但是当版权拥有者提出侵权指控并出示充分的版权证明材料时，jQuery插件库负有移除盗版和非法转载作品以及停止继续传播的义务。jQuery插件库在满足前款条件下采取移除等相应措施后不为此向原发布人承担违约责任或其他法律责任，包括不承担因侵权指控不成立而给原发布人带来损害的赔偿责任。
		如果版权拥有者发现自己作品被侵权，请及时向jQuery插件库提出权利通知，并将姓名、电话、身份证明、权属证明、具体链接（URL）及详细侵权情况描述发往版权举报专用通道，jQuery插件库在收到相关举报文件后，在3个工作日内移除相关涉嫌侵权的内容
		QQ：67971087（周一到周五，9：30-18:00）">《注册声明》《版权声明》</a>
					</p>
				</s:form>
			</div>
		</div>

	</div>
	<footer id="footer" class="text-muted"
		style="background-color: #5E5E5E;padding: 20px;text-align: center;border-top: 1px solid #8C8C8C;color: #E3E3E3;margin-top: 20px; ">
	<div class="container" style="margin-bottom: 10px;">
		<p style="padding-bottom: 10px;">地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525"
			&nbsp;&nbsp; 电话:178-6298-0863</p>
		<p>鲁ICP备 1818948. © 20018-2026 魅力济南行官网. &nbsp;&nbsp;Powered by
			Bootstrap.</p>
	</div>
	</footer>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
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