<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 14:39
 */

namespace app\api\model;


use think\Model;
use app\admin\model\Attachment;
use traits\model\SoftDelete;

class BaseModel extends Model
{
    use SoftDelete;

// 图片url获取器
    public function getThumbAttr($value){

        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        return $http.$img_url[0];
    }

    public function getIconAttr($value){

        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        return $http.$img_url[0];
    }


}