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
        'nickname'=>'require|isNotEmpty',
        'mobile|手机号'=>'require|isNotEmpty|isMobile',
        'password|密码'=>'require|isNotEmpty|StrongPassword',
        'code'=>'require|isNotEmpty',
        'type'=>'require|isNotEmpty'
    ];
    public $message = [
        'nickname'=>'请输入用户昵称',
        'mobile'=>'请输入正确的手机号',
        'password'=>'请输入6到32位密码',
        'code'=>'请输入验证码',
        'type'=>'请选择注册类型'
    ];
}
