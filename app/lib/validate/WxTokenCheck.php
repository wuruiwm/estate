<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/6
 * Time: 11:43
 */

namespace app\lib\validate;


class WxTokenCheck extends BaseValidate
{
    protected $rule = [
        'code' =>'require|isNotEmpty'
    ];

    protected $message = [
        'code' => '请传入微信小程序code码'
    ];
}