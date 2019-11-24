<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href='<s:url value="/css/bootstrap.css"></s:url>' />
<link rel="shortcut icon" href='<s:url value="/img/icon.jpg"></s:url>' />

<link href='<s:url value="/css/font-awesome.css"></s:url>' rel="stylesheet">

<link href='<s:url value="/css/animate.css"></s:url>' rel="stylesheet">
<link href='<s:url value="/css/style.css"></s:url>' rel="stylesheet">
<title>魅力泉城欢迎您！中国济南——信息版</title>
</head>
<body class="gray-bg">
	<div class="container" style="margin-top: 80px;">
		<div class="row clearfix">
			<div class="col-md-12 column animated fadeInDown">
				<div class="jumbotron gray-bg">
					<h1 style="padding-left: 320px;">
						未登录用户!
					</h1>
				</div>
				<div class="col-md-3 column"></div>
				<div class="col-md-6 column">
					<div class="alert alert-dismissable alert-danger">
						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						<h4>
							注意!
						</h4> <strong>Warning!</strong> 您还没有登录或者登录超时，请重新登陆. <a href='<s:url value="/index.html"></s:url>' class="alert-link">首页</a>
					</div>
				</div>
				<div class="col-md-3 column"></div>
			</div>
		</div>
	</div>
</body>
</html>