$(document).ready(function() {
	var getbannerApi = commapi + "banner/select";
	var getnoticeApi = commapi + "notice/find";
	var noticedetailsApi = commapi + "notice/content";	
	 //底部导航高亮显示
	  $('.m-tabbar a').each(function () {
			$(this).click(function() {
				$('.m-tabbar a').removeClass('tabbar-active');
				$(this).addClass('tabbar-active');
			})
		});
	
		// 获取首页banner图
		$.ajax({
				url : getbannerApi,
				type : "get",
				data: {'id': 1},
				success : function(result) {
					console.log(result);
					var imageList = result; //banner图数组列表
					var html = template('bannerscr', {data: imageList});
					  $('#bannerList').html(html);
						$('#bannerImage').slider({
								speed: 200,
								autoplay: 3000,
								lazyLoad: true
						});
				},
				error:function(msg){
						console.log(msg) // 失败返回
				}
		});
		
		//加载地图，调用浏览器定位服务
		var map, geolocation;
		map = new AMap.Map('container', {
		resizeEnable: true
		});
		map.plugin('AMap.Geolocation', function() {
		geolocation = new AMap.Geolocation({
				enableHighAccuracy: true, 
				timeout: 10000 
				});
			geolocation.getCityInfo(getCity)
		});
		function getCity(status, result) {
			if(status!='complete'){
			console.log(status)
			showToast('定位失败');
			}else{
			console.log(result.province);
			console.log(result.city);
			var currentCity = result.city;
			$('#currentCity').html(currentCity) //显示当前城市的位置
			}
		};
		
		//切换城市
		!function () {
			var $target = $('#currentCity');
			$target.on('click', function (event) {
				event.stopPropagation();
				$target.citySelect('open');
			});
		
			$target.on('done.ydui.cityselect', function (ret) {
				$(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
				//console.log(ret);
				var changeCity = ret.city;
				$('#currentCity').html(changeCity) //显示切换城市的位置
			});
		}();
		
		//获取公告
		$.ajax({
				url : getnoticeApi,
				type : "get",
				data: {},
				success : function(result) {
					var noticetitle = result.title;//公告标题
					var titleId = result.id;
					$('.notice .desc').attr('data-id',titleId);
					$('.notice .desc').html(noticetitle);
				},
				error:function(msg){
						console.log(msg) // 失败返回
				}
		});
		
		//进入公告
		$('.notice').click(function(){
			var dataid = $(this).find('.desc').attr('data-id');
			$.ajax({
					url : noticedetailsApi,
					type : "get",
					data: {'id': dataid},
					success : function(result) {
						location.href="pages/noticedetails.html?id="+dataid;
					},
					error:function(msg){
							console.log(msg) // 失败返回
					}
			});
		});
		
		
});


	