
function checkName(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '风景区名称不能为空');
	}else{
		$('#nameDiv').removeClass("has-error");
		$('#nameDiv').addClass("has-success");
	}
}

function checkLandMarkId(){
	var option = $('#landMarkId').val();
	//alert(option);
	if(option == ""){
		$('#landMarkIdDiv').removeClass("has-success");
		$('#landMarkIdDiv').addClass("has-error");
	}else{
		$('#landMarkIdDiv').removeClass("has-error");
		$('#landMarkIdDiv').addClass("has-success");
	}
}

function checkLat(){
	
}

function checkValue(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '风景区名称不能为空');
		return false;
	}
	return true;
}


/**
 * 提交操作
 * @returns
 */
$('#submit').click(function(){
	//if(checkValue()){
		alert("123");
		console.log($('#scenicSpotForm').serializeArray());
		
		var typeList = new Array();
		$('input[name="typeList"]:checked').each(function(){  
			typeList.push($(this).val());//向数组中添加元素  
		});
		var url = "/jinan_tourism_gis/admin/adminSpot-addScenicSpot.action";
		var args = {
				'name' : $.trim($('#name').val()),
				'tagline' : $.trim($('#tagline').val()),
				'defaultPhoto' : $.trim($('#img').val()),
				'ticketPrice' : $('#ticketPrice').val().trim(),
				'level' : $('#level').val().trim(),
				'intro' : $.trim($('#intro').val()),
				'feature' : $.trim($('#feature').val()),
				'cName' : $.trim($('#cName').val()),
				'typeList' : typeList,
				'line' : $.trim($('#line').val()),
				'tel' : $.trim($('#tel').val()),
				'guideMan' : $.trim($('#guideMan').val()),
				'address' : $.trim($('#address').val()),
				'time' : $.trim($('#time').val()),
				'supporting' : $.trim($('#supporting').val()),
				'costTime' : $.trim($('#costTime').val()),
				'website' : $.trim($('#website').val()),
				'serviceCenter' : $.trim($('#serviceCenter').val()),
				'priceDescription' : $.trim($('#priceDescription').val()),
				'discount' : $.trim($('#discount').val()),
				'bus' : $.trim($('#bus').val()),
				'driving' : $.trim($('#driving').val()),
				'park' : $.trim($('#park').val()),
				'scenicSpot.landMark.id' : $.trim($('#landMarkId').val()),
				'management' : $.trim($('#management').val())
		};
		console.log(args);
		 $.getJSON(url, args, function(data){
			console.log(data);
			if(data == 1){
				console.log("景区详情添加成功！");
				swal({
                    title: "景区详情添加成功",
                    text: "页面将在2秒后刷新",
                    type: "success"
                });
                setTimeout(function () {
                	reset();
                	location.reload();//刷新页面
            	},2000)
				
			}else{
				console.log("景区信息添加失败！");
			}
		});
	//}
});

function reset(){
	$('#name').val("");
	$('#lng').val("");
	$('#lat').val("");
	$('#tel').val("");
	$('#img').val("");
	$('#subject').val("");
}