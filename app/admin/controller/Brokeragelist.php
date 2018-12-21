<?php
namespace app\admin\controller;
use app\admin\model\Commission;
use app\api\model\User;
use think\Controller;

class Brokeragelist extends Controller{
	//佣金列表
	public function brokeragelist(){
		//实例化model
		//$commission =  model('Commission');
		//判断是否有参数传过来，没有则直接查出数据，并且按id倒序
		if (!input('get.panduan')) {
			$list = Commission::order('id desc')->paginate(10);
		}else{

			//否则获取get传参，并且拼接成where语句
			$get = input('get.'); //{"panduan":"1","user_id":"1","date":"2018-12-21","order_id":"2","house_id":"3"}
			//return json($get);
            if (isset($get['user_id']) and !empty($get['user_id'])) {
                $users = User::where('card_name','like','%'.$get['user_id'].'%')->select();
                $user_ids = '';
                foreach($users as $k=>$v){
                    $user_ids .=$v['id'].',';
                }
                $where['user_id'] = ['in', $user_ids];
            }

            if (isset($get['date']) and !empty($get['date'])) {
                $date = strtotime($get['date']);
                $where['date'] = $date;
            }
            if (empty($get['user_id']) and empty($get['date']) and empty($get['date'])) {
                $where = null;
            }
            $list = Commission::where($where)->order('id desc')->paginate(10,false,['query'=>$where]);
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
