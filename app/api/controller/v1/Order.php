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
     */
	public function orderadd(){
		//echo 1;exit();
		$order = model('Order');
		$post = input('post.');
		if (!is_string($post['name'])) {
			return ['msg'=>'姓名不合法'];
		}
		if(!is_numeric($post['number'])){
			return ['msg'=>'电话不合法'];
		}
		if(!(($post['gender'] == 1)||($post['gender'] == 2))){
			return ['msg'=>'性别不合法'];
		}
		$post['date'] = strtotime($post['date']);
		if (!is_numeric($post['date'])) {
			return ['msg'=>'带看时间不合法']; 
		}
		if (!is_string($post['content'])) {
			return ['msg'=>'带看意向不合法'];
		}
		$user_id = Token::getCurrentTokenUserId();
		$post['user_id'] = $user_id;
		$post['is_new'] = 1;
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