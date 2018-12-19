<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/14
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\Store as storeModel;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddStore;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\Page;

class Store extends Permissions
{
    public function index()
    {
        return $this->fetch();
    }

    public function new_store()
    {
        return $this->fetch();
    }
    public function store_user_list(){
       return $this->fetch();
    }

    public function newStore()
    {
        (new AddStore())->goCheck();
        $post = input('post.');
        $code = input('post.reg_code');
        $model = new storeModel();
        $result = storeModel::where('reg_code', $code)->find();
        if ($result) {
            throw new ErrorMessage([
                'msg' => '该邀请码已经存在,请重新输入'
            ]);
        }
        $result = $model->allowField(true)->save($post);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    public function createCode()
    {
        $code = $this->getRandomNumber(6);
        $result = storeModel::where('reg_code', $code)->find();
        if ($result) {
            $code = $this->getRandomNumber(6);
        }
        return json([
            'code' => $code
        ]);
    }


    public function getRandomNumber($length)
    {
        $str = substr(str_shuffle(time()), 0, $length);
        return $str;
    }

    public function getList($page = '', $limit = '', $key = '')
    {
        (new Page())->goCheck();
        if (isset($key['keyword']) and !empty($key['keyword'])) {
            $where['name'] = ['like', '%' . $key['keyword'] . '%'];
        }
        if (empty($where['name'])) {
            $where = null;
        }
        $result = storeModel::getList($page - 1, $limit, $where);
        return $result;
    }


    public function delById($id = '')
    {
        $result = $this->getInfoById($id);
        $model = new storeModel();
        if ($result) {
            $result = $model::destroy($id);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }

    public function updateById($id)
    {
        (new AddStore())->goCheck();
        $post_code = input('post.reg_code');
        $model = new storeModel();
        $store = storeModel::where('reg_code', $post_code)->find();
        if ($store['id'] != $id) {
            if ($post_code === $store['reg_code']) {
                throw new ErrorMessage([
                    'msg' => '该邀请码已经存在,请重新输入'
                ]);
            }
        }
        $post = input('post.');
        $result = $model->allowField(true)->save($post, ['id' => $id]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    public function getInfoById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $model = new storeModel();
        $result = $model->getInfoById($id);
        return json($result);
    }


    public function dels($ids)
    {
        $model = new storeModel();
        $result = $model::destroy($ids);;
        if ($result > 0) {
            throw new SuccessMessage();
        }
    }
}
