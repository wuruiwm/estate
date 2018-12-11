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


class CidMustBePositiveInt extends BaseValidate
{
    protected $rule = [
        'cid'=>'require|isPositiveInteger'
    ];
    protected $message = [
        'cid.require'=>'cid参数不能为空',
        'cid.isPositiveInteger'=>'参数必须是一个正整数'
    ];
}
