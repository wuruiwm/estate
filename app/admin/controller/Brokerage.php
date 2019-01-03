<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/10
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

// 佣金方案管理
use app\lib\exception\ErrorMessage;
use app\lib\exception\NullException;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddBrokerage;
use app\admin\model\Brokerage as ModelBrokerage;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\PriceMustBePositiveInt;

class Brokerage extends Permissions
{
    public function brokerage_plan(){
        return $this->fetch();
    }

    public function new_brokerage(){
        return $this->fetch();
    }

    public function getBrokerageList($page = '', $limit = ''){
        return ModelBrokerage::getList($page-1, $limit);
    }

    public function addNewBrokerage(){
        (new AddBrokerage())->goCheck();
        $post = input('post.');
        $model = new ModelBrokerage();
        $result = $model->allowField(true)->save($post);
        if($result){
            throw new SuccessMessage();
        }
    }

    // 编辑
    public function updateById($id=''){
        (new IDMustBePositiveInt())->goCheck();
        $model = new ModelBrokerage();
        $post = input('post.');
        if(isset($post['price'])){
            (new PriceMustBePositiveInt())->goCheck();
        }
        if(isset($post['store_percentage'])){
            if($post['store_percentage']<1 || $post['store_percentage']>100){
                throw new ErrorMessage([
                    'msg'=>'请输入1-100之间的数字'
                ]);
            }
        }
        if(isset($post['public_percentage'])){
            if($post['public_percentage']<1 || $post['public_percentage']>100){
                throw new ErrorMessage([
                    'msg'=>'请输入1-100之间的数字'
                ]);
            }
        }
        $result = $model->allowField(true)->save($post,['id' => $id]);
        if($result){
            throw new SuccessMessage();
        }
    }

    //删除一个
    public function delById($id=''){
        (new IDMustBePositiveInt())->goCheck();
        $model = new ModelBrokerage();
        $result = $model->getInfoById($id);
        if($result){
            $result = $model::destroy($id);
            if($result){
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }

    //获取所有佣金方案
    public function getList(){
        $result = ModelBrokerage::all();
        return json($result);
    }
}
