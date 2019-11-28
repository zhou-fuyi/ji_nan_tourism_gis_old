
function checkName(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '景点名称不能为空');
	}else{
		$('#nameDiv').removeClass("has-error");
		$('#nameDiv').addClass("has-success");
	}
}

function checkLng(){
	var lng = $('#lng').val();
	if(lng == null || lng == ""){
		$('#lngDiv').addClass("has-error");
		$('#lng').attr('placeholder', '景点经度不能为空');
	}else{
		$('#lngDiv').removeClass("has-error");
		$('#lngDiv').addClass("has-success");
	}
}

function checkLat(){
	var lat = $('#lat').val();
	if(lat == null || lat == ""){
		$('#latDiv').addClass("has-error");
		$('#lat').attr('placeholder', '景点纬度不能为空');
	}else{
		$('#lateDiv').removeClass("has-error");
		$('#latDiv').addClass("has-success");
	}
}

function checkValue(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '景点名称不能为空');
		return false;
	}
	var lng = $('#lng').val();
	if(lng == null || lng == ""){
		$('#lngDiv').addClass("has-error");
		$('#lng').attr('placeholder', '景点经度不能为空');
		return false;
	}
	var lat = $('#lat').val();
	if(lat == null || lat == ""){
		$('#latDiv').addClass("has-error");
		$('#lat').attr('placeholder', '景点纬度不能为空');
		return false
	}
	return true;
}


/**
 * 提交操作
 * @returns
 */
$('#submit').click(function(){
	if(checkValue()){
		console.log($('#landMarkForm').serializeArray());
		var url = "/ji_nan_tourism_gis_old/admin/adminLand-addLandMarkByStruts.action";
		var args = {
				'name' : $.trim($('#name').val()),
				'lng' : $.trim($('#lng').val()),
				'lat' : $.trim($('#lat').val()),
				'tel' : $('#tel').val().trim(),
				'img' : $.trim($('#img').val()),
				'subject' : $.trim($('#subject').val())
		};
		console.log(args);
		 $.getJSON(url, args, function(data){
			console.log(data);
			if(data == 1){
				console.log("景点添加成功！");
				swal({
                    title: "景点添加成功",
                    text: "页面将在2秒后刷新",
                    type: "success"
                });
                setTimeout(function () {
                	reset();
                	location.reload();//刷新页面
            	},2000)
				
			}else{
				console.log("景点添加失败！");
			}
		});
	}
});

function reset(){
	$('#name').val("");
	$('#lng').val("");
	$('#lat').val("");
	$('#tel').val("");
	$('#img').val("");
	$('#subject').val("");
}