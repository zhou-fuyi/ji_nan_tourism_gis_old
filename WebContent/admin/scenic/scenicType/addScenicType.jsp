<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<link rel="stylesheet" type="text/css"
	href="../../../bootstrap/css/bootstrap.css">


<!-- fileInput -->
<link rel="stylesheet" type="text/css"
	href="../../../bootstrap/fileinput/css/fileinput.css">
<script type="text/javascript" src="../../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="../../../bootstrap/fileinput/js/fileinput.js"></script>
<script type="text/javascript"
	src="../../../bootstrap/fileinput/js/zh.js"></script>
	

<!-- Sweet alert -->
<link href="../../../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="../../../css/animate.css" rel="stylesheet">
<!-- <link href="../../../css/style.css" rel="stylesheet"> -->
<script src="../../../js/plugins/sweetalert/sweetalert.min.js"></script>
<title>景点类型</title>
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
					<h1>添加景点类型</h1>

				</div>
			</div>
		</div>
		<form action="admin/adminType-addScenicTypeByStruts.action" method="post" id="landMarkForm">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<table class="table">
						<tr>
							<td class="text"><label>类型名称</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="name" name="name" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入景点名称">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>类型颜色</label></td>
							<td colspan="3">
								<div id="colorDiv">
									<input type="text" id="color" name="color" class="form-control" 
									onblur="checkColor()" placeholder="这里输入类型颜色">
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="text"><label>类型介绍</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="subject"
									class="form-control" name="subject"></textarea></td>
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
	<script type="text/javascript">
	</script>
    <script type="text/javascript" src="../../js/addScenicType.js"></script>
</body>
</html>