<?php 
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
class Order extends Controller{
    /**
     * @api {post} order/add 报备客户信息提交
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  报备客户信息提交
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/add
     * @apiParam {str} name 用户名 
     * @apiParam {int} number 手机号码 
     * @apiParam {int} gender 1男2女 
     * @apiParam {str} date 预计带看时间，例2018-11-11 
     * @apiParam {str} content 购房意向
     * @apiParam {str} token 用来获取用户id的token 
     */
	public function orderadd(){
		//echo 1;exit();
		$order = model('Order');
		$post = input('post.');
		if (!$post['name']) {
			return ['msg'=>'请输入正确的姓名'];
		}
		$search = '/^1[34578]\d{9}$/';
		$bool = preg_match($search,$post['number']);
		//echo $bool; exit();
		if ($bool == 0) {
			return ['msg'=>'请输入正确的手机号'];
		}
		if(!(($post['gender'] == 1)||($post['gender'] == 2))){
			return ['msg'=>'请输入正确的性别'];
		}
		$post['date'] = strtotime($post['date']);
		if (!is_numeric($post['date'])) {
			return ['msg'=>'请输入正确的带看时间']; 
		}
		if (!$post['content']) {
			return ['msg'=>'请输入正确的购房意向'];
		}
		$post['is_new'] = 1;
		$user_id = Token::getCurrentTokenUserId();
		$post['user_id'] = $user_id;
		$data = [];
		$data[] = $post;
		$res = $order->saveAll($data);
		if ($res) {
			return ['msg'=>'报备成功'];
		}else {
			return ['msg'=>'报备失败'];
		}
	}
}


 ?>