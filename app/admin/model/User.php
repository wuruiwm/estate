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
    // 图片url获取器
    public function getHeadImgAttr($value){
        $img_url = Attachment::where('id',$value)->column('filepath');
        $http = http_type();
        if($img_url){
            return ['val'=>$value,'text'=>$http.$img_url[0]];
        }
    }
    // 上次登录时间格式化
    public function getLoginTimeAttr($value)
    {
        return date("Y-m-d H:i",$value) ;
    }
    // 代理状态
    public function getLevelAttr($value)
    {
        $data =['会员','代理'];
        return $data[$value] ;
    }
    // 实名状态
    public function getIsRealnameAttr($value)
    {
        $data =['否','是'];
        return $data[$value] ;
    }


    //  获取所有会员信息
    public static function getUserAll($page, $limit,$where){
        $number = $page * $limit;
        $userAll = self::limit($number, $limit)
            ->order('create_time desc')
            ->where($where)
            ->select();
        if(!$userAll){
            return self::DataFormat(0);
        }
        //修改头像信息
        foreach ($userAll as $key => $value) {
            $userAll[$key]['head_img_url']=$userAll[$key]['head_img']['val'];
            $userAll[$key]['head_img_id']=$userAll[$key]['head_img']['text'];
            if($userAll[$key]['superior_id']==0){
                $userAll[$key]['superior']='平台';
            }else{
                $userAll[$key]['superior']=self::where('id',$userAll[$key]['superior_id'])->column('nickname');
            }

            unset($userAll[$key]['head_img']);
        }
        return self::DataFormat($userAll,0,'ok',self::count());
    }



    //  获取所有代理商信息
    public static function getAgencyAll($page, $limit,$where){
        $number = $page * $limit;
        $userAll = self::limit($number, $limit)
            ->order('create_time desc')
            ->where($where)
            ->where('level',1)
            ->select();
        if(!$userAll){
            return self::DataFormat(0);
        }
        //修改头像信息
        foreach ($userAll as $key => $value) {
            $userAll[$key]['head_img_url']=$userAll[$key]['head_img']['val'];
            $userAll[$key]['head_img_id']=$userAll[$key]['head_img']['text'];
            if($userAll[$key]['superior_id']==0){
                $userAll[$key]['superior']='平台';
            }else{
                $userAll[$key]['superior']=self::where('id',$userAll[$key]['superior_id'])->column('nickname');
            }

            unset($userAll[$key]['head_img']);
        }
        return self::DataFormat($userAll,0,'ok',self::count());
    }
}