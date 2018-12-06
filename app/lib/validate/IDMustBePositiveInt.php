<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/9/23
 * Time: 17:08
 */

namespace app\lib\validate;

// 校验参数id是否是一个正整数
class IDMustBePositiveInt extends BaseValidate
{
    // isPositiveInteger 存放于父类验证方法
    protected $rule = [
        'id'=>'require|isPositiveInteger'
    ];
    protected $message = [
        'id.require'=>'id参数不能为空',
        'id.isPositiveInteger'=>'ID必须是一个正整数'
    ];
}