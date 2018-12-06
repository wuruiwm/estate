<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/7
 * Time: 14:36
 */

namespace app\api\service;


use app\api\model\User;
use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;

class WebUserToken extends Token
{
    // 手机号
    protected $mobile;
    // 密码
    protected $password;
    // 缓存时间(当记住密码时)
    protected $expires;

    function __construct($mobile,$password,$expires)
    {
        $this->mobile = $mobile;
        $this->password = $password;
        $this->expires = $expires;
    }

    /**
     * @method 根据账号+密码 登录生成token令牌
     * @return array token令牌
     * @throws TokenException
     */
    public function getToken(){
        // 校验用户是否存在
        $userInfo = User::getUserByMobile($this->mobile);
        if(!$userInfo){
            throw new TokenException([
                'msg' => '用户不存在',
                'errorCode' => '40301'
            ]);
        }
        // 校验用户名和密码
        $userInfo = User::getUserByMobileAndPwd($this->mobile,$this->password);
        if(!$userInfo){
            throw new TokenException([
                'msg' => '手机号或密码错误',
                'errorCode' => '40301'
            ]);
        }
        // 准备缓存数据
        $cacheValue = $this->prepareCacheValue($userInfo);

        // 保存到缓存
        $token = $this->saveToCache($cacheValue);
        $expires = (int)$this->expires * 1000;
        return [
            'token' => $token,
            'expires'=>$expires,
        ];
    }

    /**
     * @method 准备缓存数据,web用户信息,根据场景可以添加更多需缓存值
     * @param $userInfo 用户信息
     * @return array
     */
    private function prepareCacheValue($userInfo){
        $data = [
            'user_id' => $userInfo->id,
            'nick_name' => $userInfo->nickname,
            'mobile' =>$userInfo->phone,
            'scope' => ScopeEnum::ADMIN
        ];
        return $data;
    }

    /**
     * @method 把需要缓存的数据保存到缓存中
     * @param $cacheValue 缓存数据
     * @return string token令牌
     * @throws TokenException
     */
    private function saveToCache($cacheValue){
        $key = self::generateToken();
        $value = json_encode($cacheValue);
        $token_expire = config('cache.token_expire');
        // 执行缓存 以默认文件缓存
        if($this->expires==''){
            //$result = cache($key,$value,$token_expire);
            $result = cache($key,$value,$this->expires);
        }else{
            $result = cache($key,$value,$this->expires);
        }

        if(!$result){
            throw new TokenException([
                'msg'=>'缓存异常：Web授权登录时,服务器缓存失败~',
                'errorCode'=>30401
            ]);
        }
        // 缓存成功 返回token值给客户端
        return $key;
    }
}