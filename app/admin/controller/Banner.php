<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/7
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;


use app\admin\model\Banner as BannerModel;
use app\admin\model\HouseSource;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddBanner;
use app\lib\validate\IDMustBePositiveInt;

class Banner extends Permissions
{
    public function index()
    {
        return $this->fetch();
    }

    public function insert()
    {
        return $this->fetch();
    }

    public function getBannerAll($page = '', $limit = '')
    {
        $loanData = BannerModel::getBannerAll($page - 1, $limit);
        return $loanData;
    }


    // 添加
    public function add()
    {
        $result = BannerModel::all();
        if (count($result) >= 6) {
            throw new ErrorMessage([
                'msg' => '首页轮播图已达到上限'
            ]);
        }

        $model = new BannerModel();
        (new AddBanner())->goCheck();
        $post = input('post.');

        $link_url = input('post.link_url');
        if (is_numeric($link_url)) {
            $result = HouseSource::where('id', $link_url)->find();
            if ($result) {
                if($result['init_status']=='新房'){
                    $post['link_url'] = http_type() . '/home/pages/contentdetails.html?id='. $link_url;
                }else{
                    $post['link_url'] = http_type() . '/home/pages/olddetails.html?id='. $link_url;
                }
            } else {
                throw new ErrorMessage([
                    'msg' => '该房源ID不存在,请重新输入'
                ]);
            }
        }

        //二手房 http://127.0.0.1:8848/App/HouseApp/pages/olddetails.html?id=71

        //新房   http://127.0.0.1:8848/App/HouseApp/pages/contentdetails.html?id=54
        $result = $model->allowField(true)->save($post);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 编辑
    public function updateById($id)
    {
        $model = new BannerModel();
        $post = input('post.');

        $link_url = input('post.link_url');
        if (isset($link_url)) {
            if (is_numeric($link_url)) {
                $result = HouseSource::where('id', $link_url)->find();
                if ($result) {
                    if($result['init_status']=='新房'){
                        $post['link_url'] = http_type() . '/home/pages/contentdetails.html?id='. $link_url;
                    }else{
                        $post['link_url'] = http_type() . '/home/pages/olddetails.html?id='. $link_url;
                    }

                } else {
                    throw new ErrorMessage([
                        'msg' => '该房源ID不存在,请重新输入'
                    ]);
                }
            }
        }

        $result = $model->allowField(true)->save($post, ['id' => $id]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 根据id获取该信息
    public function getItemById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $result = BannerModel::getInfoById($id);
        if ($result) {
            $result['img'] = $result['img_id']['val'];
            $result['img_url'] = $result['img_id']['text'];
            unset($result['img_id']);
            return json([
                'errorCode' => 20000,
                'msg' => 'ok',
                'data' => $result
            ]);
        } else {
            throw new NullException();
        }
    }

    //删除一个
    public function delById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $model = new BannerModel();
        $result = $model->getInfoById($id);
        if ($result) {
            $result = $model::destroy($id);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }
}
