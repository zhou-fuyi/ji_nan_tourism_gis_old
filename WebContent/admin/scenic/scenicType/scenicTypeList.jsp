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
<link type="text/css" href="../../topjui/css/topjui.core.min.css" rel="stylesheet">
<link type="text/css" href="../../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
<!-- FontAwesome字体图标 -->
<link type="text/css" href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
<!-- layui框架样式 -->
<link type="text/css" href="../../static/plugins/layui/css/layui.css" rel="stylesheet"/>
<!-- jQuery相关引用 -->
<script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../../static/plugins/jquery/jquery.cookie.js"></script>
<!-- TopJUI框架配置 -->
<script type="text/javascript" src="../../static/public/js/topjui.config.js"></script>
<!-- TopJUI框架核心-->
<script type="text/javascript" src="../../topjui/js/topjui.core.min.js"></script>
<!-- TopJUI中文支持 -->
<script type="text/javascript" src="../../topjui/js/locale/topjui.lang.zh_CN.js"></script>
<!-- layui框架js -->
<script type="text/javascript" src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
<title>景点类型列表</title>
<script type="text/javascript">
	function onload(){
	    var url = "/jinan_tourism_gis/admin/adminType-getScenicTypeList.action";
	    var args = {};
	    $.getJSON(url,args,function(data){
		    console.log(data);
		    if(data == "1"){
			    console.log("获取景点类型信息成功");
			    open();
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
	    <a id="filter" href="javascript:void(0)">过滤</a>
	    <a id="search" href="javascript:void(0)">查询</a>
	    <a id="import" href="javascript:void(0)">导入</a>
	    <a id="export" href="javascript:void(0)">导出</a>
	    <a id="openTab" href="javascript:void(0)">打开Tab窗口</a>
	    <a id="openWindow" href="javascript:void(0)">打开新窗口</a>
	    <a id="request" href="javascript:void(0)">执行普通请求</a>
	    <a href="javascript:void(0)"
	       data-toggle="topjui-menubutton"
	       data-options="menu:'#exportSubMenu',
	       btnCls:'topjui-btn-danger',
	       hasDownArrow:true,
	       iconCls:'fa fa-list'">更多</a>
	    <div id="exportSubMenu" class="topjui-toolbar"
	         data-options="grid:{
	           type:'datagrid',
	           id:'productDg'
	       }" style="width:150px;">
	        <div data-toggle="topjui-menubutton"
	             data-options="event:'request',
	             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出 PDF 报表
	        </div>
	        <div data-toggle="topjui-menubutton"
	             data-options="event:'export',
	             url: _ctx + '/json/response/export.html'">导出EXCEL列表
	        </div>
	        <div data-toggle="topjui-menubutton"
	             data-options="event:'request',
	             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出EXCEL报表
	        </div>
	        <div data-toggle="topjui-menubutton"
	             data-options="event:'request',
	             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出WORD报表
	        </div>
	    </div>
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
	
	    function open(){
	        var productDg = {
	            type: 'datagrid',
	            id: 'productDg'
	        };
	
	        $("#productDg").iDatagrid({
	            id: 'productDg',
	            url: '/jinan_tourism_gis/json/scenicType/scenicType.json',
	            columns: [[
	                {field: 'id', title: 'ID', checkbox: true},
	                {field: 'name', title: '景点类型名称', sortable: true},
	                {field: 'color', title: '景点类型颜色', sortable: true},
	                {field: 'subject', title: '景点类型说明', sortable: true}
	            ]],
	            filter: [{
	                field: 'name',
	                type: 'textbox',
	                op: ['contains', 'equal', 'notequal', 'less', 'greater']
	            }, {
	                field: 'code',
	                type: 'combobox',
	                options: {
	                    valueField: 'label',
	                    textField: 'value',
	                    data: [{
	                        label: '2103',
	                        value: '2103'
	                    }, {
	                        label: '5103',
	                        value: '5103'
	                    }, {
	                        label: '1204',
	                        value: '1204'
	                    }]
	                },
	                op: ['contains', 'equal', 'notequal', 'less', 'greater']
	            }, {
	                field: 'spec',
	                type: 'combobox',
	                options: {
	                    valueField: 'label',
	                    textField: 'value',
	                    multiple: true,
	                    data: [{
	                        label: 'KC-W200SW',
	                        value: 'KC-W200SW'
	                    }, {
	                        label: '白色LR-1688BY-2',
	                        value: '白色LR-1688BY-2'
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
	                href: _ctx + './scenic/scenicType/addScenicType.html',
	                buttonsGroup: [
	                    {
	                        text: '保存',
	                        url: '/jinan_tourism_gis/admin/adminType-addScenicTypeByTOPJUI.action',
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
	                href: _ctx + '/scenic/scenicType/editScenicType.html?id={id}',
	                url: '/jinan_tourism_gis/admin/adminType-getScenicTypeById.action?id={id}',
	                buttonsGroup: [
	                    {
	                        text: '更新',
	                        url: '/jinan_tourism_gis/admin/adminType-editScenicTypeByTOPJUI.action?id={id}',
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
	            confirmMsg: '您确定要删除选中的景点类型数据吗？删除后无法恢复！',
	            grid: {
	                type: 'datagrid',
	                id: 'productDg',
	                uncheckedMsg: '请先勾选要删除的数据',
	                param: 'id:id'
	            },
	            url: '/jinan_tourism_gis/admin/adminType-deleteScenicTypeByTOPJUI'
	        });
	
	        $("#filter").iMenubutton({
	            event: 'filter',
	            btnCls: 'topjui-btn-warm',
	            grid: productDg
	        });
	
	        $("#search").iMenubutton({
	            event: 'search',
	            btnCls: 'topjui-btn-danger',
	            grid: productDg
	        });
	
	        $("#import").iMenubutton({
	            event: 'import',
	            btnCls: 'topjui-btn-normal',
	            uploadUrl: _ctx + '/json/response/upload.json',
	            url: _ctx + '/json/response/success.json'
	        });
	
	        $("#export").iMenubutton({
	            event: 'export',
	            btnCls: 'topjui-btn',
	            url: _ctx + '/json/response/export.html'
	        });
	
	        $("#openTab").iMenubutton({
	            event: 'openTab',
	            btnCls: 'topjui-btn-normal',
	            tab: {
	                title: '这是新的Tab窗口',
	                href: _ctx + '/html/complex/panel_add.html'
	            },
	            grid: productDg
	        });
	
	        $("#openWindow").iMenubutton({
	            event: 'openWindow',
	            btnCls: 'topjui-btn-warm',
	            href: 'http://www.topjui.com?uuid={uuid}',
	            grid: productDg
	        });
	
	        $('#request').iMenubutton({
	            event: 'request',
	            btnCls: 'topjui-btn',
	            url: _ctx + '/json/response/success.json'
	        });
	
	        $('#myFun').iMenubutton({
	            btnCls: 'topjui-btn-normal',
	            onClick: myQuery
	        });
	
	        $('#queryBtn').iMenubutton({
	            event: 'query',
	            iconCls: 'fa fa-search',
	            btnCls: 'topjui-btn-danger',
	            form: {id: 'queryForm'},
	            grid: {type: 'datagrid', 'id': 'productDg'}
	        });
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