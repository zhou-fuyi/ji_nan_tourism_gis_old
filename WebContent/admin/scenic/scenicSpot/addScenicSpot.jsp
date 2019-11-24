<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href='<s:url value="/bootstrap/css/bootstrap.css"></s:url>'>
<script type="text/javascript" src='<s:url value="/js/jquery-3.3.1.min.js"></s:url>'></script>
<script type="text/javascript" src='<s:url value="/bootstrap/js/bootstrap.js"></s:url>'></script>


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
<link href='<s:url value="/css/plugins/sweetalert/sweetalert.css"></s:url>' rel="stylesheet">
<link href='<s:url value="/css/animate.css"></s:url>' rel="stylesheet">
<!-- <link href="../../../css/style.css" rel="stylesheet"> -->
<script src='<s:url value="/js/plugins/sweetalert/sweetalert.min.js"></s:url>'></script>
<title>添加景区详情</title>
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
					<h1>添加景区详情</h1>

				</div>
			</div>
		</div>
		
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form action="adminSpot-addScenicSpot.action" name="addScenicSpot" method="post" id="scenicSpotForm">
					<!-- 隐藏域 -->
					<input type="hidden" id="img" name="defaultPhoto">
					
					<table class="table">
					
					   
						<tr>
							<td class="text"><label>风景区名称</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="name" name="name" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入风景区名称">
							    </div>
							</td>
						</tr>
						<%--  <tr>
							<td class="text"><label>所在景点信息</label></td>
							<td colspan="3">
							    <div id="landMarkIdDiv">
							    	<select class="form-control" id="landMarkId" name="scenicSpot.landMark.id" onchange="checkLandMarkId()">
							    	    <option value="" selected="selected">请选择景区所在景点信息...</option>
							    	    <option value="1">大明湖公园</option>
							    	    <option value="0">趵突泉</option>
							    	</select>
							    </div>
							</td>
						</tr> --%>
						<tr>
							<td class="text"><label>风景区宣传标语</label></td>
							<td colspan="3">
							    <div id="taglineDiv">
							    	<input type="text" id="tagline" name="tagline" class="form-control" 
							    	 placeholder="这里输入风景区宣传标语">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景点代表图</label></td>
							<td colspan="3"><input id="defaultPhoto" type="file" class="file" name="img"></td>
						</tr>
						<tr>
							<td class="text"><label>景区级别</label></td>
							<td >
							    <div id="levelDiv">
							    	<input type="text" id="level" name="level" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区级别">
							    </div>
							</td>
							<td class="text"><label>景区票价</label></td>
							<td >
							    <div id="ticketPriceDiv">
							    	<input type="text" id="ticketPrice" name="ticketPrice" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区票价">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景区简介</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="intro"
									class="form-control" name="intro"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>景区称号</label></td>
							<td >
							    <div id="cNameDiv">
							    	<input type="text" id="cName" name="cName" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区称号">
							    </div>
							</td>
							<td class="text"><label>景区管理机构</label></td>
							<td >
							    <div id="managementDiv">
							    	<input type="text" id="management" name="management" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区管理机构">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景区特色景观</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="feature"
									class="form-control" name="feature"></textarea></td>
						</tr>
						<!-- <tr>
							<td class="text"><label>景区类型</label></td>
							<td colspan="3">
							    <div id="managementDiv" style="padding-top: 8px;">
									<input type="checkbox" name="typeList" value="公园景区"/> <label>公园景区</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="typeList" value="名人故居"/> <label>名人故居</label>&nbsp;&nbsp;&nbsp;&nbsp;    
									<input type="checkbox" name="typeList" value="园林"/> <label>园林</label>&nbsp;&nbsp;&nbsp;&nbsp;    
									<input type="checkbox" name="typeList" value="文物古迹"/><label>文物古迹</label>
								</div>
							</td>
						</tr> -->
						<tr>
							<td class="text"><label>景区电话</label></td>
							<td >
							    <div id="cNameDiv">
							    	<input type="text" id="tel" name="tel" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区电话">
							    </div>
							</td>
							<td class="text"><label>景区地址</label></td>
							<td >
							    <div id="managementDiv">
							    	<input type="text" id="address" name="address" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区地址">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>游览路线</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="line"
									class="form-control" name="line"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>景区解说员说明</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="guideMan" name="guideMan" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入景区解说员说明">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景区营业时间</label></td>
							<td >
							    <div id="cNameDiv">
							    	<input type="text" id="time" name="time" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区营业时间">
							    </div>
							</td>
							<td class="text"><label>景区游览时间</label></td>
							<td >
							    <div id="managementDiv">
							    	<input type="text" id="costTime" name="costTime" class="form-control" 
							    	onblur="checkTagline()" placeholder="这里输入风景区游览时间">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>景区配套设施服务</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="supporting"
									class="form-control" name="supporting"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>景区游客服务中心</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="serviceCenter"
									class="form-control" name="serviceCenter"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>景区官网网址</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="website" name="website" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入景区官网网址">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>门票说明</label></td>
							<td colspan="3">
							    <div id="nameDiv">
							    	<input type="text" id="priceDescription" name="priceDescription" class="form-control" 
							    	onblur="checkName()" placeholder="这里输入景区门票说明">
							    </div>
							</td>
						</tr>
						<tr>
							<td class="text"><label>门票优惠政策说明</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="discount"
									class="form-control" name="discount"></textarea></td>
						</tr>
						
						<tr>
							<td class="text"><label>公交车路线指示</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="bus"
									class="form-control" name="bus"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>自驾车指南</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="driving"
									class="form-control" name="driving"></textarea></td>
						</tr>
						<tr>
							<td class="text"><label>景区停车场信息</label></td>
							<td colspan="3"><textarea rows="4" cols="" id="park"
									class="form-control" name="park"></textarea></td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
		<div class="row clearfix" style="padding-bottom: 100px;">
			<div class="col-md-5 column"></div>
			<div class="col-md-2 column">
				<input type="button" id="submit" class="btn btn-primary form-control" value="保存">
			</div>
			<div class="col-md-5 column"></div>
		</div>
	</div>
	
	
	<script type="text/javascript">

		$("#defaultPhoto").fileinput({
			language : 'zh',
			uploadUrl : "/jinan_tourism_gis/admin/adminImg-saveScenicSpotDefaultPhoto.action",
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
	<script type="text/javascript" src="../../js/addScenicSpot.js"></script>
</body>
</html>