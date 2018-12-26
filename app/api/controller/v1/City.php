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


use app\common\model\Area;
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
    public function getProvinceList()
    {
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
    public static function getCityByPid($pid = '')
    {
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
    public static function getAreaByCid($cid = '')
    {
        (new CidMustBePositiveInt())->goCheck();
        return Province::getAreaByCid($cid);
    }

    /**
     * @api {get} city/each_id 获取省市区id
     * @apiGroup city
     * @apiVersion 0.1.0
     * @apiDescription  根据当前定位获取的省市区中文名 获取对应id, 参数说明：如果定位为直辖市，则参数 province_name,city_name 直接为直辖市名
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/city/each_id
     * @apiParam {string}  province_name 省份名 如安徽省 / 重庆市
     * @apiParam {string}  city_name 市级名 如合肥市 / 重庆市
     * @apiParam {string}  area_name 区县名 如蜀山区 / 江北区
     */
    public function getCityByName($province_name = '', $city_name = '', $area_name = '')
    {
        $city['province_id'] = Province::where('name', $province_name)->value('province_id');
        if ($province_name == '北京市' || $province_name == '天津市' || $province_name == '上海市' || $province_name == '重庆市' || $city_name == '北京市' || $city_name == '上海市' || $city_name == '天津市' || $city_name == '重庆市') {
            $city['city_id'] = '110100';
        } else {
            $city['city_id'] = \app\common\model\City::where('name', $city_name)->value('city_id');
        }
        $city['area_id'] = Area::where('name', $area_name)->value('_id');
        return $city;
    }
}
