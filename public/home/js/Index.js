
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
		$(document).ready(function(){
			var geolocation = new BMap.Geolocation();
			geolocation.getCurrentPosition(function(r){
				console.log(r)
				if (this.getStatus() == BMAP_STATUS_SUCCESS) {
					lat = r.point.lat;
					lng = r.point.lng;
					province= r.address.province;
					city = r.address.city;
					provincename = province;
					cityname = city;
					console.log(province+'22'+city)
					getbestnewList(provincename,cityname);
					$("input[name='currenArea']").val(cityname);									
				}
				//根据经纬度获取具体的 区位置信息
				$.ajax({					
						url: 'http://api.map.baidu.com/geocoder/v2/?location='+ lat +','+ lng +'&output=json&ak=QCeZYkMaipgWAeoedA3Ff23dfO3UZL1f&callback=showLocation',  
						type: 'GET',  
						dataType: 'jsonp',
						success:function(location) {
							//拿到省市区获取数据库的省市区id，带到报备客户去直接显示当前城市
							var baobeiprovince = location.result.addressComponent.province;
							var baobeicity = location.result.addressComponent.city;
							var baobeiarea = location.result.addressComponent.district;
							var getcityidApi= commapi + 'city/each_id';
							$.ajax({
									url: getcityidApi,  
									type: 'GET',  
									dataType: 'json',
									data: {'province_name': baobeiprovince, 'city_name': baobeicity, 'area_name':baobeiarea},
									success:function(data) {
											//保存省市区的名称和id，在报备里面直接在混缓存里获取id，与数据库的id匹配										
											sessionStorage.setItem('provicename', baobeiprovince);
											sessionStorage.setItem('cityname', baobeicity);
											sessionStorage.setItem('areaname', baobeiarea);										
											sessionStorage.setItem('proviceid', data.province_id);
											sessionStorage.setItem('cityid', data.city_id);
											sessionStorage.setItem('areaid', data.area_id);										
									}
								});							
						}
				});
			})
		});
		
// 		$(function(){
// 			//获取城市ajax
// 		$.ajax({
// 		url: 'http://api.map.baidu.com/location/ip?ak=ia6HfFL660Bvh43exmH9LrI6',  
// 		type: 'POST',  
// 		dataType: 'jsonp',
// 		success:function(data) {
// 			console.log(data)
// 			console.log(JSON.stringify(data.content.address_detail.province + "," + data.content.address_detail.city));
// 			provincename = data.content.address_detail.province;
// 			cityname = data.content.address_detail.city;
// 			provincename = provincename.replace(/\"/g, "");
// 			cityname = cityname.replace(/\"/g, "");
// 			getbestnewList(provincename,cityname);
// 			$("input[name='currenArea']").val(cityname)
// 		}
// 		});
// })
		
		
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
						console.log(ret);
						if(ret.length == 0){
							$('#bestnewList').html("<p style='text-align:center;padding-top:1rem;'>暂无相关房源信息！</p>")
						}
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
				sessionStorage.setItem('provicename', provicevalue); //把选中的省份名存到缓存
				sessionStorage.setItem('proviceid', proCode);//把选中的省份id存到缓存
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
			sessionStorage.setItem('cityname', cityvalue); //把选中的市名存到缓存
			sessionStorage.setItem('cityid', cityCode);//把选中的市id存到缓存
		};			
	function areaclick (e,areacode,areaname){
		console.log(areacode);
		$('#J_ShowActionSheet').actionSheet('close');
		$("input[name='currenArea']").val(cityvalue);
		areaCode = areacode;		
		console.log(proCode + '-' + cityCode + '-' + areaCode);
		provincename = provicevalue;
		cityname = cityvalue;
		getbestnewList(provicevalue,cityvalue);  //选完区就更新房源信息列表	
		sessionStorage.setItem('areaname', areaname); //把选中的区县名存到缓存
		sessionStorage.setItem('areaid', areaCode);//把选中的区县id存到缓存				
	}



	