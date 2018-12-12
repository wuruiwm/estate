<?php 
namespace app\admin\controller;
use think\Controller;
class Order extends Permissions{
	public function orderlist(){
		$order = model('Order');
		//分页，并且获取所有的行数据，并且按照id倒序排列,放到一个二维数组里，并且每页是10个,
		$list = $order->order('id desc')->paginate(10);
		//获取分页代码
		$page = $list->render();
		foreach ($list as $k => $v) {
			if ($v['gender'] == 1) {
				$list[$k]['gender'] = '男'; 
			}else{
				$list[$k]['gender'] = '女';
			}
			$list[$k]['date'] = date('Y-n-j',$v['date']);
			if ($v['is_new'] == 1) {
				$list[$k]['is_new'] = '<span style="color: red;">已报备</span>';
			}else {
				$list[$k]['is_new'] = '未报备';
			}
			if ($v['is_visit'] == 1) {
				$list[$k]['is_visit'] = '<span style="color: red;">已到访</span>';
			}else {
				$list[$k]['is_visit'] = '未到访';
			}
			if ($v['is_deal'] == 1) {
				$list[$k]['is_deal'] = '<span style="color: red;">已成交</span>';
			}else {
				$list[$k]['is_deal'] = '未成交';
			}
			if ($v['is_pay'] == 1) {
				$list[$k]['is_pay'] = '<span style="color: red;">已提额</span>';
			}else {
				$list[$k]['is_pay'] = '未提额';
			}
		}
		$this->assign('list',$list);
		$this->assign('page',$page);
		//$this->assign('data',$data);
		return $this->fetch();
	}
}

 ?>