<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/30 0030
 * Time: 13:37
 */

namespace app\lib\validate;


class ChangePassword extends BaseValidate
{
    public $rule = [
        'password|密码'=>'require|isNotEmpty|StrongPassword',
    ];
    public $message = [
        'password'=>'请输入6到32位密码',
    ];
}