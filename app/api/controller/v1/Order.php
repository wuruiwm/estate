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
     * @apiParam {str} province 省份 例如 安徽省
     * @apiParam {str} city 市 例如 合肥市
     * @apiParam {str} house_id 楼盘id
     * @apiParam {str} name 用户名 
     * @apiParam {int} number 手机号码 
     * @apiParam {int} gender 1男2女 
     * @apiParam {str} date 预计带看时间，例2018-11-11 
     * @apiParam {str} content 购房意向
     * @apiParam {str} token 用来获取用户id的token
     */
	public function orderadd(){
		//echo 1;exit();
		$order = model('Order');
		$post = input('post.');
		$conn = Db::connect();
		$res = $conn->table('tplay_house_source')
		->where('id',$post['house_id'])
		->where('title',$post['house_title'])
		->select();
		if (!$res) {
		 	return ['reg'=>'请输入正确的楼盘id'];
		}
		//如果是直辖市，则走if
		if (($post['province']=='北京市')||($post['province']=='天津市')||($post['province'] =='上海市')||($post['province']=='重庆市')) {
			//直辖市
			$res = $conn->table('tplay_province')
			->field(['province_id'])
			->where("name='".$post['province']."'")
			->find();
			$post['province'] = $res['province_id'];
			$post['city'] = $res['province_id'] + 100;
			if (!is_numeric($post['province'])) {
				return ['msg'=>'请输入正确的直辖市'];
			}
			//var_dump($post);exit();
			//直辖市的区
			$res = $conn->table('tplay_area')->field(['area_id'])->where("city_id='".$post['city']."'")->find();
			$post['area'] = $res['area_id'];
			if (!is_numeric($post['area'])) {
				return ['msg'=>'请输入正确的直辖市的区'];
			}
		}else{
			//省
			$res = $conn->table('tplay_province')->field(['province_id'])->where("name='".$post['province']."'")->find();
			$post['province'] = $res['province_id'];
			if (!is_numeric($post['province'])) {
				return ['msg'=>'请输入正确的省份'];
			}
			//市
			$res = $conn->table('tplay_city')->field(['city_id'])->where("name='".$post['city']."'")->find();
			$post['city'] = $res['city_id'];
			if (!is_numeric($post['city'])) {
				return ['msg'=>'请输入正确的市'];
			}
		}

		if (!$post['name']) {
			return ['msg'=>'请输入正确的姓名'];
		}
		
		$search = '/^1[34578]\d{9}$/';
		$bool = preg_match($search,$post['number']);
		//echo $bool; exit();
		if ($bool == 0) {
			return ['msg'=>'请输入正确的手机号'];
		}
		if(!(($post['gender'] == 1)||($post['gender'] == 2))){
			return ['msg'=>'请输入正确的性别'];
		}
		$post['date'] = strtotime($post['date']);
		if (!is_numeric($post['date'])) {
			return ['msg'=>'请输入正确的带看时间']; 
		}
		if (!$post['content']) {
			return ['msg'=>'请输入正确的购房意向'];
		}
		$post['is_new'] = 1;
		$user_id = Token::getCurrentTokenUserId();
		$post['user_id'] = $user_id;
		//print_r($post);exit();
		$data = [];
		$data[] = $post;
		$res = $order->saveAll($data);
		if ($res) {
			return ['msg'=>'报备成功'];
		}else {
			return ['msg'=>'报备失败'];
		}
	}
}


 ?>