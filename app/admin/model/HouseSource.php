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
    public function getCoverHeadImgAttr($value){
        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        if($img_url){
            return ['imgId'=>$value,'imgUrl'=>$http . $img_url[0]];
        }
    }

    public function getRoomMapAttr($value){
        $http = http_type();
        $room_map =  explode(',',$value);
        $data= [];
        foreach($room_map as $key=>$value){
            $data[$key]['imgId']=$value;
            $data[$key]['imgUrl']=$http.Attachment::where('id',$value)->column('filepath')[0];
        }
        return $data;
    }

    public static function getList($page, $limit){
        $number = $page * $limit;
        $house = self::limit($number, $limit)
            ->order('create_time desc')
            ->select();
        if(!$house){
            return self::DataFormat(0);
        }
//        foreach($house as $key=>$value){
//            $house[$key]['img_url']=$house[$key]['img_id']['text'];
//            $house[$key]['img']=$house[$key]['img_id']['val'];
//            unset($house[$key]['img_id']);
//        }
        return self::DataFormat($house,0,'ok',self::count());
    }
}
