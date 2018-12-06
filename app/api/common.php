<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 11:35
 */

//admin模块公共函数

/**
 * 管理员密码加密方式
 * @param $password  密码
 * $password_salt 密码额外加密字符
 * @return string
 */
function password($password)
{
    return md5(md5($password) . md5(config('md5.password_salt')));
}

// 32位随机字符串
function getRandChar($length)
{
    $str = null;
    $strPol = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    $max = strlen($strPol) - 1;
    for($i = 0; $i < $length; $i++){
        $str .= $strPol[rand(0, $max)];
    }
    return $str;
}