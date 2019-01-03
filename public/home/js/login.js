//用户登录
$(document).ready(function(){
//点击记住密码
		$('#remeberpwd').click(function(){
			if(!$(this).hasClass('clickred')){
				$(this).addClass('clickred');
				$(this).addClass('fa-check-square');
				$(this).removeClass('fa-square-o');
			}else{
				$(this).removeClass('clickred');
				$(this).removeClass('fa-check-square');
				$(this).addClass('fa-square-o');
				
				localStorage.removeItem('admin'); //清除账号
				localStorage.removeItem('password'); //清除密码								
			}
	});
	
	//拿到上次登录的账号和密码
	if(dataadmin && datapassword){
		$("input[name='mobile']").val(dataadmin);
		$("input[name='password']").val(datapassword);	
		$('#remeberpwd').addClass('clickred');
		$('#remeberpwd').addClass('fa-check-square');
		$('#remeberpwd').removeClass('fa-square-o');
	}
	
	var loginApi = commapi + "user/login"; //登录接口地址
	$(".truelogin").click(function() {
           var tel = $("input[name='mobile']").val();
           var passwd = $("input[name='password']").val();					 
					 var remeberpwd = { //记住密码
						 'mobile': tel,
						 'password': passwd,
						 'expires': 1
					 }
					 var noremeberpwd = { //不记住密码
						 'mobile': tel,
						 'password': passwd,					 
					 }					 
					 if($('#remeberpwd').hasClass('clickred')){
						 localStorage.setItem('admin', tel);
						 localStorage.setItem('password', passwd);					 						 
						 var datalist = remeberpwd;
					 }else{
						 var datalist = noremeberpwd;
					 }
					 
           $.ajax({
               url : loginApi,
               type : "POST",
               data : datalist,
               success : function(result) {
							console.log(result);
							 var token = result.token; // 保存token值
							 var moretime = result.expires; //token的时效
							 localStorage.setItem('token', token);
							 localStorage.setItem('moretime', moretime);

								!function (win, $) {
									var dialog = win.YDUI.dialog;
									/* 加载中提示框 */									
										dialog.loading.open('登录中...');
										setTimeout(function () {
											dialog.loading.close();/* 移除loading */
											location.href="../index.html";
										}, 2000);
								
							 }(window, jQuery);	
                   
               },
               error:function(msg){
                   console.log(msg) // 失败返回
									 console.log('0')
                   var json=JSON.parse(msg.responseText);
                   // 验证不通过
                   if(json.errorCode==40000){
										 YDUI.dialog.toast(json.msg, 'none', 2000);                       
                   }
                   // 用户名不存在
                   if(json.errorCode==40301){
                     YDUI.dialog.toast(json.msg, 'none', 2000);   
                   }
               }
           })
           return false;
       });
	

	
});