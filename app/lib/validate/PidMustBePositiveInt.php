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


class PidMustBePositiveInt extends BaseValidate
{
    protected $rule = [
        'pid'=>'require|isPositiveInteger'
    ];
    protected $message = [
        'pid.require'=>'pid参数不能为空',
        'pid.isPositiveInteger'=>'参数必须是一个正整数'
    ];
}
