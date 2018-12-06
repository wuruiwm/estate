<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 14:39
 */

namespace app\api\model;


use app\admin\model\Attachment;

class Banner extends BaseModel
{
    protected $hidden = ['id','type_id','order_id','delete_time','create_time','update_time'];

    public function getTypeIdAttr($value){
        $data=[
            '1'=>'借款产品页面',
            '2'=>'信用卡页面'
        ];
        return $data[$value];
    }

    // 图片url获取器
    public function getImgIdAttr($value){
        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        if($img_url){
            return $http . $img_url[0];
        }
    }

    //根据广告位置 获取该位置下所有广告信息，并按order_id 排序
    public static function getBanner($type_id){
        return self::where('type_id',$type_id)
            ->order('order_id asc')
            ->select();
    }
}