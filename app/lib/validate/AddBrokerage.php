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
        'house_area'=>'require|isNotEmpty',
        'price' =>'require|isNotEmpty|number',
        'public_percentage'=>'require|isNotEmpty|between:0,100'
    ];

    protected $message = [
        'house_area' =>'请输入房屋面积',
        'price'=>'请输入佣金奖励',
        'price.number' =>'佣金奖励必须是一个数字',
        'public_percentage'=>'请输入1-100之间的数字'
    ];
}
