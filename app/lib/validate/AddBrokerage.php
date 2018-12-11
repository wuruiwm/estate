<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/10
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class AddBrokerage extends BaseValidate
{
    protected $rule = [
        'house_area'=>'require|isNotEmpty|number',
        'price' =>'require|isNotEmpty|number'
    ];

    protected $message = [
        'house_area' =>'请输入房屋面积',
        'house_area.number' =>'房屋面积必须是一个数字',
        'price'=>'请输入佣金奖励',
        'price.number' =>'佣金奖励必须是一个数字',

    ];
}
