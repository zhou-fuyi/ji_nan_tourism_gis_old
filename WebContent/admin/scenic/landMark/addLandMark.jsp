<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>添加景点</title>
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
					<h1>添加景点</h1>

				</div>
			</div>
		</div>
		<form action="land-addLandMark.action" id="landMarkForm">
			<div class="row clearfix">
				<div class="col-md-12 column">
				    <!-- 隐藏域 -->
					<input type="hidden" id="id" name="id">
					<input type="hidden" id="img" name="img">
					<table class="table">
						<tr>
							<td class="text"><label>景点名称</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="name" name="name" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入景点名称">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景点经度</label></td>
							<td>
								<div id="lngDiv">
									<input type="text" id="lng" name="lng" class="form-control" 
									onblur="checkLng()" placeholder="这里输入景点经度">
								</div>
							</td>
							<td class="text"><label>景点纬度</label></td>
							<td>
								<div id="latDiv">
									<input type="text" id="lat" name="lat" class="form-control" 
									onblur="checkLat()" placeholder="这里输入景点纬度">
								</div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>联系电话</label></td>
							<td><input type="text" id="tel" name="tel" class="form-control"></td>
							<td class="text"><label>景点详情地址</label></td>
							<td><input type="text" name="url" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text"><label>景点代表图</label></td>
							<td colspan="3"><input id="landMarkImg" type="file" class="file" name="img"></td>
						</tr>
						<tr>
							<td class="text"><label>景点详情</label></td>
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

		$("#landMarkImg").fileinput({
			language : 'zh',
			uploadUrl : "/jinan_tourism_gis/admin/adminImg-saveLandMarkImg.action",
			autoReplace : true,
			maxFileCount : 1,
			allowedFileExtensions : [ "jpg", "png", "gif" ],
			browseClass : "btn btn-primary", //按钮样式 
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
		}).on("fileuploaded", function(e, data) {
			var res = data.response;
			if (res != -1) {
				$('#img').val(res);
				console.log(res);
			} else {
				alert('上传失败 , 失败原因： 系统异常');
			}
		});
				
	</script>
    <script type="text/javascript" src="../../js/landMark.js"></script>
</body>
</html>