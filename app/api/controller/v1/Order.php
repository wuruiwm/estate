<?php 
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
use think\Db;
class Order extends Controller{
    /**
     * @api {post} order/add 报备客户信息提交
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  报备客户信息提交
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/order/add
     * @apiParam {str} house_title 楼盘名字  
     * @apiParam {int} province 省份ID
     * @apiParam {int} city 市ID
     * @apiParam {int} area 区县ID
     * @apiParam {str} house_id 楼盘id
     * @apiParam {str} name 用户名 
     * @apiParam {int} number 手机号码 
     * @apiParam {int} gender 1男2女 
     * @apiParam {str} date 预计带看时间，例2018-11-11
     * @apiParam {str} content 购房意向
     * @apiParam {str} token 用来获取用户id的token
     */
	public function orderadd(){
		//实例化model订单表
		//获取post传参
		//实例化model房源表
		$order = model('Order');
		$post = input('post.');
		$house = model('HouseSource');
		//检查楼盘id和楼盘名是否在楼盘表中
		$house_res = $house->where('id',$post['house_id'])->where('title',$post['house_title'])->select();
		//判断是否有返回结果，如果没有查到结果，则返回提示信息
		if (!$house_res) {
			return ['reg'=>"请输入正确的楼盘名字和ID"];
		}
		//检查名字是否存在
		if (!$post['name']) {
			return ['msg'=>'请输入正确的姓名'];
		}
		//手机号正则验证
		$search = '/^1[34578]\d{9}$/';
		$bool = preg_match($search,$post['number']);
		if ($bool == 0) {
			return ['msg'=>'请输入正确的手机号'];
		}
		//判断性别
		if(!(($post['gender'] == 1)||($post['gender'] == 2))){
			return ['msg'=>'请输入正确的性别'];
		}
		//转换时间为时间戳
		$post['date'] = strtotime($post['date']);
		//判断转出来的时间戳是否是数字，如果不是则说明传来的不是时间
		if (!is_numeric($post['date'])) {
			return ['msg'=>'请输入正确的带看时间']; 
		}
		//检查购房意向是否存在
		if (!$post['content']) {
			return ['msg'=>'请输入正确的购房意向'];
		}
		//设置报备的状态为1
		$post['is_new'] = 1;
		//获取用户id
		$user_id = Token::getCurrentTokenUserId();
		$post['user_id'] = $user_id;
		//将要插入数据的数组，放到一个空数组里，执行savaAll方法插入数据
		$data = [];
		$data[] = $post;
		$res = $order->saveAll($data);
		//判断返回值是否为空，有值，则返回报备成功，没有值，则返回报备失败
		if ($res) {
			return ['msg'=>'报备成功'];
		}else {
			return ['msg'=>'报备失败'];
		}
	}
}
 ?>