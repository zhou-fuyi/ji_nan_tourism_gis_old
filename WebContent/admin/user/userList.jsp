<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<!-- TopJUI框架样式 -->
<link type="text/css" href="./../topjui/css/topjui.core.min.css" rel="stylesheet">
<link type="text/css" href="./../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
<!-- FontAwesome字体图标 -->
<link type="text/css" href="./../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
<!-- layui框架样式 -->
<link type="text/css" href="./../static/plugins/layui/css/layui.css" rel="stylesheet"/>
<!-- jQuery相关引用 -->
<script type="text/javascript" src="./../static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="./../static/plugins/jquery/jquery.cookie.js"></script>
<!-- TopJUI框架配置 -->
<script type="text/javascript" src="./../static/public/js/topjui.config.js"></script>
<!-- TopJUI框架核心-->
<script type="text/javascript" src="./../topjui/js/topjui.core.min.js"></script>
<!-- TopJUI中文支持 -->
<script type="text/javascript" src="./../topjui/js/locale/topjui.lang.zh_CN.js"></script>
<!-- layui框架js -->
<script type="text/javascript" src="./../static/plugins/layui/layui.js" charset="utf-8"></script>
<title>用户列表</title>
<script type="text/javascript">
	function onload(){
		var url = "/jinan_tourism_gis/admin/adminUser-getUserSet.action";
	    var args = {};
	    $.getJSON(url,args,function(data){
		    console.log(data);
		    if(data == "1"){
			    console.log("获取用户列表成功");
			    open();
			    setTimeout(function(){
			    	setField();
			    }, 100);
		    }else{
			    console.log("系统异常,查询失败");
		    }
	    });
	}
