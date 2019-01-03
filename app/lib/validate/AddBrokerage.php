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
        'house_type'=>'require|isNotEmpty',
        'price' =>'require|number',
        'store_percentage'=>'require|isNotEmpty|between:0,100',
        'public_percentage'=>'require|isNotEmpty|between:0,100'
    ];

    protected $message = [
        'house_area' =>'请输入房屋面积',
        'house_type'=>'请输入房屋类型',
        'price'=>'请正确输入佣金奖励',
        'store_percentage'=>'请正确输入佣金比例',
        'public_percentage'=>'请正确输入佣金比例'
    ];
}
