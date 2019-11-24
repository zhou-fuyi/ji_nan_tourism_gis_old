<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="../../bootstrap/css/bootstrap.css">
<script type="text/javascript" src="./../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./../../bootstrap/js/bootstrap.js"></script>

<!-- Sweet alert -->
<link href="./../../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="./../../css/animate.css" rel="stylesheet">
<!-- <link href="../../../css/style.css" rel="stylesheet"> -->
<script src="./../../js/plugins/sweetalert/sweetalert.min.js"></script>
<title>添加资源</title>
<style type="text/css">
	.text{
		text-align: center;
	}
	.text label{
	    margin-top: 7px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="jumbotron" style="text-align: center;">
					<h1>添加资源</h1>

				</div>
			</div>
		</div>
		<form action="adminRole-addRole.action" id="roleForm">
			<div class="row clearfix">
				<div class="col-md-12 column">
				    <!-- 隐藏域 -->
					<input type="hidden" id="id" name="id">
					
					<table class="table">
						<tr>
							<td class="text"><label>资源名称</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="resName" name="resName" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入资源名称">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>权限组别</label></td>
							<td>
							    <div id="remarkDiv">
							    	<select class="form-control" id="remark" name="remark" onchange="checkremark()">
							    	    <option value="" selected="selected">请选择资源所在权限组别</option>
							    	    <option value="景点管理">景点管理</option>
							    	    <option value="文章管理">文章管理</option>
							    	    <option value="图片管理">图片管理</option>
							    	    <option value="用户管理">用户管理</option>
							    	    <option value="权限管理">权限管理</option>
							    	</select>
							    </div>
							</td>
							<td class="text"><label>是否启用</label></td>
							<td>
							    <div id="isUsedDiv">
							    	<select class="form-control" id="isUsed" name="isUsed" onchange="checkIsUsed()">
							    	    <option value="" selected="selected">请确认是否启用该资源...</option>
							    	    <option value="1">启用</option>
							    	    <option value="0">不启用</option>
							    	</select>
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>资源描述</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="detail"
									class="form-control" name="detail"></textarea></td>
						</tr>
						
					</table>
				</div>
			</div>
		</form>
		
		<div class="row clearfix">
			<div class="col-md-5 column"></div>
			<div class="col-md-2 column">
				<input type="button" id="submit" class="btn btn-primary form-control" value="保存">
			</div>
			<div class="col-md-5 column"></div>
		</div>
		
	</div>
	<script type="text/javascript" src="../js/addResource.js"></script>
</body>
</html>