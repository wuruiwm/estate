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


class AddNewHouse extends BaseValidate
{
    protected $rule = [
        'title'=>'require|isNotEmpty',
        'desc' =>'require|isNotEmpty',
        'cover_img'=>'require|isNotEmpty|number',
        'head_img'=>'require|isNotEmpty',
        'opening_time'=>'require|isNotEmpty',
        'house_price'=>'require|isNotEmpty|number',
        'developer'=>'require|isNotEmpty',
        'parking_space'=>'require|isNotEmpty|number',
        'greening_rate'=>'require|isNotEmpty|number',
        'floor_area'=>'require|isNotEmpty|number',
        'property_company'=>'require|isNotEmpty',
        'property_costs'=>'require|isNotEmpty|number',
        'province'=>'require|isNotEmpty',
        'city'=>'require|isNotEmpty',
        'area'=>'require|isNotEmpty',
        'house_address'=>'require|isNotEmpty',
        'brokerage_plan'=>'require|isNotEmpty',
        'room_map'=>'require|isNotEmpty',
        'decoration_type'=>'require|isNotEmpty',
        'detail'=>'require|isNotEmpty',
    ];

    protected $message = [
        'title' =>'请输入标题',
        'desc'=>'请输入简介',
        'cover_img'=>'请上传封面图',
        'head_img'=>'请上传头部轮播图',
        'house_price'=>'请输入房价',
        'opening_time'=>'请输入开盘时间',
        'house_address'=>'请输入房源地址',
        'brokerage_plan'=>'请选择佣金方案',
        'developer'=>'请输入开发商',
        'area'=>'请选择所属区域',
        'greening_rate'=>'请输入绿化值',
        'parking_space'=>'请输入车位数量',
        'floor_area'=>'请输入占地面积',
        'property_costs'=>'请输入物业费',
        'property_company'=>'请输入物业公司',
        'decoration_type'=>'请填写装修类型',
        'room_map'=>'请上传户型图',
        'detail'=>'请输入项目详情',
        'city'=>'请选择所属城市',
        'province'=>'请选择所属省份',
    ];
}
