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

namespace app\common\model;


class Province extends BaseModel
{
    // 获取所有省份
    public static function getProvinceList()
    {
        return json(self::all());
    }

    // 根据省份id获取下面所有市级
    public static function getCityByPid($pid=''){
        return json(City::where('province_id',$pid)->select());
    }

    // 根据市级id获取下面所有区县
    public static function getAreaByCid($cid=''){
        return json(Area::where('city_id',$cid)->select());
    }
}
