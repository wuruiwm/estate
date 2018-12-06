<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 11:30
 */

namespace app\api\model;


class User extends BaseModel
{




    // 根据登录手机号+密码 查询该用户--web
    public static function getUserByMobileAndPwd($mobile,$password){
        $result = self::where([
            'phone' => $mobile,
            'password' => md5(md5($password) . md5(config('md5.password_salt')))
        ])->find();
        return $result;
    }

    // 根据手机号 查询该用户是否存在 --web
    public static function getUserByMobile($mobile){
        $result = self::where([
            'phone' => $mobile
        ])->find();
        return $result;
    }
}