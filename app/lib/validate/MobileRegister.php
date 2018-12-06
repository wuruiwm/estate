<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 9:26
 */

namespace app\lib\validate;


class MobileRegister extends BaseValidate
{
    public $rule = [
        'mobile|手机号'=>'require|isNotEmpty|isMobile',
        'password|密码'=>'require|isNotEmpty|StrongPassword',
        'code'=>'require|isNotEmpty'
    ];
    public $message = [
        'mobile'=>'请输入正确的手机号',
        'password'=>'请输入6到32位密码',
        'code'=>'请输入验证码'
    ];
}