<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/19
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\api\controller\v1;


use app\common\model\Province;
use app\lib\validate\CidMustBePositiveInt;
use app\lib\validate\PidMustBePositiveInt;

class City extends BaseController
{
    /**
     * @apiDefine  city 城市
     */

    /**
     * @api {get} province/list 获取省
     * @apiGroup city
     * @apiVersion 0.1.0
     * @apiDescription  根据当前城市获取房源列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/province/list
     */
    public function getProvinceList(){
        return Province::getProvinceList();
    }

    /**
     * @api {get} city/list 获取市
     * @apiGroup city
     * @apiVersion 0.1.0
     * @apiDescription  根据当前省份province_id获取市级列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/city/list
     * @apiParam {int} pid 省份province_id
     */
    public static function getCityByPid($pid=''){
        (new PidMustBePositiveInt())->goCheck();
        return Province::getCityByPid($pid);
    }

    /**
     * @api {get} area/list 获取区县
     * @apiGroup city
     * @apiVersion 0.1.0
     * @apiDescription  根据当前省份city_id获取市级列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/area/list
     * @apiParam {int} cid 市city_id
     */
    public static function getAreaByCid($cid=''){
        (new CidMustBePositiveInt())->goCheck();
        return Province::getAreaByCid($cid);
    }
}
