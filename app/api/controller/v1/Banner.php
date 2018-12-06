<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23 0023
 * Time: 14:36
 */

namespace app\api\controller\v1;
use app\api\model\Banner as ModelBanner;
use app\lib\exception\NullException;
use app\lib\validate\IDMustBePositiveInt;

class Banner extends BaseController
{
    // 获取首页轮播图
    public function getBanner($id){
        (new IDMustBePositiveInt())->goCheck();
        $result = ModelBanner::getBanner($id);
        if(!$result){
            throw new NullException();
        }
        return $result;
    }
}