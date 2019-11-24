 var wait = 30;
    var ea = 0;
    var ea2 = 0;//邮箱号是否已经被使用  0标识没有

    //邮箱验证  输入邮箱  失去焦点时候出发
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    function emailgs(txt) {
        var yxgs = "@163.com,@qq.com,@126.com,@139.com,@gmail.com,@hotmail.com,@icloud.com,@sina.com.cn,@sina.com,@sina.cn,@yahoo.com,@foxmail.com,@vip.qq.com,@outlook.com,@aliyun.com,@msn.com,@sohu.com,@live.cn,@live.com,@yeah.net,@yahoo.com.tw,@yahoo.com,@huawei.com,@189.cn,@aol.com,@21cn.com,@tom.com";
        var ezg = txt.value;
        var ezgfh = ezg.lastIndexOf("\@");
        ezg = ezg.substring(ezgfh, ezg.length);
        var ey = 0;
        if (yxgs.indexOf(ezg) > -1) {
            ey = 1;
        } else {
            ey = 0;
        }

        if(ezg == null || ezg == ""){
        	$("#myemail").addClass("err");
            //$("#myemail").attr('placeholder', '请输入邮箱地址');
        }else if (!myreg.test(txt.value) || txt.value.length >= 30 || ey==0){
            $("#myemail").addClass("err");
            $("#myemail").attr('placeholder', '邮箱格式错误');
            $('.youxiang').tooltip('show');
        }else{
    	    //这里是进行邮箱号是否已经被使用的校验
            $('.youxiang').tooltip('hide');
            $("#myemail").removeClass("err");
            var emyz = $.ajax({
                type: 'post',
                url: 'user-isExistUser.action',
                data: { 'userEmail': txt.value },
                cache: false,
                dataType: 'text',
                success: function (data) {
                	//alert(data);
                    if (data == "0") {
                        $("#empdts").css("display", "none");
                        ea2 = 0;
                    } else {
                        $("#empdts").css("display", "block");
                        ea2 = 1;
                    }
                },
                error: function () { }
            });
        }
    }
    //验证用户名
    function yhmok(txt) {

    	if(txt.value == null || txt.value == ""){
    		$("#myhm").addClass("err");
            $("#myhm").attr('placeholder', '请输入用户名');
    	}else if (txt.value.length >= 30 || txt.value.length < 2) {
            $("#myhm").addClass("err");
            $("#myhm").attr('placeholder', '用户名输入错误');
            $('.fa-user-secret').attr('title', '用户名长度在2~30隔字符之间').tooltip('fixTitle').tooltip('show');
        }else if (/^[0-9a-zA-Z]{0,}$/g.test(txt.value) != true) {
            $("#myhm").addClass("err");
            $("#myhm").attr('placeholder', '用户名格式错误');
            $('.fa-user-secret').attr('title', '用户名为英文或和数字组合').tooltip('fixTitle').tooltip('show');
        }else {
            $('.fa-user-secret').tooltip('hide');
            $("#myhm").removeClass("err");
            var emyz = $.ajax({
                type: 'post',
                url: 'user-isExistUserName.action',
                data: { 'userName': txt.value },
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if (data == "0") {
                        $("#yhts").css("display", "none");
                    } else {
                        $("#yhts").css("display", "block");
                    }
                },
                error: function () { }
            });
        }
    }  
    
    /**
     * 这里是发送邮件验证码  当点击的时候  发送验证码
     */
    document.getElementById("bt").onclick = function () { time(this); }
    function time(o) {
        if (wait == 30) {
            var myemail = $("#myemail").val();
            if (!myreg.test(myemail) || myemail.length >= 30) {
                $("#myemail").addClass("err");
                $("#myemail").attr('placeholder', '邮箱格错误')
                ea = 1;//标识邮箱号是否合法
            } else {
                ea = 0;
                var yz = $.ajax({
                    type: 'post',
                    url: 'user-sendMail.action',
                    data: { 'userEmail': myemail },
                    cache: false,
                    dataType: 'text',
                    success: function (data) {
                        if (data == "1") {
                        	
                        } else {
                        	ea = 1;
                        	alert("系统异常，邮件发送失败");
                        }
                    },
                    error: function () { }
                });
            }
        }

        if (wait == 0 && ea2==0)
        {
            o.removeAttribute("disabled");
            o.value = "获取验证码";
            wait = 30;
        }
        else if (ea == 0 && ea2==0)
        {
            o.setAttribute("disabled", true);
            o.value = "已发送(重发" + wait + ")";
            wait--;
            setTimeout(function () {
                time(o)
            },
            1000)
        }          
    }
    //验证码   这个并没有被使用
    function verification(obj) {
        var verificode = $(obj).val();
        //alert(verificode.length);
        //alert(verificode)
        if (verificode == "") {
        	$(obj).addClass("err");
        } else if(verificode.length != 32){
        	$(obj).addClass("err");
        	$(obj).attr('placeholder', '验证码输入错误');
        	$('.activationCode').attr('title', '验证码为32位字符串').tooltip('fixTitle').tooltip('show');
        }else{        
            var yz = $.ajax({
                type: 'post',
                url: 'user-validateActivationCode.action',
                data: { 'activationCode': verificode },
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if (data == "-1") {
                    	$(obj).addClass("err");
                    	$('.fa-activationCode').attr('title', '验证码输入错误').tooltip('fixTitle').tooltip('show');
                    } else if(data == "0") {
                    	$(obj).addClass("err");
                    	$(obj).attr('placeholder', '验证码已过期');
                    	$(obj).val("");
                    	$('.activationCode').attr('title', '验证码已过期，请重新发送').tooltip('fixTitle').tooltip('show');
                    }else{
                    	$(obj).removeClass("err");
                    	$('.activationCode').tooltip('hide');
                    }
                },
                error: function () { }
            });
        }
    }
    
    function pwdpd(){
    	var mpwd1 = $("#pwd1").val();
    	if(mpwd1 == ""){
    		 $("#pwd1").addClass("err");
             //$("#pwd1").attr('placeholder', '请输入登录密码');
    	}else if(mpwd1.length < 6 || mpwd1.length > 20){
    		 $("#pwd1").addClass("err");
             //$("#pwd1").attr('placeholder', '密码长度在6~20个字符长度');
    		 $('.fa-lock').attr('title', '密码长度在6~20个字符长度').tooltip('fixTitle').tooltip('show');
    	}else if(/^[0-9a-zA-Z]{0,}$/g.test(mpwd1) != true){
    		$("#pwd1").addClass("err");
    		$('.fa-lock').attr('title', '密码格式为数字字母组合').tooltip('fixTitle').tooltip('show');
    	}else{
    		 $("#pwd1").removeClass("err");
             $('.fa-lock').tooltip('hide');
    	}
    }
   
    function confirmPass() {
        var mpwd1 = $("#pwd1").val();
        var mpwd2 = $("#pwd2").val();
        if(mpwd2 == ""){
        	$("#pwd2").addClass("err");
        	$("#pwd2").attr('placeholder', '请再次输入密码');
        }else if (mpwd1 != mpwd2) {
            $("#pwd2").addClass("err");
            $("#pwd2").attr('placeholder', '两次输入的密码不一致');
            $('.fa-key').tooltip('show');
        } else {
            $("#pwd2").removeClass("err");
            $('.fa-key').tooltip('hide');
        }

    }
    function tj() {
        var myemail = $("#myemail").val();
        var myhm = $("#myhm").val();
        var myzm = $("#yzm").val();

        var mpwd1 = $("#pwd1").val();
        var mpwd2 = $("#pwd2").val();
                
        if (!myreg.test(myemail) || myemail.length >= 30) {
            $("#myemail").addClass("err");
            $("#myemail").attr('placeholder', '邮箱格错误')
        }
        else if (myhm.length >= 30 || myhm.length < 2 || /^[0-9a-zA-Z]{0,}$/g.test(myhm) != true)
        {
            $("#myhm").addClass("err");
            $("#myhm").attr('placeholder', '用户名错误')
        }
        else if (mpwd1 != mpwd2 || mpwd2.length < 5) {
            $("#pwd2").addClass("err");
            $("#pwd2").attr('placeholder', '密码错误')
        }
        else {
        	
        	var yz = $.ajax({
                type: 'post',
                url: 'user-validateUser.action',
                //'userName': myhm, 'activationCode': myzm, 'userPass': mpwd1, 'rePassword': mpwd2 
                data: { 'userEmail': myemail ,
                	    'userName': myhm, 
                	    'activationCode': myzm, 
                	    'userPass': mpwd1, 
                	    'rePassword': mpwd2},
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if (data == "1") {
                    	document.getElementById("registerForm").submit();
                    } else {
                    	ea = 1;
                    	alert("系统异常，用户注册失败");
                    }
                },
                error: function () { }
        	});
        	
        }
    }