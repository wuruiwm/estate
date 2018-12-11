<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/7
 * Time: 13:45
 */

namespace app\api\controller\v1;

// web授权登录
use app\api\model\User;
use app\api\service\WebUserToken;
use app\lib\validate\WebTokenCheck;

class WebToken extends BaseController
{
    /**
     * @apiDefine  web 客户端接口
     */

    /**
     * @api {post} user/login 用户登录
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据账号和密码进行登录,获取token值
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/user/login
     * @apiParam {String} mobile 手机号
     * @apiParam {String} password 密码
     * @apiParam {int}  [expires] 默认不填2小时自动过期
     * @apiName 账号密码登录
     */
    public function getWebToken($mobile='',$password='',$expires=''){
        (new WebTokenCheck())->goCheck();
        if($expires==''){
            $ut = new WebUserToken($mobile,$password,$expires='7200');
        }else{
            $ut = new WebUserToken($mobile,$password,$expires='315360000');
        }
        // 登录时间
        User::where('phone',$mobile)
            ->update(['login_time'=>$_SERVER['REQUEST_TIME_FLOAT']]);

        $token = $ut->getToken();
        return $token;
    }


}
