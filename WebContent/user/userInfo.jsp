<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>魅力泉城欢迎您！中国济南——我的账户</title>
<link rel="stylesheet" type="text/css" href='<s:url value="/css/bootstrap.css"></s:url>' />

<!-- Sweet Alert -->
<link href='<s:url value="/css/plugins/sweetalert/sweetalert.css"></s:url>' rel="stylesheet">

<link href='<s:url value="/css/animate.min.css"></s:url>' rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href='<s:url value="/css/http _www.jq22.com_css_my.css"></s:url>' />
<link rel="stylesheet" href='<s:url value="/css/font-awesome.min.css"></s:url>'>
<link rel="shortcut icon" href='<s:url value="/img/icon.jpg"></s:url>' />

<link rel="stylesheet" type="text/css" href='<s:url value="/css/blog.css"></s:url>' />

<link rel="stylesheet" type="text/css" href="/ji_nan_tourism_gis_old/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/ji_nan_tourism_gis_old/easyui/themes/icon.css">
<script type="text/javascript" src="/ji_nan_tourism_gis_old/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/ji_nan_tourism_gis_old/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/ji_nan_tourism_gis_old/easyui/locale/easyui-lang-zh_CN.js"></script>


<!-- fileInput -->
<link rel="stylesheet" type="text/css"
	href='<s:url value="/bootstrap/fileinput/css/fileinput.css"></s:url>'>

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
				<li><a href='<s:url value="/index.html"></s:url>'> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页
				</a></li>
				<li><a href='<s:url value="/user/blog-loadArticles.action?sign=1"></s:url>'><span class="glyphicon glyphicon-list"></span>
						资讯 </a></li>
				<li><a href='<s:url value="/user/spot-loadScenic.action"></s:url>'><span class="glyphicon glyphicon-fire"></span>
						景区 </a></li>
				<li><a href='<s:url value="/map.jsp"></s:url>'><span class="glyphicon glyphicon-transfer"></span>
						路线 </a></li>
				<li>
					<a href='<s:url value="/user/blog-loadArticles.action?sign=0"></s:url>'>
						<span class="glyphicon glyphicon-flag"></span> 游记
					</a>
				</li>
				<li><a href='<s:url value="/aboutInfo.jsp"></s:url>'><span
						class="glyphicon glyphicon-question-sign"></span> 关于 </a></li>
				<s:if test="#session.user == null">
				    <li><a href='<s:url value="/register.jsp"></s:url>'
						style="padding-right: 0; margin-right: 0;"><span
							class="glyphicon glyphicon-user"></span> 注册/ </a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal"
						style="padding-left: 0; margin-left: 0;">登录</a></li>
				</s:if>
				<s:else>
					<li class="active"><a href='<s:url value="/user/users-loadUserArticles.action"></s:url>'>
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


	<div class="container" style="margin-top: 80px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-info">
					账号设置
				</h3>
				
				<hr style="color: black;"/>
				<div class="tabbable" id="tabs-408152">
					<ul class="nav nav-tabs" style="padding-bottom: 20px;">
						<li class="active">
							 <a href="#panel-993088" data-toggle="tab">我的主页</a>
						</li>
						<li>
							 <a href="#panel-993081" data-toggle="tab">我的资料</a>
						</li>
						<li>
							 <a href="#panel-487335" data-toggle="tab">头像</a>
						</li>
						<li>
							 <a href="#panel-487345" data-toggle="tab">密码</a>
						</li>
						<li>
							 <a href="#panel-487355" data-toggle="tab">写游记</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-993088">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<div class="jumbotron">
										<div style="text-align: center">
											<img alt="" src='/ji_nan_tourism_gis_old<s:property value="#session.user.userPicture"/>'>
											<h1>
												<s:property value="#session.user.userName"/>
											</h1>
											<p style="margin-bottom: 0px;">
												注册时间：<s:date name="#session.user.registerTime" format="yyyy/MM/dd HH:mm:ss"/>
											</p>
										</div>
									</div>
									<!-- .jumbotron end -->
									
									<div style="text-align: center">
										<label style="font-size: 22px;">主页</label>
									</div>
									
									
									<div class="data_list">
										<div class="data_list_title">
										<img src="../img/list_icon.png"/>
										我的游记列表</div>
										<div class="datas">
											<ul>
											  <s:if test="#session.user.articleSet != null">
											  <s:iterator var="blog" value="#session.userArticle.beanList">
											  	  <li style="margin-bottom: 30px">
											  	  <s:url value="/user/blog-getArticleById.action" var="getBlogById">
											  	      <s:param name="id"><s:property value="#blog.id"/></s:param>
											  	  </s:url>
											  	  <span style="float:right;"><a id="modal-393522" href="#modal-container-393522" role="button" data-toggle="modal" class="btn btn-primary" data-whatever='<s:property value="#blog.id"/>'>修改</a></span>
												  	<span class="date"><a href='<s:property value="#getBlogById"/>'><s:date name="#blog.time" format="yyyy/MM/dd HH:mm:ss"/></a></span>
												  	
												  	<span class="title"><a href="<s:property value="#getBlogById"/>"><s:property value="#blog.title"/></a></span>
												  	<s:url value="/user/blog-deleteArticleByUser.action" var="deleteArticle">
												  		<s:param name="id"><s:property value="#blog.id"/></s:param>
												  	</s:url>
												  	<span style="float:right;"><a href="#" class="btn btn-warning deleteArticle" name='<s:property value="#blog.id"/>'  style="margin-top:0px;">删除</a></span>
												  	
												  	<div style="height: 10px;"></div>
												  	<span class="summary">摘要: <s:property value="#blog.subject"/>...</span>
												  	<%-- <span class="img">
												  		 <c:forEach var="image" items="${blog.imagesList }">
													  		<a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html">${image }</a>
													  		&nbsp;&nbsp;
												  		</c:forEach>
												  	</span> --%>
												  	<span class="info">发表于 <s:date name="#blog.time" format="yyyy/MM/dd HH:mm:ss"/> 阅读(${blog.clickHit}) 评论(${blog.repleHit}) </span>
												  </li>
												  <hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:  10px;" />
											  </s:iterator>
											  </s:if>
											  <s:else>
											      <div class="alert alert-success alert-dismissable" style="margin-top: 20px;">
													 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
													<h4>
														注意!
													</h4> <strong>Warning!</strong> 您还没有发表过任何一篇游记. <a href="#" class="alert-link" data-toggle="tab">alert link</a>
												</div>
											  </s:else>
											</ul>
										</div>
								   </div>
								   
								   
								   <div class="modal fade" id="modal-container-393522" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog" style="width: 1200px;">
											<div class="modal-content">
												<div class="modal-header">
													 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
													<h4 class="modal-title" id="myModalLabel">
														修改游记
													</h4>
												</div>
												<div class="modal-body">
													<div class="container">
														<div class="row clearfix">
															<div class="col-md-12 column">
															    <div id="p" class="easyui-panel" title="修改个人游记" style="padding: 10px;width: 1140px;">
																 	<!-- 隐藏域 -->
																 	<input type="hidden" name="id" id="id"/>
																 	
																 	<table cellspacing="20px" style="border-spacing: 20px; border-collapse: separate;">
																 		<tbody style="">
																	   		<tr style="margin-left: 15px;">
																	   			<td width="80px">博客标题：</td>
																	   			<td><input type="text" id="title" name="title" style="width: 400px;"/></td>
																	   		</tr>
																	   		<tr>
																	   			<td>所属类别：</td>
																	   			<td>
																	   				<select class="easyui-combobox" style="width: 154px" id="blogTypeId" name="blogType.id" editable="false" panelHeight="auto" >
																						<option value="">请选择博客类别...</option>	
																					    <option value="0" selected="selected">旅游小记</option>	
																	                </select>
																	   			</td>
																	   		</tr>
																	   		<tr>
																	   			<td valign="top">博客内容：</td>
																	   			<td>
																	   			    <!-- 加载编辑器的容器 -->
																					<script id="container" name="content" type="text/plain" style="width:950px;height:500px;" ></script>
																	   			</td>
																	   		</tr>
																	   		<tr>
																	   			<td>关键字：</td>
																	   			<td><input type="text" id="keyWord" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用空格隔开)</td>
																	   		</tr>
																	   		<tr>
																	   			<td></td>
																	   			<td>
																	   				<!-- <a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a> -->
																	   				<div class="alert alert-success alert-dismissable" style="margin-top: 20px;">
																						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
																						<h4>
																							注意!
																						</h4> <strong>Warning!</strong> 编辑完毕后，在后下方点击保存完成修改操作.
																					</div>
																	   			</td>
																	   		</tr>
																	   	</tbody>
																   	</table>
																 </div>
																 <!-- end 博客div -->
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button onclick="submitData()" type="button" class="btn btn-primary">保存</button>
												</div>
											</div>
											
										</div>
										
									</div>
								   
								   
								   
								   <nav>
									   <div id="example" style="text-align: center"> <ul id="pageLimit"></ul> </div>
								   </nav>
									
								</div>
							</div>
						</div>
						<div class="tab-pane" id="panel-993081">
							<div class="col-sm-6" style="margin-top: 30px;">
								<form action='<s:url value="/user/users-updateUserInfo.action"></s:url>' name="userSelf" method="post" id="userSelfAction"  class="form-horizontal">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">注册邮箱</label>
									<input type="hidden" name="userId" id="userId" value='<s:property value="#session.user.userId"/>' >
								    <div class="col-sm-10">
								    	<p class="form-control-static"><s:property value="#session.user.userEmail"/></p>
								    </div>
							   </div>
							   <div class="form-group">
							       <label for="inputPassword3" class="col-sm-2 control-label">用户名</label>
								   <div class="col-sm-10">
								       <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名" value='<s:property value="#session.user.userName"/>'>
								   </div>
							   </div>
							   <div class="form-group">
							       <label for="inputPassword3" class="col-sm-2 control-label">昵称</label>
								   <div class="col-sm-10">
								       <input type="text" class="form-control" name="userCname" id="userCname" placeholder="昵称" value='<s:property value="#session.user.userCname"/>'>
								   </div>
							   </div>
							   <div class="form-group">
							       <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
								   <div class="col-sm-10">
								       <input type="text" class="form-control" name="userGender" id="userGender" placeholder="性别：男/女" value='<s:property value="#session.user.userGender"/>'>
								   </div>
							   </div>
							   <div class="form-group">
							       <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
								   <div class="col-sm-10">
								       <input type="text" class="form-control" name="userAge" id="userAge" placeholder="年龄:请输入数字" value='<s:property value="#session.user.userAge"/>'>
								   </div>
							   </div>
							   <div class="form-group">
							       <label for="inputPassword3" class="col-sm-2 control-label">联系电话</label>
								   <div class="col-sm-10">
								       <input type="text" class="form-control" name="userTel" id="userTel" placeholder="联系电话" value='<s:property value="#session.user.userTel"/>'>
								   </div>
							   </div>
							   <div class="form-group" style="margin-top: 20px;">
							       <div class="col-sm-4"></div>
							       <div class="col-sm-8"><button type="button" id="submitSelfInfo" class="btn btn-primary">提交（个人信息）</button></div>
							       
							   </div>
							</form>
							</div>
							<div class="col-sm-6"></div>
						</div>
						<!-- 头像上传 -->
						<div class="tab-pane" id="panel-487335">
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<div class="alert alert-dismissable alert-info">
											 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
											<h4>
												注意!
											</h4> <strong>Warning!</strong> 在进行头像上传的时候，请注意图片的尺寸，最好为168*168，支持jpg、png、gif，最大不能超过100KB. 
										</div>
									</div>
									<div class="col-md-12 column">
										<div class="col-md-10 column">
											<div class="form-group">
										       <label for="inputPassword3" class="col-sm-2 control-label">上传头像</label>
											   <div class="col-sm-10">
											   
											       <input type="file" class="file form-control" name="file" id="userSelfImg" placeholder="请选择你喜欢的图片">
											   </div>
										   </div>
										</div>
										<div class="col-md-2 column">
											<input type="text" name="userPicture" id="userPicture">
										</div>
									
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="panel-487345">
							<div class="col-sm-6" style="margin-top: 30px;">
								<form action='<s:url value="/user/users-updateUserInfo.action"></s:url>' method="post" id="userPassAction" class="form-horizontal">
									<div class="form-group">
										
										<label for="inputEmail3" class="col-sm-2 control-label">原密码</label>
										<input type="hidden" name="userId" id="userId2" value='<s:property value="#session.user.userId"/>' >
									    <div class="col-sm-10" id="userPassDiv">
									    	<input type="text" class="form-control" name="userPass" id="userPass" placeholder="请输入原始密码" onblur="checkUserPass()">
									    </div>
								   </div>
								   <div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">新密码</label>
									    <div class="col-sm-10" id="newPassDiv">
									    	<input type="password" class="form-control" name="newPass" id="newPass" placeholder="请输入新的密码" onblur="checkNewPass()">
									    </div>
								   </div>
								   <div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">确认密码</label>
									    <div class="col-sm-10" id="rePasswordDiv">
									    	<input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="请输入新密码" onblur="checkRePassWord()">
									    </div>
								   </div>
								   <div class="form-group" style="margin-top: 20px;">
							       <div class="col-sm-4"></div>
							       <div class="col-sm-8"><button type="button" id="submitSelfPass" class="btn btn-primary">确认修改</button></div>
							       
							   </div>
							   </form>
						   </div>
						   <div class="col-sm-6"></div>
						   
						</div>
						<div class="tab-pane" id="panel-487355">
						    <!-- 写博客开始  -->

									<div class="col-md-12 column">
									
									    <div id="p" class="easyui-panel" title="编写博客" style="padding: 10px;width: 1140px;">
										 	<table cellspacing="20px" style="border-spacing: 20px; border-collapse: separate;">
										 		<tbody style="">
											   		<tr style="margin-left: 15px;">
											   			<td width="80px">博客标题：</td>
											   			<td><input type="text" id="title1" name="title" style="width: 400px;"/></td>
											   		</tr>
											   		<tr>
											   			<td>所属类别：</td>
											   			<td>
											   				<select class="easyui-combobox" style="width: 154px" id="blogTypeId1" name="blogType.id" editable="false" panelHeight="auto" >
																<option value="">请选择博客类别...</option>	
															    <option value="0" selected="selected">旅游小记</option>	
											                </select>
											   			</td>
											   		</tr>
											   		<tr>
											   			<td valign="top">博客内容：</td>
											   			<td>
											   			    <!-- 加载编辑器的容器 -->
															<script id="container1" name="content" type="text/plain" style="width:950px;height:500px;"></script>
											   			</td>
											   		</tr>
											   		<tr>
											   			<td>关键字：</td>
											   			<td><input type="text" id="keyWord1" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用空格隔开)</td>
											   		</tr>
											   		<tr>
											   			<td></td>
											   			<td>
											   				<a href="javascript:submitData1()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a>
											   			</td>
											   		</tr>
											   	</tbody>
										   	</table>
										 </div>
										 <!-- end 博客div -->
									</div>
						    <!-- 写博客结束 --> 
						    <%-- <jsp:include page="./../article/addArticle.jsp"></jsp:include> --%>
						</div>
					</div>
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
	
	<%-- <script type="text/javascript" src='<s:url value="/js/jquery-3.3.1.min.js"></s:url>'></script> --%>
	<script type="text/javascript" src='<s:url value="/js/bootstrap.min.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/js/login.js"></s:url>'></script>
	<script src='<s:url value="/js/plugins/sweetalert/sweetalert.min.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/js/bootstrap-paginator.js"></s:url>'></script>
	<!-- Ueditor编辑器插件 -->
	<script type="text/javascript" src='<s:url value="/ueditor/ueditor.config.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/ueditor/ueditor.all.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/js/updatePass.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/bootstrap/fileinput/js/fileinput.js"></s:url>'></script>
	<script type="text/javascript" src='<s:url value="/bootstrap/fileinput/js/zh.js"></s:url>'></script>
	<script type="text/javascript">


		$("#userSelfImg").fileinput({
			language : 'zh',
			uploadUrl : "/ji_nan_tourism_gis_old/user/img-saveUserPicture.action",
			autoReplace : true,
			maxFileCount : 1,
			allowedFileExtensions : [ "jpg", "png", "gif" ],
			browseClass : "btn btn-primary", //按钮样式 
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
		}).on("fileuploaded", function(e, data) {
			var res = data.response;
			if (res != -1) {
				$('#userPicture').val(res);
				console.log(res);
				var url = "/ji_nan_tourism_gis_old/user/users-updateUserPicture.action";
				var args = {'userPicture' : res};
				$.getJSON(url, args, function(result){
					if(result == 1){
						alert("上传成功");
						window.location.reload();
					}else{
						alert("上传失败，图片更新失败，估计是用户掉线");
					}
				});
				
			} else {
				alert('上传失败 , 失败原因： 系统异常');
			}
		});

	
		$('#pageLimit').bootstrapPaginator({
	         currentPage: <s:property value="#session.userArticle.pageCode"/>,//当前的请求页面。
	         totalPages: <s:property value="#session.userArticle.totalPage"/>,//一共多少页。
	         size:"large",//应该是页眉的大小。
	         bootstrapMajorVersion: 3,//bootstrap的版本要求。
	         alignment:"right",
	         shouldShowPage:true,
	         numberOfPages:5,//一页列出多少数据。
	         itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
		         switch (type) {
			         case "first": return "首页";
			         case "prev": return "上一页";
			         case "next": return "下一页";
			         case "last": return "末页";
		             case "page": return page;
		         }
		     },
		     onPageClicked: function (event, originalEvent, type, page) {
			     //点击事件
                location.href = "/ji_nan_tourism_gis_old/user/users-loadUserArticles?pageCode=" + page;
            }
	    }); 
		
	</script>
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

		var ue = UE.getEditor('container');
		
		var ue1 = UE.getEditor('container1');
        function submitData1(){
    		var title=$("#title1").val();
    		console.log(title);
    		var blogTypeId=$("#blogTypeId1").combobox("getValue");
    		console.log(blogTypeId);
    		var content = ue1.getContent();
    		console.log(content);
    		var keyWord=$("#keyWord1").val();
    		console.log(keyWord);
    		
    		if(title==null || title==''){
    			alert("请输入标题！");
    		}else if(blogTypeId==null || content==''){
    			alert("请输入内容！");
    		}else if(content==null || content==''){
    			alert("请输入内容！");
    		}else{
    			$.post("/ji_nan_tourism_gis_old/blog-addBlog.action",{'title':title,'content':content,'subject':ue1.getContentTxt().substr(0,155),'keyWord':keyWord,'sign':blogTypeId},function(result){
        			console.log(result);
    				if(result == "1"){
    					alert("游记发布成功！");
    					resetValue1();
    					location.reload();
    				}else if(result == "-1"){
        				console.log("当前会话已失效,需要重新登陆");
    					alert("博客发布失败！");
    				}else if(reuslt == "0"){
        				console.log("系统异常  后台没有接收到Article数据");
    					alert("博客发布失败！");
       				}
    			},"json");
    		}
    	}

        function submitData(){
    		var title=$("#title").val();
    		console.log(title);
    		var blogTypeId=$("#blogTypeId").combobox("getValue");
    		console.log(blogTypeId);
    		var content = ue.getContent();
    		console.log(content);
    		var keyWord=$("#keyWord").val();
    		console.log(keyWord);
    		
    		if(title==null || title==''){
    			alert("请输入标题！");
    		}else if(blogTypeId==null || content==''){
    			alert("请输入内容！");
    		}else if(content==null || content==''){
    			alert("请输入内容！");
    		}else{
    			$.post("/ji_nan_tourism_gis_old/blog-editUserArticle.action",{'id':$('#id').val(),'title':title,'content':content,'subject':ue.getContentTxt().substr(0,155),'keyWord':keyWord,'sign':blogTypeId},function(result){
        			console.log(result);
    				if(result == "1"){
    					alert("游记修改成功！");
    					resetValue();
    					location.reload();
    				}else if(result == "-1"){
        				console.log("当前会话已失效,需要重新登陆");
    					alert("博客发布失败！");
    				}else if(reuslt == "0"){
        				console.log("系统异常  后台没有接收到Article数据");
    					alert("博客发布失败！");
       				}
    			},"json");
    		}
    	}
    	
    	// 重置数据
    	function resetValue1(){
    		$("#title1").val("");
    		//$("#blogTypeId").combobox("setValue","");
    		ue1.setContent("");
    		$("#keyWord1").val("");
    		//alert("jinlail");
    	}

    	function resetValue(){
    		$("#title").val("");
    		//$("#blogTypeId").combobox("setValue","");
    		ue.setContent("");
    		$("#keyWord").val("");
    		//alert("jinlail");
    	}

    	 $('#modal-container-393522').on('show.bs.modal', function (event) {
             var button = $(event.relatedTarget) // Button that triggered the modal
             var articleId = button.data('whatever') // 从button 的 data-* 属性获取参数值
             console.log(articleId);
             var modal = $(this)
             //modal.find('.modal-title').text('New message to ' + recipient)
             // modal.find('.modal-body input').val(recipient)
             modal.find('#id').val(articleId) //  找到 colorName 并赋值
             var url = "/ji_nan_tourism_gis_old/blog-getUserArticleById.action";
             var args = {'id' : articleId};
         
             $.getJSON(url, args, function(data){
            	 if(data != -1){
                     console.log("正常");
                     console.log(data);
                     console.log(data.title);
                     console.log(data.content);
                     console.log(data.keyWord);
                     $('#title').val(data.title);
             		 ue.setContent(data.content);
             		$('#keyWord').val(data.keyWord);
                 }else{
                     console.log("异常");
                 }
             }); 
           })
           
           $('.deleteArticle').click(function(){
        	   var id =$(this).prop('name');
        	   swal({
          	        title: "您确定要删除这则游记吗？",
          	        text: "删除后无法恢复，请谨慎操作！",
          	        type: "warning",
          	        showCancelButton: true,
          	        confirmButtonColor: "#DD6B55",
          	        confirmButtonText: "删就删了",
          	        closeOnConfirm: false
          	    }, function () {
          	        swal("操作成功！", "您已经成功删除。", "success");
          	       
          	        window.location.href = "/ji_nan_tourism_gis_old/user/blog-deleteArticleByUser.action?id=" + id;
          	    });
           });

         $('#submitSelfInfo').click(function(){
             console.log($('#userSelfAction').serializeArray());
             var url = "/ji_nan_tourism_gis_old/user/users-updateUserInfo.action";
             var args = {
                     'userId' : $.trim($('#userId').val()),
                     'userName' : $.trim($('#userName').val()),
                     'userCname' : $.trim($('#userCname').val()),
                     'userGender' : $.trim($('#userGender').val()),
                     'userAge' : $.trim($('#userAge').val()),
                     'userTel' : $.trim($('#userTel').val())
                 };
             console.log(args);
             $.getJSON(url, args, function(data){
                 if(data == 1){
                     alert("修改成功");
                     window.location.reload();
                 }else{
                     alert("修改失败");
                 }
             });
         });

	</script>
</body>
</html>