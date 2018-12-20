<?php 
namespace app\admin\controller;
use think\Controller;
class Brokeragelist extends Controller{
	public function brokeragelist(){
		$commission =  model('Commission');
		if (!input('get.panduan')) {
			//var_dump(input('get.'));exit();
			$list = $commission->order('id desc')->paginate(10);
		}else{
			$get = input('get.');
			$str = '1';
			if (isset($get['user_id'])) {
				$str = $str." and user_id='".$get['user_id']."'";
			}
			if (isset($get['date'])) {
				$date = strtotime($get['date']);
				$str = $str . ' and date='.$date;
			}
			$list = $commission->where($str)->order('id desc')->paginate(10,false,['query'=>$get]);
		}
		$page = $list->render();
		foreach ($list as $k => $v) {
			$list[$k]['date'] = date('Y-n-j',$v['date']);
		}
		$this->assign('list',$list);
		$this->assign('page',$page);
		return $this->fetch();
	}
	public function revoke($id=''){
		if (!is_numeric($id)) {
			return json(['msg'=>'请输入正确的id']);
		}
		$commission =  model('Commission');
		$order_id = $commission->field(['order_id'])->where('id',$id)->find()->getData()['order_id'];
		$model = model('Order');
		$data = ['id'=>$order_id,'is_new'=>0,'is_visit'=>0,'is_deal'=>1,'is_pay'=>0];
		$res = $model->isUpdate(true)->save($data);

		$res2 = $commission->where('id',$id)->delete();
		if ($res&&$res2) {
			return json(['msg'=>'撤销成功']);
		}else{
			return json(['msg'=>'撤销失败']);
		}
	}
}




 ?>