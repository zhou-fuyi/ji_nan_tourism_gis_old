
function checkName(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '景点类型名称不能为空');
	}else{
		$('#nameDiv').removeClass("has-error");
		$('#nameDiv').addClass("has-success");
	}
}


function checkColor(){
	var color = $('#color').val();
	if(color == null || color == ""){
		$('#colorDiv').addClass("has-error");
		$('#color').attr('placeholder', '景点类型颜色不能为空');
	}else{
		$('#colorDiv').removeClass("has-error");
		$('#colorDiv').addClass("has-success");
	}
}


function checkValue(){
	var name = $('#name').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#name').attr('placeholder', '景点类型名称不能为空');
		return false;
	}
	var color = $('#color').val();
	if(color == null || color == ""){
		$('#colorDiv').addClass("has-error");
		$('#color').attr('placeholder', '类型颜色不能为空');
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
		var url = "/ji_nan_tourism_gis_old/admin/adminType-addScenicTypeByStruts.action";
		var args = {
				'name' : $.trim($('#name').val()),
				'color' : $.trim($('#color').val()),
				'subject' : $.trim($('#subject').val()),
		};
		console.log(args);
		 $.getJSON(url, args, function(data){
			console.log(data);
			if(data == 1){
				console.log("景点类型添加成功！");
				swal({
                    title: "景点类型添加成功",
                    text: "页面将在2秒后刷新",
                    type: "success"
                });
                setTimeout(function () {
                	reset();
                	location.reload();//刷新页面
            	},2000)
				
			}else{
				console.log("景点类型添加失败！");
			}
		});
	}
});

function reset(){
	$('#name').val("");
	$('#color').val("");
	$('#subject').val("");
}