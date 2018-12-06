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
     * @apiDefine  web 网页
     */

    /**
     * @apiGroup web
     * @api {post} token/login 登录
     * @apiDescription  根据账号和密码进行登录,获取token值
     * @apiSampleRequest http://myapi.io/api/v1/token/login
     * @apiParam {String} username (必填)-登录账号
     * @apiParam {String} password (必填)-登录密码
     * @apiParam {int}  expires(可选，默认2小时)-记住密码 缓存时间
     * @apiName 账号密码登录
     * @apiVersion 1.0.0
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