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


class HouseSource extends BaseModel
{
    public function getHeadImgAttr($value){
        $img_url = Attachment::where('id','in',$value)->column('filepath');
        $http = http_type();
        $data= [];
        $head_img =  explode(',',$value);
        //return $room_map;
        foreach($img_url as $k=>$v){
            $data[$k]['img_id']=$head_img[$k];
            $data[$k]['img_url']=$http.$img_url[$k];

        }
        return $data;
    }

    public function getRoomMapAttr($value){
        $img_url = Attachment::where('id','in',$value)->column('filepath');
        $http = http_type();
        $data= [];
        $room_map =  explode(',',$value);
        //return $room_map;
        foreach($img_url as $k=>$v){
            $data[$k]['img_id']=$room_map[$k];
            $data[$k]['img_url']=$http.$img_url[$k];

        }
        return $data;
    }

    public function getBrokeragePlanAttr($value){
        $brokerage_plan = Brokerage::where('id','in',$value)->select();
        return $brokerage_plan;
    }

    public function getInitStatusAttr($value){
        return ['新房','二手房'][$value];
    }

    public static function getList($page, $limit,$action){
        if($action){
            $field='id,title,cover_img,init_status,house_price,house_address,decoration_type,brokerage_plan';
        }else{
            $field='';
        }

        $number = $page * $limit;

        $house = self::limit($number, $limit)
            ->field($field)
            ->order('create_time desc')
            ->select();
        if(!$house){
            return self::DataFormat(0);
        }
        return self::DataFormat($house,0,'ok',self::count());
    }
}
