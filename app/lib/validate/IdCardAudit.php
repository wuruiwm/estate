<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/25
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\lib\validate;


class IdCardAudit extends BaseValidate
{
    protected $rule = [
        'name'=>'require|length:2,4|chs',
        'id_card' => 'require|isIdCard',
    ];
    protected $message = [
        'name' => '请输入您的真实姓名',
        'id_card' => '请正确输入您的身份证号'
    ];
}
