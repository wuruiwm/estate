<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/12
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class PriceMustBePositiveInt extends BaseValidate
{
    protected $rule = [
        'price'=>'require|isPositiveInteger'
    ];
    protected $message = [
        'price'=>'请正确输入佣金奖励'
    ];
}
