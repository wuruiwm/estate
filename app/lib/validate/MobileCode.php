<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 11:53
 */

namespace app\lib\validate;


class MobileCode extends BaseValidate
{
    public $rule = [
        'mobile|手机号'=>'require|isNotEmpty|isMobile',
        //'password|密码'=>'require|isNotEmpty|StrongPassword'
    ];
    public $message = [
        'mobile'=>'请输入正确的手机号',
        //'password'=>'请输入4到16位密码'
    ];
}