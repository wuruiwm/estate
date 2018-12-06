<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/6
 * Time: 11:56
 */

namespace app\api\service;

// token基类(wechat/web/app)
use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbiddenException;
use app\lib\exception\TokenException;
use think\Exception;
use think\facade\Cache;
use think\facade\Request;

class Token
{
    /**
     * @method 生成Token [md5超级加密运算]
     * @return string
     */
    public static function generateToken(){
        // 32位随机字符串,方法位于common.php文件
        $random = getRandChar(32);
        // 当前请求时间搓
        $timestamp = $_SERVER['REQUEST_TIME_FLOAT'];
        // 盐 config/setting.php/
        $salt = config('md5.token_sale');
        // md5
        return md5($random . $timestamp . $salt);
    }

    /**
     * @method 封装 根据key=token令牌 获取缓存信息
     * @param $key token令牌 也是缓存中key值
     * @return mixed
     * @throws Exception
     * @throws TokenException
     */
    public static function getCurrentTokenValue($key){
        // 从http heard头获取token值
        $token = \think\Request::instance()->header('token');

        $cacheValue = \think\Cache::get($token);
        if(!$cacheValue){
            throw new TokenException();
        }else{
            if(!is_array($cacheValue)){
                $cacheData = json_decode($cacheValue,true);
            }
            if(array_key_exists($key,$cacheData)){
                return $cacheData[$key];
            }else{
                throw new Exception('无效参数：尝试获取的'.$key.'变量不存在！');
            }
        }
    }

    /**
     * @method 获取当前token 登录用户user_id
     * @return mixed
     * @throws Exception
     * @throws TokenException
     */
    public static function getCurrentTokenUserId(){
        return self::getCurrentTokenValue('user_id');
    }

    /**
     * @method 用于前置方法,判断用户权限是否为 普通用户或管理员  16/32级别
     * @return bool
     * @throws ForbiddenException 权限不够异常
     * @throws TokenException token异常
     */
    public static function usersOrAdminScope(){
        //获取缓存中的scope字段
        $scope = self::getCurrentTokenValue('scope');
        //判断字段是否存在
        if($scope){
            //ScopeEnum
            if($scope >= ScopeEnum::USER){
                return true;//运行访问
            }else{
                throw new ForbiddenException();//禁止访问
            }
        }else{
            //token不存在或已经失效
            throw new TokenException();
        }
    }

    /**
     * @method 用于前置方法,判断用户权限是否为 普通用户 16级别
     * @return bool
     * @throws ForbiddenException 权限不够异常
     * @throws TokenException token异常
     */
    public static function onlyUserScope(){
        //获取缓存中的scope字段
        $scope = self::getCurrentTokenValue('scope');
        //判断字段是否存在
        if($scope){
            if($scope == ScopeEnum::USER){
                return true;//运行访问
            }else{
                throw new ForbiddenException();//禁止访问
            }
        }else{
            //token不存在或已经失效
            throw new TokenException();
        }
    }

    /**
     * @method 用于前置方法,判断用户权限是否为 管理员 32级别
     * @return bool
     * @throws ForbiddenException 权限不够异常
     * @throws TokenException token异常
     */
    public static function onlyAdminScope(){
        //获取缓存中的scope字段
        $scope = self::getCurrentTokenVar('scope');
        //判断字段是否存在
        if($scope){
            if($scope == ScopeEnum::ADMIN){
                return true;//运行访问
            }else{
                throw new ForbiddenException();//禁止访问
            }
        }else{
            //token不存在或已经失效
            throw new TokenException();
        }
    }
}