<?php 
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
class Orderlist extends Controller{
	/**
     * @api {get} order/baobei 获取我的客户已报备列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取已报备列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/baobei
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {int} state 四种状态，1已报备，2已到访，3已成交，4已提额
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户已报备列表
    */
	public function baobei(){
		$page = input('page');
		$limit = input('limit');
		$state = input('state');
		if (!is_numeric($page)) {
			return ['mag'=>'请输入正确的页码'];
		}
		if (!is_numeric($limit)) {
			return ['msg'=>'请输入正确的每页显示的个数'];
		}
		if (is_numeric($state)) {
			switch ($state) {
			case '1':
			$str = 'is_new';
			break;
			
			case '2':
			$str = 'is_visit';
			break;

			case '3':
			$str = 'is_deal';
			break;

			case '4':
			$str = 'is_pay';
			break;
			}
		}else {
			return ['msg'=>'请输入正确的状态码'];
		}
		$order = model('Order');
		//$user_id = Token::getCurrentTokenUserId();
		$user_id = 2;
		$str = $str.'=1 and user_id='.$user_id;
		$res = $order->field(['id','name','number','content'])
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
	/**
     * @api {post} order/daofang 获取我的客户已到访列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取已到访列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/daofang
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户已到访列表
    */
	public function daofang(){
		$order = model('Order');
		//$user_id = Token::getCurrentTokenUserId();
		$user_id = 2;
		$str = 'is_visit=1 and user_id='.$user_id;
		$page = input('page');
		$limit = input('limit');
		$res = $order->field(['id','name','number','content'])
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
	 /**
     * @api {post} order/chengjiao 获取我的客户已成交列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取已成交列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/chengjiao
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户已成交列表
     */
	public function chengjiao(){
		$order = model('Order');
		//$user_id = Token::getCurrentTokenUserId();
		$user_id = 2;
		$str = 'is_deal=1 and user_id='.$user_id;
		$page = input('page');
		$limit = input('limit');
		$res = $order->field(['id','name','number','content','is_pay'])
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
	 /**
     * @api {post} order/tie 获取我的客户已提额列表
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取已提额列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/tie
     * @apiParam {int} page 当前页
     * @apiParam {int} limit 每页显示条数
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户已提额列表
     */
	public function tie(){
		$order = model('Order');
		//$user_id = Token::getCurrentTokenUserId();
		$user_id = 2;
		$str = 'is_pay=1 and user_id='.$user_id;
		$page = input('page');
		$limit = input('limit');
		$res = $order->field(['id','name','number','content'])
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