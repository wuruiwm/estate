$(document).ready(function() {
	var getbannerApi = commapi + "banner/select"; //轮播
	var getnoticeApi = commapi + "notice/find"; //公告标题
	var noticedetailsApi = commapi + "notice/content";	//公告详情
	var bestnewhouseApi = commapi + "house/list";	//房源列表
	var provincename='';
	var cityname='';
	var p = '';
	var c = '';
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
		
		
		//切换城市
		(function () {
			var $target = $('.location');
			$target.on('click', function (event) {
				event.stopPropagation();
				$target.citySelect('open');
			});
		
			$target.on('done.ydui.cityselect', function (ret) {
				$(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
				provincename = ret.provance;
				cityname = ret.city;
				p = ret.provance;;
				c = ret.city;
				$('#currentCity').html(cityname); //显示切换城市的位置	
				
				getbestnewList(provincename,cityname);
			});
		})();
		
		
		//加载地图，调用浏览器定位服务
		(function (){
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
					p = provincename = result.province;
					c = cityname = result.city;
					$('#currentCity').html(cityname) //显示当前城市的位置
					console.log(provincename + '/' + cityname);
					getbestnewList(provincename,cityname); //获取当前城市 最新房源列表
				}												
			};
		})();

		
		//首页 获取房源列表	
		function getbestnewList (provincename ,cityname) {	
			$("#bestnewList").html('');
			var page = 1, pageSize = 3;
			console.log(provincename + '#' + cityname);
			var loadMore = function (callback) {
				$.ajax({
					url: bestnewhouseApi,
					type: 'GET',
					async:false,
					data: { 'page': page, 'limit':pageSize, 'province': provincename, 'city':cityname},
					success: function (ret) {
						typeof callback == 'function' && callback(ret);
					}
				});
			};

			$('#J_List').infiniteScroll({
				binder: '#J_List',
				pageSize: pageSize,
				initLoad: true,
				//doneTxt:'没有更多数据',
				loadListFn: function () {
					provincename = p;
					cityname = c;
					var def = $.Deferred();
					loadMore(function (listArr) {
							var html = template('Listitem', {data: listArr});
							$('#bestnewList').append(html).find('img').lazyLoad({binder: '#J_List'});
							def.resolve(listArr);
							$('.list-loading').hide();	
							$('.list-donetip').hide();							
								++page;							
							});
					return def.promise();
				},												
			});				
		}
		
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
		
		
	  //进入新房分销
			$("#getnewhouselist,#newhouseclick").click(function(){
				//provincename  cityname			
				location.href="pages/newhouse.html?province="+ encodeURI(provincename)+'&'+'city='+encodeURI(cityname);
			});
			
		//进入二手房
				$("#getoldhouselist,#oldhouseclick").click(function(){
					//provincename  cityname			
					location.href="pages/oldhouse.html?province="+ encodeURI(provincename)+'&'+'city='+encodeURI(cityname);
				});
				
		//进入我的
			$("#mine").click(function(){
				//provincename  cityname			
				location.href="pages/percenter.html?province="+ encodeURI(provincename)+'&'+'city='+encodeURI(cityname);
			});		
				
});



	