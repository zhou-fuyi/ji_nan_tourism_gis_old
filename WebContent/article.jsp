<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="shortcut icon" href="img/icon.jpg" />

<!-- 登录模态框css -->
<link rel="stylesheet" type="text/css" href="css/http _www.jq22.com_css_my.css" />


<!-- 文章页引入css -->
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>文章详情</title>
<style type="text/css">
.mylogo h3 {
	font-family: '楷体';
	font-weight: bold;
	padding-top: 0;
	margin-top: 16px;
}

.mylogo {
	text-decoration: none; /* 在这里进行样式去除无效 */
	color: #333;
	margin: 0;
	height: 50px;
	text-align: center;
}

.carousel-inner .item img {
	margin: 0 auto;
}

.info {
	text-decoration: none;
	color: #666666;
}

.info:hover {
	text-decoration: none;
	color: #666666;
}

.iteminfo {
	white-space: nowrap;
	overflow: hidden;
	/*制定文本溢出时将溢出部分隐藏*/
	text-overflow: ellipsis;
	/*并在边缘处以—— ... 方式显示*/
	/*border: 1px solid black;*/
}

.formbar {
	margin-left: 120px;
}

.formbar input {
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	background: #F9F0DA;
	color: #9E9C9C;
}

.formbar button {
	top: 0;
	right: 0;
	background: #7BA7AB;
	border-radius: 0 5px 5px 0;
}

.formbar button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

