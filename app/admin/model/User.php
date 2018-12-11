<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/29 0029
 * Time: 9:27
 */

namespace app\admin\model;


class User extends BaseModel
{
    // 图片url获取器
    public function getHeadImgAttr($value){
        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        if($img_url){
            return ['val'=>$value,'text'=>$http.$img_url[0]];
        }
    }
    // 上次登录时间格式化
    public function getLoginTimeAttr($value)
    {
        return date("Y-m-d H:i",$value) ;
    }

}