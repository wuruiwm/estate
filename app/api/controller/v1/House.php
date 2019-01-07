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
use app\lib\exception\ErrorMessage;
use app\lib\exception\NullException;
use app\lib\exception\ParameterException;
use app\lib\exception\SuccessMessage;
use app\lib\validate\addUsedUser;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\Page;
use app\api\service\Token;
use app\api\model\User;

class House extends BaseController
{
    /**
     * @apiDefine  house 房源
     */

    /**
     * @api {get} house/list 首页最新房源/新房/二手房列表
     * @apiGroup house
     * @apiVersion 0.1.0
     * @apiDescription  根据当前城市获取房源列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/list
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {string}  province 省
     * @apiParam {string}  city 市
     * @apiParam {string}  [area] 区 给空值定位到市
     * @apiParam {string}  type 房源类型(不传为新房和二手房,值1为新房,值2为二手房)
     */
    public function getList($page='',$limit='',$province='',$city='',$area='',$type=''){
        (new Page())->goCheck();
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
        /*if($area===''){
            throw new ParameterException([
                'msg'=>'area参数不能为空'
            ]);
        }*/
        return HouseSource::getHomeList($page,$limit,$province,$city,$area,$type);
    }

    /**
     * @api {get} house/info 新房/二手房 房源详情信息
     * @apiGroup house
     * @apiVersion 0.1.0
     * @apiDescription  根据房源Id获取详细信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/info
     * @apiParam {int} id 房源id
     * @apiSuccessExample {json} Success-Response:
    {
    "id": 22,
    "title": "标题", --新房/二手房 名称
    "desc": "简介",  --新房/二手房 简介
    "cover_img": {  --新房/二手房 封面图片
    "img_id": 125,
    "img_url": "http://estate.dingdingmaoer.cn\\uploads\\admin\\house_cover_head\\20181212\\56e0f5f9f141af02dd74f5f1c008dc20.jpg"
    },
    "head_img": [   --新房/二手房 详情页头部轮播图
    {
    "img_id": "137",
    "img_url": "http://estate.dingdingmaoer.cn\\uploads\\admin\\admin_thumb\\20181212\\062a11cb14da5f691f7c87518081f487.jpg"
    },
    {
    "img_id": "138",
    "img_url": "http://estate.dingdingmaoer.cn\\uploads\\admin\\admin_thumb\\20181212\\b0ce29e4aaf7e8d48b8a4c51b903b996.jpg"
    }
    ],
    "house_price": "60000.00", --新房/二手房 房价
    "opening_time": "2018-12-11", --新房 开盘时间
    "house_address": "房源地址", --新房/二手房 详细地址
    "brokerage_plan": [], --新房 佣金方案
    "developer": "开发商", --新房 开发商
    "province": {
    "id": "340000",
    "name": "安徽省"
    },
    "city": {
    "id": "340500",
    "name": "马鞍山市"
    },
    "area": {
    "id": "1042",
    "name": "当涂县"
    },
    "greening_rate": 60, --新房 绿化率
    "parking_space": 888, --新房 停车位数量
    "floor_area": 12, --新房/二手房 占地面积
    "property_costs": "60.00", --新房/二手房 物业费用
    "property_company": "物业公司", -- 新房 物业公司
    "decoration_type": [  --新房/二手房 装修类型
    "毛坯",
    "简约"
    ],
    "room_map": [ --新房户型图 /二手房房源图
    {
    "img_id": "134",
    "img_url": "http://estate.dingdingmaoer.cn\\uploads\\admin\\admin_thumb\\20181212\\6e4e2716280bd3af3b9e351f073839bd.jpg"
    },
    {
    "img_id": "136",
    "img_url": "http://estate.dingdingmaoer.cn\\uploads\\admin\\admin_thumb\\20181212\\37ec82aeb82553c10786a96f6ca4a6a6.png"
    }
    ],
    "detail": "<p>内容<br/></p>", --新房/二手房 详情介绍
    "is_head": 1,
    "house_type": "", --二手房 房屋类型
    "init_status": "新房", 房源类型
    "create_time": "2018-12-12 16:30:40",
    "update_time": "2018-12-14 20:11:54",
    "delete_time": null
    }
     */
    public function getHouseById($id=''){
        (new IDMustBePositiveInt())->goCheck();
        if(!empty(HouseSource::getHouseById($id))){
            return HouseSource::getHouseById($id);
        }
        throw new NullException();
    }

    /**
     * @api {get} house/head 房源头条
     * @apiGroup house
     * @apiVersion 0.1.0
     * @apiDescription  获取房源头条,无须做下拉加载更多
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/head
     * @apiParam {int} limit 限制取几条 默认不参为10条
     */
    public function getHouseHead($limit='10'){
        return HouseSource::getHouseHead($limit);
    }


    /**
     * @api {get} house/add_used 发布房源
     * @apiGroup house
     * @apiVersion 0.1.0
     * @apiDescription  用户发布房源信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/add_used
     * @apiParam {string} title 标题
     * @apiParam {int} house_price 房价
     * @apiParam {int} floor_area 房屋面积
     * @apiParam {int} property_costs 物业费用
     * @apiParam {string} decoration_type 装修类型
     * @apiParam {string} province 省 取province_id 值
     * @apiParam {string} city 市 取 city_id 值
     * @apiParam {string} area 区 取 _id 值
     * @apiParam {string} house_address 房源详细地址
     * @apiParam {string} house_type 房屋类型
     * @apiParam {string} room_map 房源图片 以,分割的字符串 例如：134,136
     * @apiParam {string} detail 房源详情介绍
     * @apiExample {curl} 接口发送示例:
     * {
    "title":"用户测试发布二手房",
    "house_price":"6000",
    "floor_area":"120",
    "property_costs":"1.3",
    "decoration_type":"毛坯",
    "province":340000,
    "city":340100,
    "area":1006,
    "house_type":"三室一厅",
    "house_address":"安徽省合肥市",
    "room_map":"136",
    "detail":"今年刚刚装修的房子，准备用来结婚用的，因房主公司遇到困难，急需用一笔钱，不议价，有意的朋友请联系13013090543"
    }
     */
    public function addUsed(){
        $user_id = Token::getCurrentTokenUserId();
        $is_examine = User::where('id',$user_id)->value('is_examine');
        if($is_examine!==1){
            throw new ErrorMessage([
                'msg'=>'请先申请实名认证'
            ]);
        }
        (new addUsedUser())->goCheck();
        $post = input('post.');
        $imgs = input('post.room_map');
        $imgs = explode(",", $imgs);
        $post['cover_img'] = $imgs[0];
        $post['head_img']=$imgs[0];
        $post['init_status']=2;
        $post['user_id']=$user_id;
        $post['status']=0;
        $model = new HouseSource();
        $result = $model->allowField(true)->save($post);
        if ($result) {
            throw new SuccessMessage();
        }
    }
}
