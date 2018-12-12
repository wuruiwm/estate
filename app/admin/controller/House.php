<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/8
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

// 房源管理
use app\admin\model\HouseSource;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddNewHouse;

class House extends Permissions
{
    public function index(){
        return $this->fetch();
    }

    public function used(){
        return $this->fetch();
    }

    public function new_house(){
        return $this->fetch();
    }

    /**
     * 发布新房源
     */
    public function addNewHouse(){
        (new AddNewHouse())->goCheck();
        $post = input('post.');
        $post['init_status']=1;
        // 佣金方案
        $brokerage_plan_str = '';
        foreach($post['brokerage_plan'] as $key=>$value){
            $brokerage_plan_str .=$value.',';
        }
        $post['brokerage_plan'] = substr($brokerage_plan_str,0,strlen($brokerage_plan_str)-1);
        $post['opening_time'] = strtotime($post['opening_time']);
        $model = new HouseSource();
        $result = $model->allowField(true)->save($post);
        if($result){
            throw new SuccessMessage();
        }
    }

    /**
     * 获取房源
     */
    public function getHouseList($page = '', $limit = ''){
        return HouseSource::getList($page-1, $limit);
    }

}
