// 封装统一get post 请求
window.base={
    // 后台接口统一设置
    g_restUrl:'http://estate.dingdingmaoer.cn/admin_api/',

    getData:function(params){
        if(!params.type){
            params.type='get';
        }
        var that=this;
        $.ajax({
            type:params.type,
            url:this.g_restUrl+params.url,
            data:params.data,
            beforeSend: function (XMLHttpRequest) {
                if (params.tokenFlag) {
                    XMLHttpRequest.setRequestHeader('token', that.getLocalStorage('token'));
                }
            },
            success:function(res){
                params.sCallback && params.sCallback(res);
            },
            error:function(res){

                params.eCallback && params.eCallback(res);
            }
        });
    },

    // 设置本地存储
    setLocalStorage:function(key,val){
        // 令牌过期时间 2小时
        var exp=new Date().getTime()+1000*60*60*2;
        var obj={
            val:val,
            exp:exp
        };
        localStorage.setItem(key,JSON.stringify(obj));
    },

    // 通过key读取本地存储的值
    getLocalStorage:function(key){
        var info= localStorage.getItem(key);
        if(info) {
            info = JSON.parse(info);
            if (info.exp > new Date().getTime()) {
                return info.val;
            }
            else{
                this.deleteLocalStorage('token');
            }
        }
        return '';
    },

    // 移除指定的值
    deleteLocalStorage:function(key){
        return localStorage.removeItem(key);
    },

    // 移除所有
    deleteAllLocalStorage:function(){
        return localStorage.clear();
    },

    // 获取 url中的参数
    getQueryString: function(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    },
}
