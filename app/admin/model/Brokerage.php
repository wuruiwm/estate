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

namespace app\admin\model;


class Brokerage extends BaseModel
{
    protected $hidden = ['create_time','update_time','delete_time','id'];
    public static function getList($page, $limit){
        $number = $page * $limit;
        $brokerage = self::limit($number, $limit)
            ->order('create_time desc')
            ->select();
        if(!$brokerage){
            return self::DataFormat(0);
        }
        return self::DataFormat($brokerage,0,'ok',self::count());
    }

    public static function getInfoById($id=''){
        $result =  self::find($id);
        return $result;
    }
}
