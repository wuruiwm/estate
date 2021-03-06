<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/8
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\model;


use app\common\model\Area;
use app\common\model\City;
use app\common\model\Province;

class HouseSource extends BaseModel
{
    public function getHeadImgAttr($value)
    {
        $img_url = Attachment::where('id', 'in', $value)->column('filepath');
        $http = http_type();
        $data = [];
        $head_img = explode(',', $value);
        //return $room_map;
        foreach ($img_url as $k => $v) {
            $data[$k]['img_id'] = $head_img[$k];
            $data[$k]['img_url'] = $http . $img_url[$k];

        }

        return $data;
    }

    public function getRoomMapAttr($value)
    {
        $img_url = Attachment::where('id', 'in', $value)->column('filepath');
        $http = http_type();
        $data = [];
        $room_map = explode(',', $value);
        //return $room_map;
        foreach ($img_url as $k => $v) {
            $data[$k]['img_id'] = $room_map[$k];
            $data[$k]['img_url'] = $http . $img_url[$k];

        }
        return $data;
    }

    public function getBrokeragePlanAttr($value)
    {
        $brokerage_plan = Brokerage::where('id', 'in', $value)->select();
        //return $brokerage_plan;
        // 拼接数据
        if (count($brokerage_plan) > 0) {
            return [
                'number' => count($brokerage_plan),
                'price' => floatval($brokerage_plan[0]['price']),
                'data' => $brokerage_plan
            ];
        }
        return $brokerage_plan;
    }

    public function getCoverImgAttr($value)
    {
        $img_url = Attachment::where('id', 'in', $value)->value('filepath');
        $http = http_type();
        return [
            'img_id' => $value,
            'img_url' => $http . $img_url
        ];
    }

    public function getInitStatusAttr($value)
    {
        return ['占位', '新房', '二手房'][$value];
    }

    public function getDecorationTypeAttr($value)
    {
        return explode(',', $value);
    }

    public function getOpeningTimeAttr($value)
    {
        if ($value == 0) {
            return '无';
        } else {
            return date("Y-m-d", $value);
        }
    }

    public function getPropertyCompanyAttr($value)
    {
        if ($value == '') {
            return '无';
        } else {
            return $value;
        }
    }

    public function getDeveloperAttr($value)
    {
        if ($value == '') {
            return '无';
        } else {
            return $value;
        }
    }

    public function getProvinceAttr($value)
    {
        //return Province::where('province_id', $value)->value('name');
        return [
            'id' => $value,
            'name' => Province::where('province_id', $value)->value('name')
        ];
    }

    public function getCityAttr($value)
    {
        //return City::where('city_id', $value)->value('name');
        return [
            'id' => $value,
            'name' => City::where('city_id', $value)->value('name')
        ];
    }

    public function getAreaAttr($value)
    {
        //return Area::where('_id', $value)->value('name');
        return [
            'id' => $value,
            'name' => Area::where('_id', $value)->value('name')
        ];
    }

    // 后台
    public static function getList($page, $limit, $where)
    {
        $number = $page * $limit;
        $house = self::limit($number, $limit)
            ->order('create_time desc')
            ->where($where)
            ->select();
        if (!$house) {
            return self::DataFormat(0);
        }
        return self::DataFormat($house, 0, 'ok', self::count());
    }

    // 客户端
    public static function getHomeList($page, $limit, $province, $city, $area,$type)
    {
        if ($type == '') {
            $type = '1,2';
        }

        $field = 'id,title,cover_img,init_status,house_price,house_address,decoration_type,brokerage_plan,province,city,area';
        if ($province === '北京' || $province === '天津' || $province === '上海' || $province === '重庆') {
            $area_name = mb_substr($city, 0, 2); // 彭水
            $area_info = Area::where('name', 'like', "%{$area_name}%")->find();
            $city_Info = City::where('city_id', $area_info['city_id'])->find();
            if($area!==''){
                $where['area'] = $area_info['_id'];
            }else{
                $where = null;
            }
            $house = self::where('city', $city_Info['city_id'])
                ->where('province', $city_Info['province_id'])
                ->where($where)
                ->where('status',1)
                ->where('init_status', 'in', $type)
                ->field($field)
                ->order('create_time desc')
                ->page($page, $limit)
                ->select();
            if (!$house) {
                return self::DataFormat(0);
            }

        } else {
            $city = City::where('name', 'like', $city)->find();
            $city_id = $city['city_id'];
            $province_id = $city['province_id'];
            $areaInfo = Area::where('name',$area)->find();
            if($area!==''){
                $where['area'] = $areaInfo['_id'];
            }else{
                $where = null;
            }
            $house = self::where('city', $city_id)
                ->where('province', $province_id)
                ->where('init_status', 'in', $type)
                ->where($where)
                ->where('status',1)
                ->field($field)
                ->order('create_time desc')
                ->page($page, $limit)
                ->select();
            if (!$house) {
                return self::DataFormat(0);
            }
        }
        $data['total']=$house->count();
        $data['data']=$house;
        return $data;
    }

    // 客户端
    public static function getHouseById($id)
    {
        return HouseSource::get($id);
    }

    // 客户端头条
    public static function getHouseHead($limit)
    {
        $field = 'id,title,desc,cover_img,house_address,init_status';
        $head = self::where('is_head', 1)
            ->where('status',1)
            ->field($field)
            ->limit($limit)
            ->order('update_time desc')
            ->select();
        if (!empty($head)) {
            return $head;
        }

    }
}
