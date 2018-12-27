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
use app\lib\validate\AddUsedHouse;
use app\lib\validate\IDMustBePositiveInt;
use app\lib\validate\Page;
use think\Db;

class House extends Permissions
{
    public function index()
    {
        return $this->fetch();
    }

    public function used()
    {
        return $this->fetch();
    }

    public function new_house()
    {
        return $this->fetch();
    }



    /**
     * 发布新房源
     */
    public function addNewHouse()
    {
        $post = input('post.');
        // 新房
        if(input('post.init_status')=='1'){
            (new AddNewHouse())->goCheck();
            // 佣金方案
            $brokerage_plan_str = '';
            foreach ($post['brokerage_plan'] as $key => $value) {
                $brokerage_plan_str .= $value . ',';
            }
            $post['brokerage_plan'] = substr($brokerage_plan_str, 0, strlen($brokerage_plan_str) - 1);
            $post['opening_time'] = strtotime($post['opening_time']);
        // 二手房
        }else{
            (new AddUsedHouse())->goCheck();
        }

        $model = new HouseSource();
        $post['status'] = 1;
        $result = $model->allowField(true)->save($post);

        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 修改
    public function updateNewHouse($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $post = input('post.');
        if (!empty(HouseSource::getHouseById($id))) {
            // 新房
            if(input('post.init_status')=='1'){
                (new AddNewHouse())->goCheck();
                // 佣金方案
                $brokerage_plan_str = '';
                foreach ($post['brokerage_plan'] as $key => $value) {
                    $brokerage_plan_str .= $value . ',';
                }
                $post['brokerage_plan'] = substr($brokerage_plan_str, 0, strlen($brokerage_plan_str) - 1);
                $post['opening_time'] = strtotime($post['opening_time']);
                // 二手房
            }else{
                (new AddUsedHouse())->goCheck();
            }
            $model = new HouseSource();
            $result = $model->allowField(true)->save($post, ['id' => $id]);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }


    public function getHouseList($page = '', $limit = '', $key = '')
    {
        (new Page())->goCheck();
        if (isset($key['keyword']) and !empty($key['keyword'])) {
            $where['title'] = ['like', '%' . $key['keyword'] . '%'];
        }
        if (isset($key['type_id']) and !empty($key['type_id'])) {
            $where['init_status'] = $key['type_id'];
        }
        if (isset($key['create_time']) and !empty($key['create_time'])) {
            $min_time = strtotime($key['create_time']);
            // $max_time = $min_time + 24 * 60 * 60;
            $where['opening_time'] = $min_time;// [['>=',$min_time],['<=',$max_time]];

        }
        if (empty($where['title']) and empty($where['init_status']) and empty($where['opening_time'])) {
            $where = null;
        }
        //return json($key);
        return HouseSource::getList($page - 1, $limit, $where);
    }

    public static function getHouseById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        if (!empty(HouseSource::getHouseById($id))) {
            return HouseSource::getHouseById($id);
        }
        throw new NullException();
    }


    //删除一个
    public function delById($id = '')
    {
        (new IDMustBePositiveInt())->goCheck();
        $model = new HouseSource();
        $result = $model::getHouseById($id);
        if ($result) {
            $imgs = Db::name('house_source')->where('id',$id)->find();
            $imgs = $imgs['cover_img'].','.$imgs['head_img'].','.$imgs['room_map'];
            $imgData = Db::name('attachment')->where('id','in',$imgs)->select();
            foreach($imgData as $k=>$v){
                if(file_exists(ROOT_PATH . 'public' . $v['filepath'])) {
                    if(unlink(ROOT_PATH . 'public' . $v['filepath'])) {
                        Db::name('attachment')->where('id',$v['id'])->delete();
                    }
                }

            }
            $result = $model::destroy($id);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new NullException();
    }

    // 批量删除
    public function dels($ids)
    {
        $model = new HouseSource();
        $houseData = Db::name('house_source')->where('id','in',$ids)->select();
        foreach($houseData as $k=>$v){
            $ones = $v['cover_img'].','.$v['head_img'].','.$v['room_map'];
            $imgData = Db::name('attachment')->where('id','in',$ones)->select();
            foreach($imgData as $y=>$z){
                if(file_exists(ROOT_PATH . 'public' . $z['filepath'])) {
                    if(unlink(ROOT_PATH . 'public' . $z['filepath'])) {
                        Db::name('attachment')->where('id',$z['id'])->delete();
                    }
                }
            }
        }

        $result = $model::destroy($ids);;
        if ($result > 0) {
            throw new SuccessMessage();
        }

    }

    // 是否显示头条
    public function isHead($id = '', $is_head = '')
    {
        $model = new HouseSource();
        $result = $model->where('id', $id)->update([
            'is_head' => $is_head,
            'update_time' => time()
        ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 是否审核
    public function isStatus($id = '', $is_status = '')
    {
        $model = new HouseSource();
        $result = $model->where('id', $id)->update([
            'status' => $is_status,
            'update_time' => time()
        ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

}
