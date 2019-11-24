<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<!-- TopJUI框架样式 -->
<!-- <link type="text/css" href="../topjui/css/topjui.core.min.css" rel="stylesheet">
<link type="text/css" href="../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/> -->
<!-- FontAwesome字体图标 -->
<link type="text/css" href="../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
<!-- layui框架样式 -->
<!-- <link type="text/css" href="../static/plugins/layui/css/layui.css" rel="stylesheet"/> -->
<!-- jQuery相关引用 -->
<script type="text/javascript" src="../static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../static/plugins/jquery/jquery.cookie.js"></script>
<!-- TopJUI框架配置 -->
<script type="text/javascript" src="../static/public/js/topjui.config.js"></script>
<!-- TopJUI框架核心-->
<script type="text/javascript" src="../topjui/js/topjui.core.min.js"></script>
<!-- TopJUI中文支持 -->
<script type="text/javascript" src="../topjui/js/locale/topjui.lang.zh_CN.js"></script>
<!-- layui框架js -->
<script type="text/javascript" src="../static/plugins/layui/layui.js" charset="utf-8"></script>


<link rel="stylesheet" type="text/css" href="/jinan_tourism_gis/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/jinan_tourism_gis/easyui/themes/icon.css">
<script type="text/javascript" src="/jinan_tourism_gis/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/jinan_tourism_gis/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jinan_tourism_gis/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>添加资讯</title>
</head>
<body>
    <div id="p" class="easyui-panel" title="编写资讯" style="padding: 10px">
	 	<table cellspacing="20px">
	   		<tr>
	   			<td width="80px">资讯标题：</td>
	   			<td><input type="text" id="title" name="title" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td>所属类别：</td>
	   			<td>
	   				<select class="easyui-combobox" style="width: 154px" id="blogTypeId" name="blogType.id" editable="false" panelHeight="auto" >
						<option value="">请选择文章类别...</option>	
					    <option value="1" selected="selected">旅游资讯</option>		
	                </select>
	   			</td>
	   		</tr>
	   		<tr>
	   			<td valign="top">资讯内容：</td>
	   			<td>
	   			    <!-- 加载编辑器的容器 -->
					<script id="container" name="content" type="text/plain" style="width:950px;height:500px;"></script>
	   			</td>
	   		</tr>
	   		<tr>
	   			<td>关键字：</td>
	   			<td><input type="text" id="keyWord" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用英文","隔开)</td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布资讯</a>
	   			</td>
	   		</tr>
	   	</table>
	 </div>
	<!-- Ueditor编辑器插件 -->
	<script type="text/javascript" src="/jinan_tourism_gis/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/jinan_tourism_gis/ueditor/ueditor.all.js"></script>
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
    			$.post("/jinan_tourism_gis/admin/adminBlog-addBlogByAdmin.action",{'title':title,'content':content,'subject':ue.getContentTxt().substr(0,155),'keyWord':keyWord,'sign':blogTypeId},function(result){
        			console.log(result);
    				if(result == "1"){
    					alert("资讯发布成功！");
    					resetValue();
    				}else if(result == "-1"){
        				console.log("当前会话已失效,需要重新登陆");
    					alert("资讯发布失败！");
    				}else if(reuslt == "0"){
        				console.log("系统异常  后台没有接收到Article数据");
    					alert("资讯发布失败！");
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