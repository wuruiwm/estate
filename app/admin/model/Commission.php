<?php
namespace app\admin\model;

use think\Model;

class Commission extends model
{
    public function getUserIdAttr($value){
        return User::where('id',$value)->value('card_name');
    }
    protected function getLevelAttr($value)
    {
        return ['','门店经纪人','大众经纪人'][$value];
    }

    protected function getHouseIdAttr($value)
    {
        return HouseSource::where('id',$value)->value('title');
    }
}


?>
