
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
		
		
		//关键字搜索跳转
		$('#searchword').click(function(event){
			location.href="pages/search.html"
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
					provincename = result.province;
					cityname = result.city;
					$("input[name='currenArea']").val(cityname) //显示当前城市的位置
					//console.log(provincename + '/' + cityname);
					getbestnewList(provincename,cityname); //获取当前城市 最新房源列表
				}												
			};
		})();

		
		//首页 获取房源列表	
		function getbestnewList (provincename ,cityname) {	
			console.log(provincename + '--=--' + cityname)
			$("#bestnewList").html('');
			var page = 1, pageSize = 3;		
			var loadMore = function (callback) {
				$.ajax({
					url: bestnewhouseApi,
					type: 'GET',
					async:false,
					data: { 'page': page, 'limit':pageSize, 'province': provincename, 'city':cityname},
					success: function (ret) {
						//console.log(ret);
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
// 					provincename = p;
// 					cityname = c;
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
					console.log(provincename + ' 00000 '+ cityname	)		
					location.href="pages/oldhouse.html?province="+ encodeURI(provincename)+'&'+'city='+encodeURI(cityname);
				});
				
		//进入我的
			$("#mine").click(function(){
				//provincename  cityname			
				location.href="pages/percenter.html?province="+ encodeURI(provincename)+'&'+'city='+encodeURI(cityname);
			});		

		//获取省份列表
		var $as = $('#J_ShowActionSheet');					
		$('#J_ActionSheet').on('click', function () {
			console.log('04')
			var provicelistApi = commapi + 'province/list'; //获取省份				
			$as.actionSheet('open'); //打开城市列表
			$('#CityList').html(''); //清空市内容
			$.ajax({
			url: provicelistApi,
			type: 'GET',
			data: {},             				
			success: function (list) {
					console.log(list);
					var html = template('prolistscript', {data: list});
					$('#ProviceList').html(html);
					$('#AreaList').html('');
				},              
			}); 
		});


//省市区三级联动
	var provicevalue;
	var cityvalue;
	var areavalue;
	var proCode;
	var cityCode;
	var areaCode;
	function proviceclick (e,provicecode,proname){
		var citylistApi = commapi + 'city/list'; //获取市
			$('#AreaList').html(''); //清空区内容
			console.log(provicecode)
			$.ajax({
			url: citylistApi,
			type: 'GET',
			data: {'pid': provicecode},             				
			success: function (citylist) {
					console.log(citylist);
					var html = template('citylistscript', {citylist: citylist});
					$('#CityList').html(html);
				},              
			}); 
				provicevalue = proname;
				proCode = provicecode;
				$('#ProviceList a').removeClass('active'); //高亮显示
				e.classList.add("active");
		};				
	function cityclick (e,citycode,cityname){
		var arealistApi = commapi + 'area/list'; //获取区			
			console.log(citycode)
			$.ajax({
			url: arealistApi,
			type: 'GET',
			data: {'cid': citycode},             				
			success: function (arealist) {
					console.log(arealist);
					var html = template('arealistscript', {arealist: arealist});
					$('#AreaList').html(html);
				},              
			}); 
			cityvalue = cityname;
			cityCode = citycode;
			$('#CityList a').removeClass('active'); //高亮显示
			e.classList.add("active");
		};			
	function areaclick (e,areacode,areaname){
		console.log(areacode);
		$('#J_ShowActionSheet').actionSheet('close');
		$("input[name='currenArea']").val(cityvalue);
		areaCode = areacode;		
		console.log(proCode + '-' + cityCode + '-' + areaCode);
		provincename = provicevalue;
		cityname = cityvalue;
		 getbestnewList(provicevalue,cityvalue);
	}



	