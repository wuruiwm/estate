<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/13
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\api\controller\v1;


use app\admin\model\HouseSource;
use app\lib\exception\NullException;
use app\lib\exception\ParameterException;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\Page;

class House extends BaseController
{
    /**
     * @api {get} house/list 获取首页房源列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据当前城市获取房源列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/list
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {string}  province 省
     * @apiParam {string}  city 市
     * @apiName 获取首页房源列表
     */
    public function getList($page='',$pageSize='',$province='',$city=''){
        //(new Page())->goCheck();
        if($province===''){
            throw new ParameterException([
                'msg'=>'province参数不能为空'
            ]);
        }
        if($city===''){
            throw new ParameterException([
                'msg'=>'city参数不能为空'
            ]);
        }
        return HouseSource::getHomeList($page,$pageSize,$province,$city);
    }

    /**
     * @api {get} house/info 获取房源详情
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据房源Id获取详细信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/info
     * @apiParam {int} id 房源id
     * @apiName 获取房源详情
     */
    public function getHouseById($id=''){
        (new IDMustBePositiveInt())->goCheck();
        if(!empty(HouseSource::getHouseById($id))){
            return HouseSource::getHouseById($id);
        }
        throw new NullException();

    }
}
