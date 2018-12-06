<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 14:36
 */

namespace app\api\controller\v1;


use app\admin\model\Attachment;
use think\Controller;

class BaseController extends Controller
{
    // 根据图片Id查询路径
    public function getImgUrl($value){
        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        return ['val'=>$value,'text'=>$http . $img_url[0]];
    }
}