.btnbar {
	border: none;
	outline: none;
	height: 34px;
	cursor: pointer;
	/*position: absolute;*/
}
</style>
</head>
<body class="gray-bg">
    <nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
		    <div class="navbar-header">
			    <a href="#" class="navbar-brand" style="padding: 0; margin-top: 0;">
				    <img src="img/logo.png" alt="魅力济南">
			    </a>
			    <a href="index.html" class="navbar-nav mylogo" style="text-decoration: none;">
                	<h3 style="font-size: 24px;">在旅途</h3>
			    </a>
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">切换导航</span><span class="icon-bar"></span>
					<span class="icon-bar"></span><span class="icon-bar"></span>
				</button>
		    </div>
	        <div class="collapse navbar-collapse" id="navbar-collapse">
		        <ul class="nav navbar-nav navbar-left" style="margin-top: 0; margin-left: 80px;">
					<li class="active">
						<a href="#">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 
						</a>
					</li>
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-list"></span> 资讯 
						</a>
					</li>
					<li>
						<a href="testMap.html">
							<span class="glyphicon glyphicon-fire"></span> 景区
						</a>
					</li>
					<li>
						<a href="#">
							<span class="glyphicon glyphicon-question-sign"></span> 关于 
						</a>
					</li>
					<li>
						<a href="register.html" target="_blank" style="padding-right: 0; margin-right: 0;">
							<span class="glyphicon glyphicon-user"></span> 注册/
						</a>
					</li>
					<li>
						<a href="#" data-toggle="modal" data-target="#myModal" style="padding-left: 0; margin-left: 0;">登录</a>
					</li>
				</ul>
				<form class="navbar-form navbar-left formbar form-inline" role="search">
				<div class="form-group">
					<div class="input-group" style="height: 35px;">
						<input class="form-control" type="text" style="height: 35px;" />
						<div class="input-group-addon" style="height: 35px; padding: 0;">
							<button type="submit" class="btnbar btn" style="margin: 0;"></button>
						</div>
					</div>
	            </div>
	 	        </form>
	        </div>
		</div>
	</nav>
	<!--
       	作者：thread_j@163.com
       	时间：2018-03-28
       	描述：导航栏结束
    -->

	<!-- 模态框（Modal）开始 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"">
		<div class="modal-dialog ">
			<div class="modal-content2 tcc ">
				<div class="modal-header2 top20 ">
					<button type="button " class="close " data-dismiss="modal " aria-hidden="true ">&times;</button>
					<h4 class="modal-title " id="myModalLabel "></h4>
				</div>
				<div class="modal-body tcck ">
					<form>
						<div class="input-group input-group-lg parentCls">
							<span class="input-group-addon" id="email">
								<i class="glyphicon glyphicon-envelope"></i>
							</span>
							<input type="text" class="form-control inputElem" placeholder="请输入登录邮箱 " aria-describedby="email" id="email" style="width: 466px;">
						</div>
						<div class="input-group input-group-lg top20">
							<span class="input-group-addon" id="pwd">
								<i class="glyphicon glyphicon-lock" style="width: 18px"></i>
							</span>
							<input type="password" class="form-control" placeholder="请输入登录密码 " aria-describedby="pwd" id="password">
							<span class="input-group-btn tccBut">
								<button class="btn btn-success" type="button" onclick="emdl()">登 录</button>
							</span>
						</div>
					</form>
				</div>

				<div class="modal-footer2 ">
					<div class="f ">
						<a href="pwd.aspx ">忘记密码?</a>
					</div>
					<div class="r ">
						<a href="register.aspx ">注册新用户</a>
					</div>
					<div class="dr "></div>
				</div>

				<div class="d3f modal-body tcck2">
					<a href="#" onClick="tz()" class="qq"></a>
					<a href="https://api.weibo.com:443/oauth2/authorize?client_id=3364913104&redirect_uri=http%3A%2F%2Fwww.jq22.com%2FWeiboReturn.aspx&response_type=code&display=default" class="sina"></a>
					<a href="http://www.jq22.com/zfbReturn.aspx" class="zfb"></a>
					<a href="#" onClick="gt()" class="git"></a>
				</div>
				<script>
					function tz() {
						var urldz = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101135281&redirect_uri=http://www.jq22.com/QQReturn.aspx?tjurl="
								+ window.location.href;
						window.location.href = urldz;
					}

					function gt() {
						var urldz = " https://github.com/login/oauth/authorize?client_id=cf869185ea7d8fcab6df&state=jq22&redirect_uri=http://www.jq22.com/github.aspx?tjurl="
								+ window.location.href;
						window.location.href = urldz;
					}
				</script>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--
       	作者：thread_j@163.com
       	时间：2018-03-28
       	描述：模态框结束
    -->
    
    <!-- 文章内容开始   -->
    <div class="wrapper wrapper-content  animated fadeInRight article" style="margin-top: 50px;">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="pull-right">
                            <button class="btn btn-white btn-xs" type="button">700BIKE</button>
                            <button class="btn btn-white btn-xs" type="button">BeginOne</button>
                            <button class="btn btn-white btn-xs" type="button">乐视超级自行车</button>
                        </div>
                        <div class="text-center article-title">
                            <h1>
                                    自行车都智能化了，你可知道它的历史？
                                </h1>
                        </div>
                        <p>
                            在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
                        </p>
                        <p>
                            兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo 为我们梳理了自行车发展的关键节点。
                        </p>
                        <p>
                            在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。
                        </p>
                        <p>
                            比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
                        </p>
                        <p>
                            德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到 15km/h。不过，还是需要靠双脚蹬地提供动力。
                        </p>
                        <p>
                            这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。
                        </p>
                        <p>
                            在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
                        </p>
                        <p>
                            兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo 为我们梳理了自行车发展的关键节点。
                        </p>
                        <p>
                            在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。
                        </p>
                        <p>
                            比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
                        </p>
                        <p>
                            德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到 15km/h。不过，还是需要靠双脚蹬地提供动力。
                        </p>
                        <p>
                            这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。
                        </p>
                        <p>
                            在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
                        </p>
                        <p>
                            兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo 为我们梳理了自行车发展的关键节点。
                        </p>
                        <p>
                            在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。
                        </p>
                        <p>
                            比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
                        </p>
                        <p>
                            德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到 15km/h。不过，还是需要靠双脚蹬地提供动力。
                        </p>
                        <p>
                            这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。
                        </p>
                        <p>
                            在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
                        </p>
                        <p>
                            兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo 为我们梳理了自行车发展的关键节点。
                        </p>
                        <p>
                            在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。
                        </p>
                        <p>
                            比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
                        </p>
                        <p>
                            德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到 15km/h。不过，还是需要靠双脚蹬地提供动力。
                        </p>
                        <p>
                            这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。
                        </p>
                        <hr>

                        <div class="row">
                            <div class="col-lg-12">

                                <h2>评论：</h2>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="img/a1.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    逆光狂胜蔡舞娘
                                                </a>
                                            <small class="text-muted">17 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            好东西，我朝淘宝准备跟进，1折开卖
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="img/a2.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    避雷范儿
                                                </a>
                                            <small class="text-muted"> 16 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            第一个真的好美 就是噪音太大了 挺唯美的意境瞬间变成工厂了
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="img/a3.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    kamppi
                                                </a>
                                            <small class="text-muted"> 6 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            好美的装置艺术，第二个让我想起了海中缓缓游动的鲸鱼。
                                        </p>
                                    </div>
                                </div>
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="" class="pull-left">
                                            <img alt="image" src="img/a5.jpg">
                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    kamppi
                                                </a>
                                            <small class="text-muted">6 小时前</small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            “Flylight 的灯管并不固定，由一套软件控制：每一个灯管都根据与其它灯管的互动进行移动，就像一群真正的鸟群一样。” 好像介绍的描述不对，灯管是固定的，控制的只是点亮和熄灭的时间，模拟成一团亮点移动
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- 文章内容结束   -->
    
    
    
    
	<!-- 页脚 -->
	<footer id="footer " class="text-muted "
		style="background-color: #5E5E5E;padding: 20px;text-align: center;border-top: 1px solid #8C8C8C;color: #E3E3E3;margin-top: 20px; ">
	<div class="container ">
		<p>地址：山东省济南市长清区海棠路5001号山东交通学院4号公寓楼北楼525" &nbsp;&nbsp;
			电话:178-6298-0863</p>
		<p>鲁ICP备 1818948. © 2018-2026 魅力济南行官网. &nbsp;&nbsp;Powered by
			Bootstrap.</p>
	</div>
	</footer>
	<!-- 页脚结束 -->
	
	
	
	<!-- 全局js -->
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>



    <!-- 自定义js -->
    <script src="js/content.js"></script>


    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->
	
	
	
</body>
</html>