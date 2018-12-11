<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 9:39
 */

namespace app\lib\validate;


class AddBanner extends BaseValidate
{
    protected $rule = [
        'type_id'=>'require|isNotEmpty|number',
        'img_id' =>'require|isNotEmpty|number'
    ];

    protected $message = [
        'img_id' =>'请上传图片',
        'type_id'=>'请选择图片位置'
    ];
}