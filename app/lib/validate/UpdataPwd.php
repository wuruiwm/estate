<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2019/1/8
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class UpdataPwd extends BaseValidate
{
    public $rule = [
        'mobile|手机号'=>'require|isNotEmpty|isMobile',
        'password|密码'=>'require|isNotEmpty|StrongPassword',
        'code'=>'require|isNotEmpty',
    ];
    public $message = [
        'mobile'=>'请输入正确的手机号',
        'password'=>'请输入6到32位密码',
        'code'=>'请输入验证码',
    ];

}
