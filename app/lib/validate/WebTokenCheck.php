<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/7
 * Time: 13:47
 */

namespace app\lib\validate;


class WebTokenCheck extends BaseValidate
{
    protected $rule = [
        'mobile'=>'require|isNotEmpty|isMobile',
        'password'=>'require|isNotEmpty',
    ];

    protected $message =[
        'mobile' => '请输入正确的手机号',
        'password' => '密码不能为空'
    ];
}