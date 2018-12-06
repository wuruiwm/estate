<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 8:52
 */

namespace app\admin\model;
use traits\model\SoftDelete;

class Banner extends BaseModel
{
    use SoftDelete;

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
            return ['val'=>$value,'text'=>$http . $img_url[0]];
        }
    }

    public static function getBannerAll($page, $limit){
        $number = $page * $limit;
        $banner = self::limit($number, $limit)
            ->order('create_time desc')
            ->select();
        if(!$banner){
            return self::DataFormat(0);
        }
        foreach($banner as $key=>$value){
            $banner[$key]['img_url']=$banner[$key]['img_id']['text'];
            $banner[$key]['img']=$banner[$key]['img_id']['val'];
            unset($banner[$key]['img_id']);
        }
        return self::DataFormat($banner,0,'ok',self::count());
    }

    public static function getInfoById($id=''){
        $result =  self::find($id);
        return $result;
    }

}