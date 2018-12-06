<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/20 0020
 * Time: 9:41
 */

namespace app\admin\model;


use think\Model;
use think\Request;

class BaseModel extends Model
{
    /**@method layui 表格所需返回数据信息
     * @param array $data
     * @param int $code
     * @param string $msg
     * @param int $count
     * @return \think\response\Json
     */
    public static function DataFormat($data=[],$code=0,$msg='',$count=0){

        $request = Request::instance();
        // 当前请求的url
        $url = $request->url();
        // 返回信息给客户端
        if($data==null){
            return json([
                'code'=>0,
                'msg'=>'无数据',
                'count'=>0,
                'data'=>null,
                'requestUrl'=>$url,
            ],200);
        }
        return json([
            'code'=>0,
            'msg'=>'总共有'. $count . '条数据',
            'count'=>$count,
            'data'=>$data,
            'requestUrl'=>$url,
        ]);

    }
}