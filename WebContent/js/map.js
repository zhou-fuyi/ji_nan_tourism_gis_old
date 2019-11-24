/*
 * 异步向后台请求地标的参数
 */
//alert("xs");
var points = new Array();
var data_info = new Array();

//```````````````````````````````````````````````````````````````````````````
var map = new BMap.Map("container");
//创建点坐标 116.799642, 36.543993
//铁力市 46.9929358308,128.0388137483
//var point = new BMap.Point(117.032386, 36.681409);
var point = new BMap.Point(128.0388137483, 46.9929358308);
//初始化地图,设置地图中心点和地图级别
map.centerAndZoom(point, 16);
//开启地图的鼠标滚动,默认是关闭的
map.enableScrollWheelZoom();

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function a() {
	var id, lng, lat, name, tel, img, subject;
	var url = "land-sendLandMarks.action";
	var args = {};
	$.getJSON(url, args, function(data) {
		if (data != null) {
			// alert(eval(data));这里和points = data两种方法都行
			points = data;//暂时是没有用的
			for (var i = 0; i < data.length; i++) {
				console.log("主键：" + data[i].id + "  纬度：" + data[i].lat + "  经度："
						+ data[i].lng + "  地址名：" + data[i].name + "  联系电话"
						+ data[i].tel + "  景区简介" + data[i].subject);
				data_info[i] = [data[i].lng,data[i].lat,"地址："+data[i].name, "电话："+data[i].tel,"景区简介："+data[i].subject, data[i].img];
			}
		}
		//var searchInfoWindow = null;
		var marker = new Array(); //存放标注点对象的数组
		var searchInfoWindow =new Array();
		for(var i=0;i<data_info.length;i++){
			marker[i] = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
			//console.log(data_info[i][0],data_info[i][1]);
			marker[i].setAnimation(BMAP_ANIMATION_BOUNCE);//跳动的图标
			map.addOverlay(marker[i]);
			var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
            '<img src="'+data_info[i][5]+'" alt="" style="float:right;zoom:1;overflow:auto;width:100px;height:100px;margin-left:3px;"/>' +
            data_info[i][2]+'<br/>'+data_info[i][3]+'<br/>'+data_info[i][4]+'</div>';
			//console.log(content);
			console.log("===============");
			console.log(marker);
		    //marker.enableDragging(); //marker可拖拽
			               // 将标注添加到地图中
			//alert("添加地标");
			searchInfoWindow[i] = new BMapLib.SearchInfoWindow(map, content, {
				title  : "信息窗口",      //标题
				width  : 290,             //宽度
				height : 105,              //高度
				panel  : "panel",         //检索结果面板
				enableAutoPan : true,     //自动平移
				//enableSendToPhone : true,
				searchTypes   :[
					BMAPLIB_TAB_SEARCH,   //周边检索
					BMAPLIB_TAB_TO_HERE,  //到这里去
					BMAPLIB_TAB_FROM_HERE //从这里出发
				]
			});
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
			//addClickHandler(content,marker);
		}
		
		 /**
		  *给标注添加点击事件监听器
		  */
		function addClickHandler(content,marker){
			/*marker.addEventListener("click",function(e){
				openInfo(content,e);
				//alert("321");
				console.log("openInfo");
			});*/
			marker.addEventListener("click", function(e){
				openInfo(content,e);
		    })
		}
		function openInfo(content,e){
			//alert("openInfo");
			var p = e.target;
			console.log(e);
			//var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			//var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
			//map.openInfoWindow(infoWindow,point); //开启信息窗口
			searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
					title  : "信息窗口",      //标题
					width  : 290,             //宽度
					height : 105,              //高度
					panel  : "panel",         //检索结果面板
					enableAutoPan : true,     //自动平移
					enableSendToPhone : true,
					searchTypes   :[
						BMAPLIB_TAB_SEARCH,   //周边检索
						BMAPLIB_TAB_TO_HERE,  //到这里去
						BMAPLIB_TAB_FROM_HERE //从这里出发
					]
				});
			searchInfoWindow.open(p);
			console.log("进来了");
		}

		
		//console.log(data_info);
	});

}
a();




