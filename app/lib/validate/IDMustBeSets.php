<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/4
 * Time: 21:33
 */

namespace app\lib\validate;


class IDMustBeSets extends BaseValidate
{
    protected $rule = [
        'ids'=>'require|isSets'
    ];
    protected $message = [
        'ids.require'=>'ids参数不能为空',
        'ids.isSets'=>'参数ids必须是以逗号分隔的多个正整数'
    ];
}