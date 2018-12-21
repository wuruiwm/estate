<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/16
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\User as userModel;
use app\lib\exception\NullException;
use app\lib\exception\SuccessMessage;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\Page;

class User extends Permissions
{
    public function index()
    {
        return $this->fetch();
    }

    public function realname(){
        return $this->fetch();
    }

    public function getList($page = '', $limit = '', $key = '')
    {
        (new Page())->goCheck();
        if (isset($key['keyword']) and !empty($key['keyword'])) {
            $where['card_name'] = ['like', '%' . $key['keyword'] . '%'];
        }
        if (empty($where['card_name'])) {
            $where = null;
        }

        $result = userModel::getList($page - 1, $limit, $where);
        return $result;
    }


    public function delById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $result = userModel::get($id);
        $model = new userModel();
        if ($result) {
            $result = $model::destroy($id);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }

    public function removeStoreUserById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $result = userModel::get($id);
        $model = new userModel();
        if ($result) {
            $result = $model->where('id', $id)
                ->update(['store_id' => 0, 'level' => 2]);
            if ($result > 0) {
                throw new SuccessMessage();
            }
        }
    }


    public function dels($ids)
    {
        $model = new userModel();
        $result = $model::destroy($ids);;
        if ($result > 0) {
            throw new SuccessMessage();
        }
    }

    public function removeStoreUserByIds($ids)
    {
        $model = new userModel();
        $ids = explode(",", $ids);
        foreach($ids as $k=>$v){
            $model->where('id', $ids[$k])
                ->update(['store_id' => 0, 'level' => 2]);
        }
        throw new SuccessMessage();
    }

    public function getStoreUserList($page = '', $limit = '', $key = '', $store_id = '')
    {
        (new Page())->goCheck();
        if (isset($key['keyword']) and !empty($key['keyword'])) {
            $where['card_name'] = ['like', '%' . $key['keyword'] . '%'];
        }
        if (empty($where['card_name'])) {
            $where = null;
        }

        $result = userModel::getStoreUserList($page - 1, $limit, $where, $store_id);
        return $result;
    }

    public function getRealname($page = '', $limit = '', $key = ''){
        (new Page())->goCheck();
        if (isset($key['keyword']) and !empty($key['keyword'])) {
            $where['card_name'] = ['like', '%' . $key['keyword'] . '%'];
        }
        if (empty($where['card_name'])) {
            $where = null;
        }
        $result = userModel::getRealnameList($page - 1, $limit, $where);
        return $result;
    }

    public function updateRealname($id='',$is_examine=''){
        (new IDMustBePositiveInt())->goCheck();
        $result = userModel::update(['id'=>$id,'is_examine'=>$is_examine]);
        if($result){
            throw new SuccessMessage();
        }
    }

}