/*function a() {
	var id, lng, lat, name, tel, img, subject;
	var url = "land-sendLandMarks.action";
	var args = {};
	$.getJSON(url, args, function(data) {
		if (data != null) {
			// alert(eval(data));这里和points = data两种方法都行
			points = eval(data);//暂时是没有用的
			for (var i = 0; i < points.length; i++) {
				console.log("主键：" + data[i].id + "  纬度：" + data[i].lat + "  经度："
						+ data[i].lng + "  地址名：" + data[i].name + "  联系电话"
						+ data[i].tel + "  景区简介" + data[i].subject);
				data_info[i] = [points[i].lng,points[i].lat,"地址："+points[i].name, "电话："+
					points[i].tel,"景区简介："+points[i].subject, "照片："+points[i].img];
			}
		}
		var opts = {
				width : 250,     // 信息窗口宽度
				height: 80,     // 信息窗口高度
				title : "信息窗口" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };

		for(var i=0;i<data_info.length;i++){
			var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
			console.log(data_info[i][0],data_info[i][1]);
			var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
            '<img src="'+data_info[i][5]+'" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
            data_info[i][2]+'<br/>'+data_info[i][3]+'<br/>'+data_info[i][4]+'</div>';
			//console.log(content);
			map.addOverlay(marker);               // 将标注添加到地图中
			addClickHandler(content,marker);
		}
		
		*//**
		 * 给标注添加点击事件监听器
		 *//*
		function addClickHandler(content,marker){
			marker.addEventListener("click",function(e){
			    openInfo(content,e);
			});
		}
		function openInfo(content,e){
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
			map.openInfoWindow(infoWindow,point); //开启信息窗口
		}

		
		//console.log(data_info);
	});

}
a();*/
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






// 添加带有定位的导航控件

// 添加定位控件
var geolocationControl = new BMap.GeolocationControl({
	anchor : BMAP_ANCHOR_TOP_LEFT,
	offset : new BMap.Size(8, 528)
});
geolocationControl.addEventListener("locationSuccess", function(e) {
	// 定位成功事件
	var address = '';
	//alert("123");
	address += e.addressComponent.province;
	address += e.addressComponent.city;
	address += e.addressComponent.district;
	address += e.addressComponent.street;
	address += e.addressComponent.streetNumber;
	//alert("当前定位地址为：" + address);
	/*var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})*/
});
geolocationControl.addEventListener("locationError", function(e) {
	// 定位失败事件
	alert(e.message);
});
map.addControl(geolocationControl);

var scaleCtrl = new BMap.ScaleControl({
	anchor : BMAP_ANCHOR_BOTTOM_LEFT,
	offset : new BMap.Size(80, 25)
});
map.addControl(scaleCtrl);

//添加缩放控件
map.addControl(new BMap.NavigationControl({
	anchor : BMAP_ANCHOR_TOP_LEFT,
	offset : new BMap.Size(15, 20),
	type : BMAP_NAVIGATION_CONTROL_ZOOM

}));

//创建一个自动完成的对象 suggestionId
var ac = new BMap.Autocomplete( //建立一个自动完成的对象
{
	"input" : "suggestionId",
	"location" : map
});
// 百度地图API功能
function G(id) {
	return document.getElementById(id);
}

var city;
ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
	var str = "";
	var _value = e.fromitem.value;
	city = _value.city;
	var value = "";
	if (e.fromitem.index > -1) {
		value = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
	}
	str = "FromItem<br />index = " + e.fromitem.index
			+ "<br />value = " + value;

	value = "";
	if (e.toitem.index > -1) {
		_value = e.toitem.value;
		value = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
	}
	str += "<br />ToItem<br />index = " + e.toitem.index
			+ "<br />value = " + value;
	//alert(str);
	G("searchResultPanel").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
	var _value = e.item.value;
	myValue = _value.province + _value.city + _value.district
			+ _value.street + _value.business;
	G("searchResultPanel").innerHTML = "onconfirm<br />index = "
			+ e.item.index + "<br />myValue = " + myValue;
	console.log(_value);
	console.log(myValue);
	//setPlace1();
	setPlace();
});

function setPlace1() {// 创建地址解析器实例   POI检索方式速度慢于地址编码检索方式
	var myGeo = new BMap.Geocoder();// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(myValue, function(point) {
		if (point) {
			map.centerAndZoom(point, 18);
			console.log(point);
			//在这里只设置地图中心和放大级别    不进行标注   让自定义的标注的信息窗口可以显示
			//map.addOverlay(new BMap.Marker(point));
		}
	}, city);
}

function setPlace() {
	//map.clearOverlays();    //清除地图上所有覆盖物
	function myFun() {
		var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
		map.centerAndZoom(pp, 18);
		map.addOverlay(new BMap.Marker(pp));    //添加标注
	}
	var local = new BMap.LocalSearch(map, { //智能搜索
		onSearchComplete : myFun
	});
	//alert(myValue);
	local.search(myValue);
	//alert(city);
}

//使用鼠标测距
var myDis = new BMapLib.DistanceTool(map);
/*map.addEventListener("load",function(){
	myDis.open();  //开启鼠标测距
	//myDis.close();  //关闭鼠标测距大
});*/

//拉框放大
var myDrag = new BMapLib.RectangleZoom(map, {
	followText : "拖拽鼠标进行操作"
});

//实时路况
var ctrl = new BMapLib.TrafficControl({
	showPanel : false
//是否显示路况提示面板
});
map.addControl(ctrl);
ctrl.setAnchor(BMAP_ANCHOR_BOTTOM_RIGHT);

map.addEventListener('click', function(e) {
	console.log(e.point);
});

//```````````````````````````````````````````````````````````````````````````````


