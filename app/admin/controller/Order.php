<?php 
namespace app\admin\controller;
use think\Controller;
class Order extends Permissions{
	//列表
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
	//删除
	public function orderDel(){
		//var_dump(input('post.'));exit();
		$post = input('post.');
		$id = input('id');
		if (is_numeric($id)) {
		//获取传来的id，并且赋值给实例化对象，然后调用删除操作
		$order = model('Order');
		$order->id = $id;
		$res = $order->delete();
		if ($res) {
            echo '删除成功';
		}else {
			echo '删除失败';
		}			
	  }else {
	  	//var_dump($post);exit();
	  	$num = count($post);
	  	$a = 0;
	  	foreach ($post as $k => $v) {
	  		//$data[] = $v;
	  		$order = model('Order');
			$order->id = $v;
			$res = $order->delete();
			$a = $a + $res;
			//echo $res;
	  	}
	  	if ($num == $a) {
	  		echo "批量删除成功";
	  	}else {
	  		echo "批量删除失败";
	  	}
	  }

	}
	//编辑
	public function orderedit(){
		$order = model('Order');
		if (empty($_POST)) {
			$id = input('id');
			if (!is_numeric($id)) {
				echo "id不正确";exit();
				}
			$res = $order->find($id);
			$data = $res->getData();
			$data['date'] = date('Y-n-j',$data['date']);
			if ($data['is_new']==1) {
				$data['zhuangtai'] = 1;
			}else if ($data['is_visit']) {
				$data['zhuangtai'] = 3;
			}else if ($data['is_deal']) {
				$data['zhuangtai'] = 5;
			}else if ($data['is_pay']) {
				$data['zhuangtai'] = 7;
			}else{
				$data['zhuangtai'] = 0;
			}
			$this->assign('data',$data);
			return $this->fetch();
		}else {
			$post = input('post.');
			$user = model('User');
			$user_id  = 'id='.$post['user_id'];
			$res = $user->where($user_id)->find();
			if (!$res) {
				echo '请输入正确的用户ID';
			}
			if (!$post['name']) {
				echo '请输入正确的姓名';exit();
			}
			$search = '/^1[34578]\d{9}$/';
			$bool = preg_match($search,$post['number']);
			//echo $bool; exit();
			if ($bool == 0) {
				echo '请输入正确的手机号';exit();
			}
			if(!(($post['gender'] == 1)||($post['gender'] == 2))){
				echo '请输入正确的性别';exit();
			}
			$post['date'] = strtotime($post['date']);
			if (!is_numeric($post['date'])) {
				echo '请输入正确的带看时间'; exit();
			}
			if (!$post['content']) {
				echo '请输入正确的购房意向';exit();
			}
			switch ($post['zhuangtai']) {
				case '1':
				$post['is_new'] = 1;
				$post['is_visit'] = 0;
				$post['is_deal'] = 0;
				$post['is_pay'] = 0;
				break;
				
				case '3':
				$post['is_new'] = 0;
				$post['is_visit'] = 1;
				$post['is_deal'] = 0;
				$post['is_pay'] = 0;
				break;

				case '5':
				$post['is_new'] = 0;
				$post['is_visit'] = 0;
				$post['is_deal'] = 1;
				$post['is_pay'] = 0;
				break;

				case '7':
				$post['is_new'] = 0;
				$post['is_visit'] = 0;
				$post['is_deal'] = 0;
				$post['is_pay'] = 1;
				break;
			}
			unset($post['zhuangtai']);
			$res = $order->isUpdate(true)->save($post);
			$id = input('id');
			if ($res) {
				$this->redirect('orderedit',['id'=>$id,'?msg'=>'1']);
			}else {
				$this->redirect('orderedit',['id'=>$id,'?msg'=>'0']);
			}
			
		}
	}
}

 ?>