<?php
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
class Commission extends Controller{
    /**
     * @api {post} comm/commlist 获取我的客户里的佣金管理
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  报获取我的客户里的佣金管理
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/comm/commlist
     * @apiParam {str} token 用来获取用户id的token，放在header里
     */
    public function commlist(){
        //$user_id = 3;
        $user_id = Token::getCurrentTokenUserId();
        $comm = model('Commission');
        $res = $comm->field(['id','name','house_title','number','house_area','house_type','commission'])
        ->where('user_id',$user_id)->select();
        $number = 0;
        $data = [];
        foreach ($res as $k => $v) {
            $a = $v->getData();
            $number = $number + $a['commission'];
            $data[] = $a;
        }
        $data['sum'] = $number;
        return $data;
    }
}


?>
