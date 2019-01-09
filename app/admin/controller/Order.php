<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
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
			$zhuangtai = input('zhuangtai');
			if (isset($zhuangtai)) {
			//将传来的状态码，转换成我的客户中的四种状态
			switch ($zhuangtai) {
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
			$name = input('name');
			//拼接传来的参数，拼接成where条件
			if (isset($name)) {
				$str = $str." and name='".$name."'";
			}
			$date = input('date');
			if (isset($date)) {
				$date = strtotime($date);
				$str = $str.' and date='.$date;
			}
			$user_id = input('user_id');
			if (isset($user_id)) {
				$conn = Db::connect();
				$user_id = $conn->table('tplay_user')->field(['id'])->where('card_name',$user_id)->find()['id'];
				$str = $str." and user_id='".$user_id."'";
			}
			$list = $order->where($str)->order('id desc')->paginate(10,false,['query'=>$get]);
		}
		//获取分页代码
		$page = $list->render();
		$conn = Db::connect();
		//遍历，再if判断数据库中的状态值，改成对应信息，然后再存进数组
		foreach ($list as $k => $v) {
			if ($v['gender'] == 1) {
				$list[$k]['gender'] = '男';
			}else{
				$list[$k]['gender'] = '女';
			}
			$v_user_id = $v['user_id'];
			$user_id_res = $conn->table('tplay_user')->field(['card_name'])->where('id',$v_user_id)->find();
			if ($user_id_res) {
				$list[$k]['user_id'] = $user_id_res['card_name'];
			}else{
				$list[$k]['user_id'] = '该经纪人没有实名姓名';
			}
			
			$list[$k]['date'] = date('Y-n-j',$v['date']);
			$house = model('HouseSource');
			$house_res = $house->field(['init_status'])->where('id',$v['house_id'])->find();
			if (!$house_res) {
				$list[$k]['init_status'] = 2;
				$list[$k]['init'] = '<span style="color: red;">该笔订单对应的房源被删除</span>';
			}else{
				$house_res = $house_res->getData();
			if ($house_res['init_status'] == 1) {
				$list[$k]['init_status'] = 1;
				$list[$k]['init'] = '新房';
			}else if($house_res['init_status'] == 2){
				$list[$k]['init_status'] = 2;
				$list[$k]['init'] = '二手房';
			}
			}	
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
	public function yongjin($house_id='',$order_id=''){
		//获取佣金方案
		$house =  model('HouseSource');
		$res = $house->field(['brokerage_plan'])->where('id',$house_id)->find();
		if (!$res) {
			return ['reg'=>'0'];
		}
		$brokerage_plan = $res->getData()['brokerage_plan'];
		//获取到楼盘里选中的方案，多个佣金方案的id用逗号隔开 1,5,8
		//用explode 将字符串分割成数组
		$data = explode(',',$brokerage_plan);
		//实例化佣金方案的model
		//循环取出数据，where条件为我们刚刚从楼盘取出的方案，并且将结果赋值给一个空数组
		$brokerage =  model('Brokerage');
		$fangan = [];
		foreach ($data as $k => $v) {
			$fangan[] = $brokerage->field(['id','house_area','house_type','price','store_percentage','public_percentage'])->where('id',$v)->find()->getData();
		}
		//实例化order表
		$order = model('Order');
		//查出order表对应的用户id，再把传过来的order_id和house_id  三个id赋值给数组，再unset掉不需要的键值对，然后将这个数组和查出佣金方案的数据加在一起
		$order_res = $order->field(['id','user_id'])->where('id',$order_id)->find()->getData();
		$order_res['order_id'] = $order_res['id'];
		unset($order_res['id']);
		$fangan['house_id'] = $house_id;
		$fangan = $fangan + $order_res;
		return json($fangan);
	}
	public function jiesuan(){
		//获取get传参
		$get = input('get.');
		//实例化n个model
		$user = model('User');
		$brokerage = model('Brokerage');
		$order = model('order');
		//传来的userid查出数据
		$user_res = $user->field(['id','level'])->where('id',$get['user_id'])->find()->getData();
		$brokerage_res = $brokerage->field(['id','house_area','house_type','price','store_percentage','public_percentage'])->where('id',$get['brokerage_id'])->find()->getData();
		//获取订单状态
		$order_res = $order->field(['id','name','house_title','number','is_deal','is_pay'])->where('id',$get['order_id'])->find()->getData();
		//订单必须是已成交，并且未结佣
		if (!(($order_res['is_deal'] == 1)&&($order_res['is_pay'] == 0))) {
			return json(['reg'=>'当前订单不是已成交状态']);
		}
		//判断用户是大众经纪人还是门店经纪人，走不同的佣金
		if ($user_res['level'] == 1) {
			$commission = $brokerage_res['price']*$brokerage_res['store_percentage']/100;
		}else if ($user_res['level'] == 2) {
			$commission = $brokerage_res['price']*$brokerage_res['public_percentage']/100;
		}
		//将对应的值赋值到数组里，然后存到数据库
		$data = [];
		$data['user_id'] = $user_res['id'];
        $data['level']=$user_res['level'];
		$data['order_id'] = $order_res['id'];
		$data['house_id'] = $get['house_id'];
		$data['brokerage_id'] = $brokerage_res['id'];
		$data['name'] = $order_res['name'];
		$data['house_area'] = $brokerage_res['house_area'];
		$data['house_type'] = $brokerage_res['house_type'];
		$data['price'] = $brokerage_res['price'];
		$data['store_percentage'] = $brokerage_res['store_percentage'];
		$data['public_percentage'] = $brokerage_res['public_percentage'];
		$data['house_title'] = $order_res['house_title'];
		$data['number'] = $order_res['number'];
		$data['commission'] = $commission;
		$t = time();
		$t = date('Y-n-j',$t);
		$t = strtotime($t);
		$data['date'] = $t;
		$data2 = [$data];
		$commission = model('Commission');
		//判断佣金结算的表里有没有这个订单id，如果有，则不让结算，提示已经结算过佣金，如果没有才让结算
		$yanzheng = $commission->where('order_id',$get['order_id'])->select();
		if ($yanzheng) {
			return json(['reg'=>'该笔订单已经结算过佣金']);
		}
		$res = $commission->saveAll($data2);
		//判断插入是否成功，成功则将订单状态改为已结佣状态，提示结算成功
		if ($res) {
			$zhuangtai = ['id'=>$get['order_id'],'is_new'=>0,'is_visit'=>0,'is_deal'=>1,'is_pay'=>1];
			$res = $order->isUpdate(true)->save($zhuangtai);
			if ($res) {
				$str = '佣金结算成功,结算佣金为'.$data['commission'].'元';
				return json(['reg'=>$str,'res'=>1]);
			}
		}else{
			return json(['reg'=>'佣金结算失败']);
		}
	}
}

 ?>
