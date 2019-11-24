
var emailFlag = 0;
var passFlag = 0;

// 邮箱验证
var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
function emailgs(txt) {
	var yxgs = "@163.com,@qq.com,@126.com,@139.com,@gmail.com,@hotmail.com,@icloud.com,@sina.com.cn,@sina.com,@sina.cn,@yahoo.com,@foxmail.com,@vip.qq.com,@outlook.com,@aliyun.com,@msn.com,@sohu.com,@live.cn,@live.com,@yeah.net,@yahoo.com.tw,@yahoo.com,@huawei.com,@189.cn,@aol.com,@21cn.com,@tom.com";
	var ezg = txt.value;// 输入框中获取到的字符串
	var ezgfh = ezg.lastIndexOf("\@");
	ezg = ezg.substring(ezgfh, ezg.length);// 截取 @ 后面的字符串
	var ey = 0;
	if (yxgs.indexOf(ezg) > -1) {
		ey = 1;// 在给定的后缀中查找是否符合给定后缀 如果合法 则 ey=1
	} else {
		ey = 0;
	}

	if(ezg == null || ezg == ""){
		emailFlag = 1;
		$("#email").addClass("err");
	}else if (!myreg.test(txt.value) || txt.value.length >= 30 || ey == 0) {
		emailFlag = 1;
		// 使用正则表达式验证输入框字符串
		$("#email").addClass("err");
		$("#email").attr('placeholder', '邮箱格式错误');
		$('.youxiang').tooltip('show');
	} else {
		emailFlag = 0;
		$('.youxiang').tooltip('hide');
		$("#email").removeClass("err");
	}
}

//密码校验
function pwdpd() {
	var mpwd1 = $("#password").val()
	if (mpwd1 == null || mpwd1 == "") {
		passFlag = 1;
		$("#password").addClass("err");
	} else if (mpwd1.length < 6 || mpwd1.length > 20) {
		passFlag = 1;
		$("#password").addClass("err");
		//$("#password").attr('placeholder', '密码输入错误');
		$('.i-pwd').attr('title', "密码长度为6~20个字符").tooltip('fixTitle')
				.tooltip('show');
	} else if (/^[0-9a-zA-Z]{0,}$/g.test(mpwd1) != true) {
		passFlag = 1;
		$("#password").addClass("err");
		//$("#password").attr('placeholder', '密码输入错误');
		$('.i-pwd').attr('title', "不能包含特殊字符！").tooltip('fixTitle').tooltip('show');
	} else {
		passFlag = 0;
		$("#password").removeClass("err");
		$('.i-pwd').tooltip('hide');
	}
}

function check(){
	//alert(emailFlag);
	//alert(passFlag);
	var email = $("#email").val();
	var pass = $("#password").val();
	if(email == null || email == ""){
		$("#email").addClass("err");
		emailFlag = 1;
	}
	if(pass == null || pass == ""){
		$("#password").addClass("err");
		passFlag = 1;
	}
	if(emailFlag == 0 && passFlag == 0){
		$("#email").removeClass("err");
		$("#password").removeClass("err");
		return true;
	}else{
		return false;
	}
}

function logout() {
	//alert("121");
    swal({
        title: "您确定要离开魅力济南社区吗？魅力济南-在旅途",
        text: "离开后无法时刻进行交流，请谨慎操作！",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "狠心离开",
        closeOnConfirm: false
    }, function () {
        swal("操作成功！", "您已经成功下线。", "success");
        window.location.href = "user/user-logout.action";
    });
    return false;
}





