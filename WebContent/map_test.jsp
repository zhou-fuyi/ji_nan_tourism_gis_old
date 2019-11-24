<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>最美济南</title>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=3.0&ak=5vHDEZDCrT5TRRCeQ9vyOmHZSQh7YYQs"></script>
<!-- <script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=IDvNBsejl9oqMbPF316iKsXR"></script> -->
<script type="text/javascript"
	src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet"
	href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
<script src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
body, html, #container {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}

p {
	margin-left: 5px;
	font-size: 14px;
}
</style>
</head>
<body>
	<!-- <div id="container"></div>
	<script type="text/javascript">
		//创建地图
		/* var map = new BMap.Map("container", {
			enableMapClick : false
		}); */
		var map = new BMap.Map("container");
		//初始化地图  设置地图中心点和地图级别
		var point = new BMap.Point(117.02496707, 36.68278473);
		map.centerAndZoom(point, 14);
		map.addControl(new BMap.MapTypeControl({
			mapTypes : [ BMAP_NORMAL_MAP, BMAP_HYBRID_MAP ]
		}));
		map.setCurrentCity("济南"); // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放

		map.enableInertialDragging();
		map.enableContinuousZoom();
		var size = new BMap.Size(10, 20); //Size(width,height)
		//Control:是所有控件的基类,anchor:设置控件停靠的位置,offset:设置控件停靠的偏移量
		map.addControl(new BMap.CityListControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			offset : size
		// 切换城市之间事件
		// onChangeBefore: function(){
		//    alert('before');
		// },
		// 切换城市之后事件
		// onChangeAfter:function(){
		//   alert('after');
		// }
		}));

		// 添加带有定位的导航控件
		size = new BMap.Size(10, 60);
		var navigationControl = new BMap.NavigationControl({
			// 靠左上角位置
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			// LARGE类型
			type : BMAP_NAVIGATION_CONTROL_LARGE,
			offset : size,
			// 启用显示定位
			enableGeolocation : true
		});
		map.addControl(navigationControl);
		// 添加定位控件
		var geolocationControl = new BMap.GeolocationControl();
		geolocationControl.addEventListener("locationSuccess", function(e) {
			// 定位成功事件
			var address = '';
			address += e.addressComponent.province;
			address += e.addressComponent.city;
			address += e.addressComponent.district;
			address += e.addressComponent.street;
			address += e.addressComponent.streetNumber;
			alert("当前定位地址为：" + address);
		});
		geolocationControl.addEventListener("locationError", function(e) {
			// 定位失败事件
			alert(e.message);
		});
		map.addControl(geolocationControl);
	</script> -->
	<div class="demo_main">
		<fieldset class="demo_title">百度地图API显示多个标注点带提示的代码</fieldset>
		<fieldset class="demo_content">
			<div style="min-height: 300px; width: 100%;" id="map"></div>
			<script type="text/javascript">
                var markerArr = [
                    { title: "名称：广州火车站", point: "113.264531,23.157003", address: "广东省广州市广州火车站", tel: "12306" },
                    { title: "名称：广州塔（赤岗塔）", point: "113.330934,23.113401", address: "广东省广州市广州塔（赤岗塔） ", tel: "18500000000" },
                    { title: "名称：广州动物园", point: "113.312213,23.147267", address: "广东省广州市广州动物园", tel: "18500000000" },
                    { title: "名称：天河公园", point: "113.372867,23.134274", address: "广东省广州市天河公园", tel: "18500000000" }
                ];
                
                    var map = new BMap.Map("map"); // 创建Map实例
                    var point = new BMap.Point(113.312213, 23.147267); //地图中心点，广州市
                    map.centerAndZoom(point, 13); // 初始化地图,设置中心点坐标和地图级别。
                    map.enableScrollWheelZoom(true); //启用滚轮放大缩小
                    //地图、卫星、混合模式切换
                    map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP, BMAP_SATELLITE_MAP, BMAP_HYBRID_MAP]}));
                    //向地图中添加缩放控件
                    var ctrlNav = new window.BMap.NavigationControl({
                        anchor: BMAP_ANCHOR_TOP_LEFT,
                        type: BMAP_NAVIGATION_CONTROL_LARGE
                    });
                    map.addControl(ctrlNav);
                    //向地图中添加缩略图控件
                    var ctrlOve = new window.BMap.OverviewMapControl({
                        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                        isOpen: 1
                    });
                    map.addControl(ctrlOve);
                    //向地图中添加比例尺控件
                    var ctrlSca = new window.BMap.ScaleControl({
                        anchor: BMAP_ANCHOR_BOTTOM_LEFT
                    });
                    map.addControl(ctrlSca);
 
                    var point = new Array(); //存放标注点经纬信息的数组
                    var marker = new Array(); //存放标注点对象的数组
                    var info = new Array(); //存放提示信息窗口对象的数组
                    var searchInfoWindow =new Array();//存放检索信息窗口对象的数组
                    for (var i = 0; i < markerArr.length; i++) {
                        var p0 = markerArr[i].point.split(",")[0]; //
                        var p1 = markerArr[i].point.split(",")[1]; //按照原数组的point格式将地图点坐标的经纬度分别提出来
                        point[i] = new window.BMap.Point(p0, p1); //循环生成新的地图点
                        marker[i] = new window.BMap.Marker(point[i]); //按照地图点坐标生成标记
                        map.addOverlay(marker[i]);
                        marker[i].setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
　　　　　　　　　　　　　　//显示marker的title，marker多的话可以注释掉
                        var label = new window.BMap.Label(markerArr[i].title, { offset: new window.BMap.Size(20, -10) });
                        marker[i].setLabel(label);//文本标注
                        // 创建信息窗口对象
                        info[i] = "<p style=’font-size:12px;lineheight:1.8em;’>" + "</br>地址：" + markerArr[i].address + "</br> 电话：" + markerArr[i].tel + "</br></p>";
                        //创建百度样式检索信息窗口对象                       
                        searchInfoWindow[i] = new BMapLib.SearchInfoWindow(map, info[i], {
                                title  : markerArr[i].title,      //标题
                                width  : 290,             //宽度
                                height : 55,              //高度
                                panel  : "panel",         //检索结果面板
                                enableAutoPan : true,     //自动平移
                                searchTypes   :[
                                    BMAPLIB_TAB_SEARCH,   //周边检索
                                    BMAPLIB_TAB_TO_HERE,  //到这里去
                                    BMAPLIB_TAB_FROM_HERE //从这里出发
                                ]
                            });
                        //添加点击事件
                        marker[i].addEventListener("click", 
                            (function(k){
                                // js 闭包
                                return function(){
                                    //将被点击marker置为中心
                                    //map.centerAndZoom(point[k], 18);
                                    //在marker上打开检索信息窗口
                                    searchInfoWindow[k].open(marker[k]);
                                }
                            })(i)                            
                        ); 
                    }                  
               
                //异步调用百度js
                /* function map_load() {
                    var load = document.createElement("script");
                    load.src = "http://api.map.baidu.com/api?v=3.0&ak=5vHDEZDCrT5TRRCeQ9vyOmHZSQh7YYQs&callback=map_init";
                    document.body.appendChild(load);
                }
                window.onload = map_load; */
            </script>
		</fieldset>
	</div>
</body>
</html>