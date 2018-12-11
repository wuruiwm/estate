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
    /**
     * @apiDefine  web 客户端
     */

    /**
     * @api {get} user/getBanner 获取首页轮播图
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据广告位置获取相应轮播图
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/banner/select
     * @apiParam {int} id 广告位置 1
     */
    public function getBanner($id){
        (new IDMustBePositiveInt())->goCheck();
        $result = ModelBanner::getBanner($id);
        if(!$result){
            throw new NullException();
        }
        return $result;
    }
}