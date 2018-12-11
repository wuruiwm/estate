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

namespace app\admin\controller;


use app\common\model\Province;
use app\lib\validate\CidMustBePositiveInt;
use app\lib\validate\PidMustBePositiveInt;

class City extends Permissions
{
    public function getProvinceList(){
        return Province::getProvinceList();
    }

    public static function getCityByPid($pid=''){
        (new PidMustBePositiveInt())->goCheck();
        return Province::getCityByPid($pid);
    }

    public static function getAreaByCid($cid=''){
        (new CidMustBePositiveInt())->goCheck();
        return Province::getAreaByCid($cid);
    }
}
