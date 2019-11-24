
var emailFlag = 0;
var passFlag = 0;

// 邮箱验证
var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
function emailCheck(txt) {
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
		$("#email").addClass("layui-bg-red");
		$("#email").attr('placeholder', '请输入邮箱地址');
	}else if (!myreg.test(txt.value) || txt.value.length >= 30 || ey == 0) {
		emailFlag = 1;
		// 使用正则表达式验证输入框字符串
		//$("#email").addClass("layui-bg-red");
		$("#email").attr('placeholder', '邮箱格式错误');
	} else {
		emailFlag = 0;
		$("#email").attr('placeholder', '这里输入用户名');
	}
}

//密码校验
function passCheck() {
	var mpwd1 = $("#password").val()
	if (mpwd1 == null || mpwd1 == "") {
		passFlag = 1;
		$("#password").attr('placeholder', '请输入密码');
		//$("#password").addClass("layui-bg-red");
	} else if (mpwd1.length < 5 || mpwd1.length > 20) {
		passFlag = 1;
		//$("#password").addClass("err");
		//$("#password").attr('placeholder', '密码输入错误');
		$("#password").attr('placeholder', '密码长度为5~20个字符之间');
		
	} else if (/^[0-9a-zA-Z]{0,}$/g.test(mpwd1) != true) {
		passFlag = 1;
		//$("#password").addClass("err");
		$("#password").attr('placeholder', '密码格式为数字字母组合');
	} else {
		passFlag = 0;
		$("#password").attr('placeholder', '这里输入密码');
	}
}

function check(){
	//alert(emailFlag);
	//alert(passFlag);
	var email = $("#email").val();
	var pass = $("#password").val();
	if(email == null || email == ""){
		$("#email").attr('placeholder', '请输入邮箱地址');
		emailFlag = 1;
	}
	if(pass == null || pass == ""){
		$("#password").attr('placeholder', '请输入密码');
		passFlag = 1;
	}
	if(emailFlag == 0 && passFlag == 0){
		$("#email").attr('placeholder', '这里输入用户名');
		$("#password").attr('placeholder', '这里输入密码');
		return true;
	}else{
		return false;
	}
}


/**
 * 管理员登陆
 * @returns
 */
function submit(){
	console.log($("#email").val());
	console.log($("#password").val());
	var email = $("#email").val();
	var password = $("#password").val();
	var result = $.ajax({
        type: 'post',
        url: 'admin/admin-login.action',
        //'userName': myhm, 'activationCode': myzm, 'userPass': mpwd1, 'rePassword': mpwd2 
        data: { 'adminEmail': email ,
        	    'adminPass': password},
        cache: false,
        dataType: 'text',
        success: function (data) {
        	console.log(data);
            if (data == "-1") {
            	console.log("用户名或密码为空");
            } else if(data == "0"){
            	console.log("用户名或密码错误");
            }else if(data == "1"){
            	console.log("登陆成功,开始跳转");
            	window.location.href = "/jinan_tourism_gis/admin/index.jsp"
            }else{
            	console.log("系统异常,登陆失败！");
            }
        },
        error: function () { alert("系统异常");}
	});
	
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
        window.location.href = "/jinan_tourism_gis/admin/admin-logout.action";
    });
    return false;
}





