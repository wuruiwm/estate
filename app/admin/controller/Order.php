<?php 
namespace app\admin\controller;
use think\Controller;
class Order extends Permissions{
	public function orderlist(){
		$order = model('Order');
		//分页，并且获取所有的行数据，并且按照id倒序排列,放到一个二维数组里，并且每页是10个,
		$list = $notice->order('id desc')->paginate(10);
		//获取分页代码
		$page = $list->render();
		$this->assign('list',$list);
		$this->assign('page',$page);
		//$this->assign('data',$data);
		return $this->fetch();
	}
}

 ?>