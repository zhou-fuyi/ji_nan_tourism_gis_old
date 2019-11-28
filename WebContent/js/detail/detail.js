"use strict";
// 所有要素

var geolocation = new BMap.Geolocation();

function loadMap(lag, lnt) {
	if(/micromessenger/i.test(navigator.userAgent.toLowerCase())) {
		wx.ready(function() {
			if(!window.__wxjs_environment === "miniprogram") {
				initMap(lag, lnt)
			}
		})
	} else {
		initMap(lag, lnt)

	}

}

function initMap(lag, lnt) {
	var map = new BMap.Map("map"); // 创建地图实例
	// map.disableDragging();
	map.addControl(new BMap.NavigationControl());
	var endPoint = new BMap.Point(lag, lnt); // 创建点坐标

	map.setMapStyle({
		style: 'googlelite'
	});
	map.centerAndZoom(endPoint, 13);
	map.panBy(0, 35);

	/*定位*/
	/*    geolocation.getCurrentPosition(function (r) {
	        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
	            var mk = new BMap.Marker(r.point);
	            map.clearOverlays();
	            // search(mk, endPoint, 'BMAP_DRIVING_POLICY_LEAST_TIME');
	        } else {
	            alert('failed' + this.getStatus());
	        }
	    }, {enableHighAccuracy: true})*/

	var myIcon = new BMap.Icon("/ji_nan_tourism_gis_old/img/location-pin-blue.png", new BMap.Size(32, 32), {
		anchor: new BMap.Size(16, 32),
		imageSize: new BMap.Size(32, 32)
	});
	var marker = new BMap.Marker(endPoint, {
		icon: myIcon
	}); // 创建标注

	map.addOverlay(marker);
	marker.addEventListener("click", function(e) {
		map.enableDragging();
		$('#info').fadeIn();

	});
	map.addEventListener("click", function(e) {
		if(e.overlay == null) {
			$('#info').fadeOut();
		}

	});
	map.addEventListener("touchend", function(e) {
		if(e.overlay == null) {
			$('#info').fadeOut();
		}

	});

	function searchRoute(start, end, route) {
		var transit = new BMap.TransitRoute(map, {
			renderOptions: {
				map: map
			},
			policy: 0,
			onSearchComplete: function(e) {
				if(e.sr.length === 0) {

				}
			}
		});

		transit.search(start, end);

	}

	$("#bus").click(function() {
		$('#bus i').toggle();
		$('#bus img').toggle();
		geolocation.getCurrentPosition(function(r) {
			if(this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				map.clearOverlays();

				searchRoute(mk, endPoint, 'BMAP_TRANSIT_POLICY_LEAST_TIME');
				$('#bus i').toggle();
				$('#bus img').toggle();

			} else {
				alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy: true
		})

	});

	function search(start, end, route) {
		var driving = new BMap.DrivingRoute(map, {
			renderOptions: {
				map: map,
				autoViewport: false
			},
			policy: route,
			onSearchComplete: function(e) {
				if(e.sr.length === 0) {

				}
			}
		});
		driving.search(start, end);
	}

	$("#car").click(function() {
		$('#car i').toggle();
		$('#car img').toggle();
		geolocation.getCurrentPosition(function(r) {
			if(this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				map.clearOverlays();

				search(mk, endPoint, 'BMAP_DRIVING_POLICY_LEAST_TIME');
				$('#car i').toggle();
				$('#car img').toggle();

			} else {
				alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy: true
		})

	});

}
/*var geolocation = new BMap.Geolocation();*/

/*var swiperBrank = new Swiper('.swiper-container-brank', {

	slidesPerView: 4,
	nextButton: '.swiper-button-next',
	prevButton: '.swiper-button-prev',
	spaceBetween: 10
});

var swiper = new Swiper('.swiper-container-gallery', {
	pagination: '#pagination-gallery',
	slidesPerView: 3,
	// slidesPerColumn: 2,
	// paginationClickable: true,
	nextButton: '.gallery-next',
	prevButton: '.gallery-prev',
	spaceBetween: 0
});

var swiperIntro = new Swiper('.swiper-container-intro', {
	scrollbar: '.scrollbar-intro',
	direction: 'vertical',
	slidesPerView: 'auto',
	mousewheelControl: true,
	freeMode: true
});*/
/*
$('#grid').mediaBoxes({

    columns: 3,
    boxesToLoadStart: 6,
    boxesToLoad: 3,
    horizontalSpaceBetweenBoxes: 30,
    verticalSpaceBetweenBoxes: 30,
    minBoxesPerFilter: 20,
    deepLinkingOnFilter: false,
    lazyLoad: false,
    LoadingWord: "加载中...",
    loadMoreWord: "点击查看更多",
    noMoreEntriesWord: "没有更多了"
});*/

//$(function() {

	/*浮动当前位置*/
	/*$.extend({
		'navTop': function() {
			var firstTop = $("#firstTop").offset().top;
			var scrolls = $(window).scrollTop();
			if(scrolls > firstTop) {
				if(window.XMLHttpRequest) {
					$("#float").css({
						position: "fixed",
						top: 0,
						"z-index": 100
					})
				} else {
					$("#float").css({
						top: scrolls
					});
				}
			} else {
				$("#float").css({
					position: "relative",
				})
			};
		},
		'navNow': function() {
			/*当前样式切换*/
			/*
			var firstTop = $("#firstTop").offset().top;
			var scrolls = $(window).scrollTop();
			var P1H = $("a[name='basic']").offset().top;

			var mediaH = $("a[name='media']").offset().top;

			var P2H = $("a[name='gallery']").offset().top;
			var P3H = $("a[name='line']").offset().top;
*/
			/*var P4H = $("a[name='scenic']").offset().top;
			var P5H = $("a[name='recommend']").offset().top;*/
/*
			if(firstTop < scrolls + 30) {
				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#basic']").addClass("now");
			}

			if(mediaH < 30) {

				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#media']").addClass("now");
			}

			if(P2H < 30) {

				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#gallery']").addClass("now");
			}
			if(P3H < 30) {

				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#line']").addClass("now");
			}*/
			/*if(P4H < 30) {

				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#scenic']").addClass("now");
			}
			if(P5H < 30) {

				$("ul.sceneTitle a").removeClass("now");
				$("ul.sceneTitle a[href='#recommend']").addClass("now");
			}*/
			/*

			if(scrolls < firstTop) {
				$("ul.sceneTitle a").removeClass("now");
			};
		}

	});

	$(window).scroll(function() {
		var scrollWidth = $(".container").width();

		$(".sceneTitle").css({
			width: scrollWidth
		});
		$.navTop();
		$.navNow();
	})
})*/

/*$(document).ready(function() {
	$('.info p:not(.not-fold)').each(function() {
		var trimLength = 250;

		if($(this).text().length > trimLength) {
			var text = $(this).html();
			// var trimPoint = $(this).text().indexOf(" ", trimLength);
			var newContent = text.substring(0, trimLength) + '<span class="read-more">' + text.substring(trimLength) + '</span><span class="toggle">... <a href="#">(查看更多)</a></span>';
			$(this).html(newContent);
		}
	});
	$('.toggle a').click(function(e) {
		e.preventDefault();
		var para = $(this).closest('p');
		var initialHeight = $(this).closest('p').innerHeight();
		para.find('.read-more').show();
		para.find('.toggle').hide();
		var newHeight = para.innerHeight();
		para.css('max-height', initialHeight + 'px');
		para.animate({
			maxHeight: newHeight
		}, 100, function() {
			para.css('max-height', 'none');
		});
	});
	//initWeChat(weChatData);

});*/

/*$('#html5-videos').lightGallery({
    selector: '.video-item',
    videojs: true,
    thumbnail:true,

});*/
/*
var lastMusic = new Audio();

lastMusic.onerror = function() {
	console.log("Error " + lastMusic.error.code + "; details: " + lastMusic.error.message);
}
*/
/*$('.audio a').click(function() {
	$('.audio a img').attr('src', '/themes/sdta/assets/images/ele/play.png');

	var audioUrl = $(this).attr('data-mp3');
	var audioImage = $(this).find('img');

	if(lastMusic.src !== encodeURI(audioUrl)) {
		lastMusic.pause();
		lastMusic = new Audio(audioUrl);
		lastMusic.play();
		audioImage.attr('src', '/themes/sdta/assets/images/ele/pause.png');
	} else {
		if(lastMusic.paused) {
			audioImage.attr('src', '/themes/sdta/assets/images/ele/pause.png')
			lastMusic.play();
		} else {
			audioImage.attr('src', '/themes/sdta/assets/images/ele/play.png')
			lastMusic.pause();
		}
	}

});*/
/*
//判断多媒体部分是否太高
var openable = $('.openable');
var openableHeight = openable.height();

if(openableHeight > 400) {
	openable.css({
		height: '300px'
	});
	$('.showmore').toggle();
}

$('.showmore').click(function() {
	$(this).toggle();
	openable.animate({
		height: openableHeight + "px"
	})
})
*/
/*var shareInfo = {};

function initWeChat(obj) {

	$.getJSON("/share/wechat.jsp?url=" + encodeURIComponent(location.href.split('#')[0]), function(data) {
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: data.appId, // 必填，公众号的唯一标识
			timestamp: data.timestamp, // 必填，生成签名的时间戳
			nonceStr: data.nonceStr, // 必填，生成签名的随机串
			signature: data.signature, // 必填，签名，见附录1
			jsApiList: ["onMenuShareTimeline",
				"onMenuShareAppMessage",
			] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});

		wx.ready(function() {

			wx.onMenuShareTimeline({
				title: obj.title + " - 好客山东网", // 分享标题
				link: data.url, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
				imgUrl: obj.imgUrl, // 分享图标
			});

			wx.onMenuShareAppMessage({
				title: obj.title + " - 好客山东网", // 分享标题
				desc: obj.desc, // 分享描述
				link: data.url, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
				imgUrl: obj.imgUrl, // 分享图标
				type: '', // 分享类型,music、video或link，不填默认为link
				dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空

			});

			wx.miniProgram.postMessage({
				data: {
					title: obj.title
				}
			})

		});

	});

	shareInfo = {
		title: obj.title + " - 好客山东网",
		img: obj.imgUrl,
		url: location.href.split('#')[0],
		desc: obj.desc,
		timestamp: +new Date(),
		isShareToFriend: undefined
	};

	if(localStorage.getItem("mode") === "app") {
		$('.icon-wechat').popover({
			content: '<a class="btn btn-primary btn-block" onclick="shareToFriend()">分享给好友</a><a class="btn btn-primary btn-block" onclick="shareToMoments()">分享到朋友圈</a>',
			placement: 'top',
			title: '微信分享',
			html: true
		});

		$.when($.ready).then(function() {
			$('.wechat-qrcode').remove();
			$(".icon-wechat").click(function() {
				$(this).show();
			});
		});

	}

}*/

/*function shareToFriend() {
	shareInfo.isShareToFriend = true;
	localStorage.setItem('wechat-share', JSON.stringify(shareInfo));
	location.reload();

}

function shareToMoments() {
	shareInfo.isShareToFriend = false;
	localStorage.setItem('wechat-share', JSON.stringify(shareInfo));
	location.reload();

}*/