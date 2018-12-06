<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/30 0030
 * Time: 10:42
 */

namespace app\lib\validate;


class VerifyPhone extends BaseValidate
{
    public $rule = [
        'code'=>'require|isNotEmpty'
    ];
    public $message = [
        'code'=>'请输入验证码'
    ];
}