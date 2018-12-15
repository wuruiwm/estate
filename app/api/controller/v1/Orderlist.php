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
		$field = ['id','name','number','content','date'];
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
			$field = ['id','name','number','content','is_pay','date'];
			break;

			case '4':
			$str = 'is_pay';
			break;
			}
		}else {
			//如果传来的状态码不是
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
			$a = $v->getData();
			$a['date'] = date('Y-n-j',$a['date']);
			$data[] = $a;
		}
		return $data;
	}
	/**
     * @api {get} order/content 获取报备列表的内容详情
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的用户id获取四种状态列表
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/content
     * @apiParam {int} id 报备列表的id
     * @apiParam {string} token 放在header里传过来
     * @apiName 获取我的客户里四种状态列表的内容详情
    */
	public function content($id=''){
		//获取用户id
		$user_id = Token::getCurrentTokenUserId();
		//判断订单id是否合法
		if (!is_numeric($id)) {
			return ['reg'=>'请输入正确的id'];
		}
		//实例化model，然后查出数据，再if判断，如果内容为空，则返回内容为空
		$order = model('Order');
		$res = $order->field(['id','name','number','gender','date','content'])->where('user_id',$user_id)->where('id',$id)->find();
		if (!$res) {
			return ['reg'=>'传入的id内容为空'];
		}
		//取出一行数据，并且转换时间戳为时间，方便前端调用
		$data = $res->getData();
		$data['date'] = date('Y-n-j',$data['date']);
		return $data;
	}
}

 ?>