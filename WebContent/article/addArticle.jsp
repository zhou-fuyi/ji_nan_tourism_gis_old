<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="../img/icon.jpg" />

<!-- 登录模态框css -->
<link rel="stylesheet" type="text/css" href="./../css/http _www.jq22.com_css_my.css" />

<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="/jinan_tourism_gis/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/jinan_tourism_gis/easyui/themes/icon.css">
<script type="text/javascript" src="/jinan_tourism_gis/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/jinan_tourism_gis/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jinan_tourism_gis/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>写博客</title>
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
/* .panel panel-htop{
    margin-top: 100px;
} */
</style>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
		    <div class="navbar-header">
			    <a href="./../index.html" class="navbar-brand" style="padding: 0; margin-top: 0;">
				    <img src="../img/logo.png" alt="魅力济南">
			    </a>
			    <a href="./../index.html" class="navbar-nav mylogo" style="text-decoration: none;">
                	<h3 style="font-size: 24px;">在旅途</h3>
			    </a>
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">切换导航</span><span class="icon-bar"></span>
					<span class="icon-bar"></span><span class="icon-bar"></span>
				</button>
		    </div>
	        <div class="collapse navbar-collapse" id="navbar-collapse">
		        <ul class="nav navbar-nav navbar-left" style="margin-top: 0; margin-left: 80px;">
					<li>
						<a href="./../index.html">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 
						</a>
					</li>
					<li>
						<a href="./../info/infoList.jsp">
							<span class="glyphicon glyphicon-list"></span> 资讯 
						</a>
					</li>
					<li>
						<a href="./../map.jsp">
							<span class="glyphicon glyphicon-fire"></span> 景区
						</a>
					</li>
					<li>
						<a href="./../article/articleList.jsp">
							<span class="glyphicon glyphicon-flag"></span> 游记
						</a>
					</li>
					<li>
						<a href="./../aboutInfo.jsp">
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
					    <li><a href="#" id="logout" onclick="logout()"
							style="padding-right: 0; margin-right: 0;"><span
								class="glyphicon glyphicon-user"></span>下线 </a></li>
					</s:else>
				</ul>
				<form class="navbar-form navbar-left formbar form-inline" role="search">
				<div class="form-group">
					<div class="input-group" style="height: 35px;">
						<input class="form-control" type="text" style="height: 35px;" />
						<div class="input-group-addon" style="height: 35px; padding: 0;">
							<button type="submit" class="btnbar btn" style="margin: 0;"></button>
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
				<script type="text/javascript" src="./../js/login.js"></script>
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
    
    <!-- 写博客开始  -->
    <div class="container" style="margin-top: 80px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
			
			    <div id="p" class="easyui-panel" title="编写博客" style="padding: 10px;">
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
									    <option value="0">旅游小记</option>	
									    <option value="1">新奇见闻</option>			
					                </select>
					   			</td>
					   		</tr>
					   		<tr>
					   			<td valign="top">博客内容：</td>
					   			<td>
					   			    <!-- 加载编辑器的容器 -->
									<script id="container" name="content" type="text/plain" style="width:950px;height:500px;"></script>
					   			</td>
					   		</tr>
					   		<tr>
					   			<td>关键字：</td>
					   			<td><input type="text" id="keyWord" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用空格隔开)</td>
					   		</tr>
					   		<tr>
					   			<td></td>
					   			<td>
					   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a>
					   			</td>
					   		</tr>
					   	</tbody>
				   	</table>
				 </div>
				 <!-- end 博客div -->
			</div>
		</div>
	</div>
    <!-- 写博客结束 -->
    
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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<!-- Ueditor编辑器插件 -->
	<script type="text/javascript" src="/jinan_tourism_gis/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/jinan_tourism_gis/ueditor/ueditor.all.js"></script>
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
        var ue = UE.getEditor('container');
        
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
    			$.post("/jinan_tourism_gis/blog-addBlog.action",{'title':title,'content':content,'subject':ue.getContentTxt().substr(0,155),'keyWord':keyWord,'sign':blogTypeId},function(result){
        			console.log(result);
    				if(result == "1"){
    					alert("博客发布成功！");
    					resetValue();
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
    	function resetValue(){
    		$("#title").val("");
    		$("#blogTypeId").combobox("setValue","");
    		ue.setContent("");
    		$("#keyWord").val("");
    		//alert("jinlail");
    	}
    </script>

</body>
</html>