
function checkName(){
	var name = $('#resName').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#resName').attr('placeholder', '资源名称不能为空');
	}else{
		$('#nameDiv').removeClass("has-error");
		$('#nameDiv').addClass("has-success");
	}
}


function checkremark(){
	var option = $('#remark').val();
	//alert(option);
	if(option == ""){
		$('#remarkDiv').removeClass("has-success");
		$('#remarkDiv').addClass("has-error");
	}else{
		$('#remarkDiv').removeClass("has-error");
		$('#remarkDiv').addClass("has-success");
	}
}

function checkIsUsed(){
	var option = $('#isUsed').val();
	//alert(option);
	if(option == ""){
		$('#isUsedDiv').removeClass("has-success");
		$('#isUsedDiv').addClass("has-error");
	}else{
		$('#isUsedDiv').removeClass("has-error");
		$('#isUsedDiv').addClass("has-success");
	}
}

function checkValue(){
	var name = $('#resName').val();
	if(name == null || name == ""){
		$('#nameDiv').addClass("has-error");
		$('#resName').attr('placeholder', '资源名称不能为空');
		return false;
	}
	
	var remark = $('#remark').val();
	//alert(option);
	if(remark == ""){
		$('#remarkDiv').addClass("has-error");
		return false;
	}
	
	var option = $('#isUsed').val();
	if(option == ""){
		$('#isUsedDiv').addClass("has-error");
		return false;
	}
	return true;
}


/**
 * 提交操作
 * @returns
 */
$('#submit').click(function(){
	if(checkValue()){
		console.log($('#roleForm').serializeArray());
		//return false;
		var url = "/ji_nan_tourism_gis_old/admin/adminRes-addResource.action";
		var args = {
				'resName' : $.trim($('#resName').val()),
				'remark' : $.trim($('#remark').val()),
				'isUsed' : $.trim($('#isUsed').val()),
				'detail' : $.trim($('#detail').val())
		};
		console.log(args);
		//return false;
		 $.getJSON(url, args, function(data){
			console.log(data);
			if(data == 1){
				console.log("角色添加成功！");
				swal({
                    title: "角色添加成功",
                    text: "页面将在2秒后刷新",
                    type: "success"
                });
                setTimeout(function () {
                	reset();
                	location.reload();//刷新页面
            	},2000)
				
			}else{
				console.log("角色添加失败！");
			}
		});
	}
});

function reset(){
	$('#resName').val("");
	$('#remark').val("");
	$('#isUsed').val("");
	$('#detail').val("");
}