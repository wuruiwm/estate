<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/15
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\model;


class Store extends BaseModel
{
    protected function getImgIdAttr($value)
    {
        $img_str = Attachment::where('id', $value)->value('filepath');

        if (empty($img_str)) {
            $img_str = '/null.jpg';
            $value = '1';
        }
        return ['img_id' => $value, 'img_url' => http_type() . $img_str];
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

    public static function getInfoById($id = '')
    {
        $result = self::find($id);
        return $result;
    }
}
