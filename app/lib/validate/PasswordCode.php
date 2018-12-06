<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/26 0026
 * Time: 9:41
 */

namespace app\lib\validate;


class PasswordCode extends BaseValidate
{
    public $rule = [
        'mobile|手机号'=>'require|isNotEmpty|isMobile',
    ];
    public $message = [
        'mobile'=>'请输入正确的手机号',
    ];
}