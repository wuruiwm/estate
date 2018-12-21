<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/29 0029
 * Time: 9:27
 */

namespace app\admin\model;


class User extends BaseModel
{

    protected function getHeadImgAttr($value)
    {
        if (empty($value)) {
            return http_type() . '/default_head.jpg';
        }
        return http_type() . '/' . $value;
    }

    // 上次登录时间格式化
    public function getLoginTimeAttr($value)
    {
        return date("Y-m-d H:i",$value) ;
    }

    public function getLevelAttr($value)
    {
        return ['无','门店经纪人','大众经纪人'][$value];
    }

    public function getCardNameAttr($value)
    {
        if($value==''){
            return '无';
        }
        return $value;
    }


    public function getCardNumberAttr($value)
    {
        if($value=='0'){
            return '无';
        }
        return $value;
    }

    /*public function getIsExamineAttr($value)
    {
        return ['待审核','已通过','未通过'][$value];
    }*/

    public function getStoreIdAttr($value)
    {
        $store_name = Store::where('id',$value)->value('name');
        if($store_name !=''){
            return $store_name;
        }
        return '无';
    }

    public static function getList($page, $limit, $where)
    {
        $number = $page * $limit;
        $result = self::limit($number, $limit)
            ->order('create_time desc')
            ->where($where)
            ->select();
        if (!$result) {
            return self::DataFormat(0);
        }
        return self::DataFormat($result, 0, 'ok', self::count());
    }

    public static function getStoreUserList($page, $limit, $where,$store_id)
    {
        $number = $page * $limit;
        $result = self::limit($number, $limit)
            ->order('create_time desc')
            ->where($where)
            ->where('store_id',$store_id)
            ->select();
        if (!$result) {
            return self::DataFormat(0);
        }
        return self::DataFormat($result, 0, 'ok', self::count());
    }

    public static function getRealnameList($page, $limit, $where)
    {
        $number = $page * $limit;
        $result = self::limit($number, $limit)
            ->order('update_time desc')
            ->where($where)
            ->where('is_submit',1)
            ->select();
        if (!$result) {
            return self::DataFormat(0);
        }
        return self::DataFormat($result, 0, 'ok', self::count());
    }
}
