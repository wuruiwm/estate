<?php 
namespace app\admin\controller;
use think\Controller;
class Order extends Permissions{
	//列表
	public function orderlist(){
		$order = model('Order');
		//垃圾tp5分页，是通过get传参，所以这里不能直接判断get是否为空，所以我前端传了一个字段叫panduan
		//通过判断这个，来判断有没有get传参
		if (!input('get.panduan')) {
			$list = $order->order('id desc')->paginate(10);
		}
		else {
			$get = input('get.');
			$str = '1';
			if (isset($get['zhuangtai'])) {
			//将传来的状态码，转换成我的客户中的四种状态
			switch ($get['zhuangtai']) {
				case '1':
				$str = 'is_new=1';
				break;
				
				case '3':
				$str = 'is_visit=1';
				break;

				case '5':
				$str = 'is_deal=1 and is_pay=0';
				break;

				case '7':
				$str = 'is_pay=1';
				break;
			  }
			}
			//拼接传来的参数，拼接成where条件
			if (isset($get['name'])) {
				$str = $str." and name='".$get['name']."'";
			}
			if (isset($get['date'])) {
				$date = strtotime($get['date']);
				$str = $str.' and date='.$date;
			}
			$list = $order->where($str)->order('id desc')->paginate(10,false,['query'=>$get]);
		}
		//获取分页代码
		$page = $list->render();
		//遍历，再if判断数据库中的状态值，改成对应信息，然后再存进数组
		foreach ($list as $k => $v) {
			if ($v['gender'] == 1) {
				$list[$k]['gender'] = '男'; 
			}else{
				$list[$k]['gender'] = '女';
			}
			$list[$k]['date'] = date('Y-n-j',$v['date']);
			if ($v['is_new'] == 1) {
				$list[$k]['is_new'] = '<span style="color: red;">已报备</span>';
				$list[$k]['is_visit'] = '未到访';
				$list[$k]['is_deal'] = '未成交';
				$list[$k]['is_pay'] = '未结佣';
				$list[$k]['settlement'] = '1';
			}else if ($v['is_visit'] == 1) {
				$list[$k]['is_new'] = '<span style="color: red;">已报备</span>';
				$list[$k]['is_visit'] = '<span style="color: red;">已到访</span>';
				$list[$k]['is_deal'] = '未成交';
				$list[$k]['is_pay'] = '未结佣';
				$list[$k]['settlement'] = '1';
			}else if (($v['is_deal'] == 1) && ($v['is_pay'] == 0)) {
				$list[$k]['is_new'] = '<span style="color: red;">已报备</span>';
				$list[$k]['is_visit'] = '<span style="color: red;">已到访</span>';
				$list[$k]['is_deal'] = '<span style="color: red;">已成交</span>';
				$list[$k]['is_pay'] = '未结佣';
				$list[$k]['settlement'] = 0;
			}else if ($v['is_pay'] == 1) {
				$list[$k]['is_new'] = '<span style="color: red;">已报备</span>';
				$list[$k]['is_visit'] = '<span style="color: red;">已到访</span>';
				$list[$k]['is_deal'] = '<span style="color: red;">已成交</span>';
				$list[$k]['is_pay'] = '<span style="color: red;">已结佣</span>';
				$list[$k]['settlement'] = '1';
			}
		}
		//将多行数据的数组list和分页代码page
		$this->assign('list',$list);
		$this->assign('page',$page);
		return $this->fetch();
	}
	//删除
	public function orderDel(){
		$post = input('post.');
		$id = input('id');
		//判断$id是否为一个数字，是数字代表是删除一个，如果不是数字，传来的是数组， 那么就是批量删除
		if (is_numeric($id)) {
		//获取传来的id，并且赋值给实例化对象，然后调用删除操作
		$order = model('Order');
		//将主键值赋值给model出来的实例化对象的
		$order->id = $id;
		$res = $order->delete();
		if ($res) {
            echo '删除成功';
		}else {
			echo '删除失败';
		}			
	  }else {
	  	//var_dump($post);exit();
	  	//数出数组单元，遍历数组，根据取出的值删除行，并且把返回结果，加上$a再赋值给$a
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
	  	//如果成功的条数和原来数组的条数一样，则说明批量删除成功
	  	if ($num == $a) {
	  		echo "批量删除成功";
	  	}else {
	  		echo "批量删除失败";
	  	}
	  }

	}
	//编辑
	public function orderedit(){
		//查出一行数据
		$order = model('Order');
		if (empty($_POST)) {
			$id = input('id');
			if (!is_numeric($id)) {
				echo "id不正确";exit();
				}
			$res = $order->find($id);
			$data = $res->getData();
			//将数组中的时间戳转换成日期，再赋值回去
			$data['date'] = date('Y-n-j',$data['date']);
			//将数组中的四种状态码转换成前端的下拉框的值
			if ($data['is_new']==1) {
				$data['zhuangtai'] = 1;
			}else if ($data['is_visit']==1) {
				$data['zhuangtai'] = 3;
			}else if ($data['is_deal']==1 && $data['is_pay'] == 0) {
				$data['zhuangtai'] = 5;
			}else if ($data['is_pay']) {
				$data['zhuangtai'] = 7;
			}else{
				$data['zhuangtai'] = 0;
			}
			//assign出去，显示在对应的位置
			$this->assign('data',$data);
			return $this->fetch();
		}else {
			//判断id是否存在于user表
			$post = input('post.');
			$user = model('User');
			$user_id  = 'id='.$post['user_id'];
			$res = $user->where($user_id)->find();
			if (!$res) {
				echo '请输入正确的用户ID';exit();
			}
			if (!$post['name']) {
				echo '请输入正确的姓名';exit();
			}
			//手机号正则匹配
			$search = '/^1[34578]\d{9}$/';
			//匹配失败返回0，成功返回1
			$bool = preg_match($search,$post['number']);
			//echo $bool; exit();
			if ($bool == 0) {
				echo '请输入正确的手机号';exit();
			}
			//判断传来的性别数字是否是1或者2
			if(!(($post['gender'] == 1)||($post['gender'] == 2))){
				echo '请输入正确的性别';exit();
			}
			//将日期转换成时间戳，如果转换以后不是数字，则说明传来的日期不正确
			$post['date'] = strtotime($post['date']);
			if (!is_numeric($post['date'])) {
				echo '请输入正确的带看时间'; exit();
			}
			if (!$post['content']) {
				echo '请输入正确的购房意向';exit();
			}
			//将传来的状态码，转换成我的客户中的四种状态
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
				//当修改为已提额状态时，同时把状态改为已提额状态和已成交
				case '7':
				$post['is_new'] = 0;
				$post['is_visit'] = 0;
				$post['is_deal'] = 1;
				$post['is_pay'] = 1;
				break;
			}
			//unset掉状态码字段
			unset($post['zhuangtai']);
			//修改
			$res = $order->isUpdate(true)->save($post);
			$id = input('id');
			//跳转回去，再将返回信息传给前端
			if ($res) {
				$this->redirect('orderedit',['id'=>$id,'?msg'=>'1']);
			}else {
				$this->redirect('orderedit',['id'=>$id,'?msg'=>'0']);
			}
			
		}
	}
	public function yongjin($house_id=''){
		$house =  model('HouseSource');
		$res = $house->field(['brokerage_plan'])->where('id',$house_id)->find();
		$brokerage_plan = $res->getData()['brokerage_plan'];
		//var_dump($brokerage_plan);exit();
		$data = explode(',',$brokerage_plan);
		//print_r($data);
		$brokerage =  model('Brokerage');
		$fangan = [];
		foreach ($data as $k => $v) {
			$fangan[] = $brokerage->field(['id','house_area','house_type','price','store_percentage','public_percentage'])->where('id',$v)->find()->getData();
		}
		//var_dump($fangan);
		return json($fangan);
	}
}

 ?>