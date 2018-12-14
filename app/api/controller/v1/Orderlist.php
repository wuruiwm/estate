<?php 
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
class Orderlist extends Controller{
	/**
     * @api {get} order/baobei 获取我的客户里四种列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取四种状态列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/baobei
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {int} state 四种状态，1已报备，2已到访，3已成交，4已提额
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户里四种状态列表
    */
	public function baobei($page='',$limit='',$state=''){
		//判断传来的页码，请求的个数，是否合法
		if (!is_numeric($page)) {
			return ['mag'=>'请输入正确的页码'];
		}
		if (!is_numeric($limit)) {
			return ['msg'=>'请输入正确的每页显示的个数'];
		}
		//报备，到访，提额的字段
		$field = ['id','name','number','content'];
		if (is_numeric($state)) {
			switch ($state) {
			case '1':
			$str = 'is_new';
			break;
			
			case '2':
			$str = 'is_visit';
			break;

			case '3':
			//如果传来的参数为3，也就是已成交，那么就将查询字段改变
			$str = 'is_deal';
			$field = ['id','name','number','content','is_pay'];
			break;

			case '4':
			$str = 'is_pay';
			break;
			}
		}else {
			return ['msg'=>'请输入正确的状态码'];
		}
		$order = model('Order');
		$user_id = Token::getCurrentTokenUserId();
		//$user_id = 2;
		$str = $str.'=1 and user_id='.$user_id;
		$res = $order->field($field)
		->where($str)
		->order('id desc')
		->page($page,$limit)
		->select();
		$data = [];
		foreach ($res as $k => $v) {
			$data[] = $v->getData();
		}
		return $data;
	}
}

 ?>