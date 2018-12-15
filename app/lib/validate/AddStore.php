<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/15
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class AddStore extends BaseValidate
{
    protected $rule = [
        'name'=>'require|isNotEmpty',
        'manager' =>'require|isNotEmpty',
        'address' =>'require|isNotEmpty',
        'reg_code' =>'require|isNotEmpty|number|length:6'
    ];

    protected $message = [
        'name' =>'请输入门店名字',
        'manager' =>'请输入负责人姓名',
        'address'=>'请输入门店详情地址',
        'reg_code' =>'请输入6位数字邀请码',
    ];
}
