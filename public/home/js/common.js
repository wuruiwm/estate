var commapi = "http://estate.dingdingmaoer.cn/api/v1/"; //接口公共地址

var dataToken = sessionStorage.getItem('token'); // 获取token
var datamoretime = sessionStorage.getItem('moretime'); // 获取时效时间
//获取地址栏参数 
    //url为空时为调用当前url地址 
    //调用方法为 var params = getPatams();
    function getParams(url) {
        var theRequest = new Object();
        if (!url)
            url = location.href;
        if (url.indexOf("?") !== -1)
        {
            var str = url.substr(url.indexOf("?") + 1) + "&";
            var strs = str.split("&");
            for (var i = 0; i < strs.length - 1; i++)
            {
                var key = strs[i].substring(0, strs[i].indexOf("="));
                var val = strs[i].substring(strs[i].indexOf("=") + 1);
                theRequest[key] = val;
            }
        }
        return theRequest;
    }
    var params = getParams();
    //获取地址栏上的userName
    var userName =  params.userName;