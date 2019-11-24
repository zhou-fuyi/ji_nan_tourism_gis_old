
function checkUserPass(){
	var userPass = $('#userPass').val();
	console.log(userPass);
	if(userPass == null || userPass == ""){
		$('#userPassDiv').addClass("has-error");
		$('#userPass').attr('placeholder', '原密码不能为空');
	}else{
		$('#userPassDiv').removeClass("has-error");
		$('#userPassDiv').addClass("has-success");
		$('#userPass').attr('placeholder', '这里输入原密码');
	}
}

function checkNewPass(){
	var userPass = $('#newPass').val();
	console.log(userPass);
	if(userPass == null || userPass == ""){
		$('#newPassDiv').addClass("has-error");
		$('#newPass').attr('placeholder', '新密码不能为空');
	}else{
		$('#newPassDiv').removeClass("has-error");
		$('#newPassDiv').addClass("has-success");
		$('#newPass').attr('placeholder', '这里输入新密码');
	}
}

function checkRePassWord(){
	var userPass = $('#rePassword').val();
	console.log(userPass);
	if(userPass == null || userPass == ""){
		$('#rePasswordDiv').addClass("has-error");
		$('#rePassword').attr('placeholder', '请再次输入新密码');
	}else{
		$('#rePasswordDiv').removeClass("has-error");
		$('#rePasswordDiv').addClass("has-success");
		$('#rePassword').attr('placeholder', '在这里再次输入新密码');
	}
}

function checkValue(){
	var userPass = $('#userPass').val();
	if(userPass == null || userPass == ""){
		$('#newPassDiv').addClass("has-error");
		return false;
	}
	var newPass = $('#newPass').val();
	if(newPass == null || newPass == ""){
		$('#newPassDiv').addClass("has-error");
		return false;
	}
	var rePassword = $('#rePassword').val();
	if(rePassword == null || rePassword == ""){
		$('#rePasswordDiv').addClass("has-error");
		return false;
	}
	return true;
}

$('#submitSelfPass').click(function(){
	console.log(checkValue());
    if(checkValue()){
    	var url = "/jinan_tourism_gis/user/users-updateUserPass.action";
        var args = {
                'userId' : $.trim($('#userId2').val()),
                'userPass' : $.trim($('#userPass').val()),
                'rePassword' : $.trim($('#rePassword').val())
            };
        console.log(args);
        $.getJSON(url, args, function(data){
            if(data == 1){
                alert("密码修改成功");
                window.location.reload();
            }else{
                alert("密码修改失败");
            }
        });
    }
});
