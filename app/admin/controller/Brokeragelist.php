<?php 
namespace app\admin\controller;
use think\Controller;
class Brokeragelist extends Controller{
	//佣金列表
	public function brokeragelist(){
		//实例化model
		$commission =  model('Commission');
		//判断是否有参数传过来，没有则直接查出数据，并且按id倒序
		if (!input('get.panduan')) {
			$list = $commission->order('id desc')->paginate(10);
		}else{
			//否则获取get传参，并且拼接成where语句
			$get = input('get.');
			$str = '1';
			//判断四个字段是否存在，如果存在，则执行拼接where语句操作
			if (isset($get['user_id'])) {
				$str = $str." and user_id='".$get['user_id']."'";
			}
			if (isset($get['date'])) {
				//把前端传过来的日期，转为时间戳，再进行拼接判断
				$date = strtotime($get['date']);
				$str = $str . ' and date='.$date;
			}
			if (isset($get['order_id'])) {
				$str = $str." and order_id='".$get['order_id']."'";
			}
			if (isset($get['house_id'])) {
				$str = $str." and house_id='" . $get['house_id']."'";
			}
			$list = $commission->where($str)->order('id desc')->paginate(10,false,['query'=>$get]);
		}
		//获取分页代码
		$page = $list->render();
		foreach ($list as $k => $v) {
			$list[$k]['date'] = date('Y-n-j',$v['date']);
		}
		$this->assign('list',$list);
		$this->assign('page',$page);
		return $this->fetch();
	}
	//佣金列表的撤销
	public function revoke($id=''){
		//判断id是否合法
		if (!is_numeric($id)) {
			return json(['msg'=>'请输入正确的id']);
		}
		//实例化model
		$commission =  model('Commission');
		//根据id查出佣金列表对应的订单id
		$order_id = $commission->field(['order_id'])->where('id',$id)->find()->getData()['order_id'];
		//根据订单id，重新将订单的状态码改为已成交，未结佣状态
		$model = model('Order');
		$data = ['id'=>$order_id,'is_new'=>0,'is_visit'=>0,'is_deal'=>1,'is_pay'=>0];
		$res = $model->isUpdate(true)->save($data);
		//删除佣金列表对应的id行
		$res2 = $commission->where('id',$id)->delete();
		//判断是否更改状态码成功和删除佣金列表成功，两个都成功，则返回撤销成功，否则撤销失败
		if ($res&&$res2) {
			return json(['msg'=>'撤销成功']);
		}else{
			return json(['msg'=>'撤销失败']);
		}
	}
}




 ?>