</script>
</head>
<body>
	<table id="productDg"></table>
	
	<!-- 表格工具栏开始 -->
	<div id="productDg-toolbar" class="topjui-toolbar"
	     data-options="grid:{
	           type:'datagrid',
	           id:'productDg'
	       }">
	    <a id="add" href="javascript:void(0)">新增</a>
	    <a id="edit" href="javascript:void(0)">编辑</a>
	    <a id="delete" href="javascript:void(0)">删除</a>
	    
	    <form id="queryForm" class="search-box">
	        <input type="text" name="name" data-toggle="topjui-textbox"
	               data-options="id:'name',prompt:'产品名称'">
	        <input type="text" name="code" data-toggle="topjui-textbox"
	               data-options="id:'code',prompt:'产品型号'">
	        <a id="queryBtn" href="javascript:void(0)">查询</a>
	    </form>
	</div>
	<!-- 表格工具栏结束 -->
	
	
	<script>
	    function progressFormatter(value, rowData, rowIndex) {
	        var htmlstr = '<div id="p" class="topjui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
	        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
	        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
	        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
	        htmlstr += '</div>';
	        htmlstr += '</div>';
	        return htmlstr;
	    }
	
	    var productDg = {
            type: 'datagrid',
            id: 'productDg'
        };

		function open(){
	        $("#productDg").iDatagrid({
	            id: 'productDg',
	            url: '/jinan_tourism_gis/json/user/user.json',
	            columns: [[
	                {field: 'userId', title: 'userId', checkbox: true},
	                {field: 'userName', title: '用户名', sortable: true},
	                {field: 'userCname', title: '昵称', sortable: true},
	                {field: 'userGender', title: '性别', sortable: true},
	                {field: 'userAge', title: '年龄', sortable: true},
	                {field: 'userTel', title: '联系电话', sortable: true},
	                {field: 'userEmail', title: '邮箱地址', sortable: true},
	                {field: 'isOnline', title: '是否在线', sortable: true},
	                {field: 'registerTime', title: '注册时间', sortable: true},
	                {field: 'lastLoginTime', title: '最后在线时间', sortable: true},
	                {field: 'userStatus', title: '用户状态', sortable: true},
	                {field: 'activationCode', title: '注册码', sortable: true},
	                {field: 'disabled', title: '用户行为', sortable: true},
	            ]],
	            filter: [{
	                field: 'name',
	                type: 'textbox',
	                op: ['contains', 'equal', 'notequal', 'less', 'greater']
	            }, {
	                field: 'isOnline',
	                type: 'combobox',
	                options: {
	                    valueField: 'label',
	                    textField: 'value',
	                    data: [{
	                        label: '1',
	                        value: '在线'
	                    }, {
	                        label: '0',
	                        value: '下线'
	                    }, {
	                        label: '1204',
	                        value: '1204'
	                    }]
	                },
	                op: ['contains', 'equal', 'notequal', 'less', 'greater']
	            }, {
	                field: 'disabled',
	                type: 'combobox',
	                options: {
	                    valueField: 'label',
	                    textField: 'value',
	                    multiple: true,
	                    data: [{
	                        label: '1',
	                        value: '可用'
	                    }, {
	                        label: '0',
	                        value: '违规,被限制登录'
	                    }, {
	                        label: '银灰色BCD-339WBA 339',
	                        value: '银灰色BCD-339WBA 339'
	                    }]
	                },
	                op: ['contains', 'equal', 'notequal', 'less', 'greater']
	            }]
	        });
	
	        $("#add").iMenubutton({
	            event: 'openDialog',
	            iconCls: 'fa fa-plus',
	            dialog: {
	                id: 'userAddDialog',
	                height: 350,
	                href: _ctx + '/html/complex/dialog_add.html',
	                buttonsGroup: [
	                    {
	                        text: '保存',
	                        url: _ctx + '/json/response/success.json',
	                        iconCls: 'fa fa-plus',
	                        handler: 'ajaxForm',
	                        btnCls: 'topjui-btn-normal'
	                    }
	                ]
	            }
	        });
	
	        $("#edit").iMenubutton({
	            event: 'openDialog',
	            iconCls: 'fa fa-pencil',
	            btnCls: 'topjui-btn',
	            grid: productDg,
	            dialog: {
	                width: 950,
	                height: 500,
	                href: _ctx + '/html/complex/dialog_edit.html?uuid={uuid}',
	                url: _ctx + '/json/product/detail.json?uuid={uuid}',
	                buttonsGroup: [
	                    {
	                        text: '更新',
	                        url: _ctx + '/json/response/success.json',
	                        iconCls: 'fa fa-save',
	                        handler: 'ajaxForm',
	                        btnCls: 'topjui-btn'
	                    }
	                ]
	            }
	        });
	
	        $("#delete").iMenubutton({
	            event: 'doAjax',
	            iconCls: 'fa fa-trash',
	            btnCls: 'topjui-btn-normal',
	            confirmMsg: '这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',
	            grid: {
	                type: 'datagrid',
	                id: 'productDg',
	                uncheckedMsg: '请先勾选要删除的数据',
	                param: 'uuid:uuid,code:code'
	            },
	            url: _ctx + '/json/response/success.json'
	        });
	
	
	      
	
	        $('#queryBtn').iMenubutton({
	            event: 'query',
	            iconCls: 'fa fa-search',
	            btnCls: 'topjui-btn-danger',
	            form: {id: 'queryForm'},
	            grid: {type: 'datagrid', 'id': 'productDg'}
	        });
		}

		var fieldArray = new Array();//所有属性的数组
		var isOnlineArray = new Array();//是否在线
		var disabledArray = new Array();//用户行为
		var isOnlineArrayIndex = new Array();//是否在线
		var isOnlineArrayIndex1 = new Array();//是否在线
		var disabledArrayIndex = new Array();//用户行为
		var disabledArrayIndex1 = new Array();//用户行为
		function setField(){
			$('.datagrid-cell').each(function(index,element){
		    	fieldArray[index] = $(this).text();
		    })
		    console.log(fieldArray);
			

			var isOnline = 0;
		    for(var i = 18; i < fieldArray.length;){
			    isOnlineArray[isOnline] = fieldArray[i];
			    if(fieldArray[i] == 1){
			    	isOnlineArrayIndex[isOnline] = i;
			    }else if(fieldArray[i] == 0){
			    	isOnlineArrayIndex1[isOnline] = i;
			    }
			    isOnline ++;
			    i += 12;
		    }
		    
		    var disabled = 0;
		    for(var i = 23; i < fieldArray.length;){
		    	disabledArray[disabled] = fieldArray[i];
		    	if(fieldArray[i] == 1){
		    		disabledArrayIndex[disabled] = i;
			    }else if(fieldArray[i] == 0){
			    	disabledArrayIndex1[disabled] = i;
			    }
		    	disabled ++;
			    i += 12;
		    }
		    var a = 0;
		    var b = 0;
		    var c = 0;
		    var d = 0;
		    $('.datagrid-cell').each(function(index,element){
			    //alert(index);
		    	for(var i = 0; i < fieldArray.length; i++){
			    	//console.log(index);
			    	//alert(i);
			    	for(var a = 0; a < isOnlineArrayIndex.length; a++){
			    		if(isOnlineArrayIndex[a] == index){
			    			console.log(index);
					    	$(this).text("在线");
					    	$(this).removeClass("layui-bg-gray");
					    	$(this).addClass("layui-bg-green");
					    	a ++;
					    	console.log(a);
					    }
			    	}
			    	for(var b = 0; b < isOnlineArrayIndex1.length; b++){
					    if(isOnlineArrayIndex1[b] == index){
					    	console.log("进的来1");
					    	$(this).text("下线");
					    	$(this).removeClass("layui-bg-green");
					    	$(this).addClass("layui-bg-gray");
					    	b ++;
					    }
			    	}
			    	for(var c = 0; c < disabledArrayIndex.length; c++){
					    if(disabledArrayIndex[c] == index){
					    	console.log("进的来2");
					    	$(this).text("正常");
					    	$(this).removeClass("layui-bg-red");
					    	$(this).addClass("layui-bg-green");
					    }
			    	}
			    	for(var d = 0; d < disabledArrayIndex1.length; d++){
					    if(disabledArrayIndex1[d] == index){
					    	console.log("进的来3");
					    	$(this).text("被禁止登录");
					    	$(this).removeClass("layui-bg-green");
					    	$(this).addClass("layui-bg-red");
					    }
			    	}
			    }
		    })
		    console.log(isOnlineArrayIndex);
			console.log(isOnlineArrayIndex1);
			console.log(disabledArrayIndex);
			console.log(disabledArrayIndex1);
		    
		    
		}

		
		onload();
	
	    // 自定义方法
	    function myQuery() {
	        // 提示信息
	        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');
	
	        var checkedRows = $('#productDg').iDatagrid('getChecked');
	        console.log(checkedRows);
	
	        var selectedRow = $('#productDg').iDatagrid('getSelected');
	        console.log(selectedRow);
	
	        // 提交参数查询表格数据
	        $('#productDg').iDatagrid('reload', {
	            name: $('#name').iTextbox('getValue'),
	            code: $('#code').iTextbox('getValue')
	        });
	    }
	</script>
</body>
</html>