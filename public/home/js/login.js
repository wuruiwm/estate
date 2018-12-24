//用户登录
$(document).ready(function(){
	var loginApi = commapi + "user/login"; //登录接口地址
	$(".truelogin").click(function() {
           var tel = $("input[name='mobile']").val();
           var passwd = $("input[name='password']").val();
           $.ajax({
               url : loginApi,
               type : "POST",
               data : {'mobile':tel,'password':passwd},
               success : function(result) {
							console.log(result);
							 var token = result.token; // 保存token值
							 var moretime = result.expires; //token的时效
							 sessionStorage.setItem('token', token);
							 sessionStorage.setItem('moretime', moretime);

								!function (win, $) {
									var dialog = win.YDUI.dialog;
									/* 加载中提示框 */									
										dialog.loading.open('登录中...');
										setTimeout(function () {
											dialog.loading.close();/* 移除loading */
											location.href="../Index.html";
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