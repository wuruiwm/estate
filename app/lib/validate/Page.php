<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/13
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class Page extends BaseValidate
{
    protected $rule = [
        'page'=>'require|isNotEmpty|number',
        'limit' =>'require|isNotEmpty|number'
    ];

    protected $message = [
        'page' =>'page参数不能为空',
        'limit'=>'limit参数不能为空'
    ];
}
