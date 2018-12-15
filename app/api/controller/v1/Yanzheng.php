<?php 
namespace app\api\controller\v1;
use think\Controller;
use app\api\service\Token;
use app\api\model;
class Yanzheng extends controller{
	/**
     * @api {post} yanzheng/yanzheng 实名认证
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  报备客户信息提交
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/yanzheng/yanzheg
     * @apiParam {string} card_name 姓名 
     * @apiParam {int} card_phone 手机号码 
     * @apiParam {int} card_number 身份证号
     * @apiParam {string} token 放到header里，用来获取用户id的token
     */
	public function yanzheng(){
		//获取用户id
		$id = Token::getCurrentTokenUserId();
		//正则验证身份证号
		$card_number = input('post.card_number');
		$search = '/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/';
		$bool = preg_match($search,$card_number);
		if ($bool == 0) {
			return ['msg'=>'请输入正确的身份证号'];
		}
		//姓名不能为空
		$card_name = input('post.card_name');
		if (!$card_name) {
			return ['reg'=>'请输入正确的姓名'];
		}
		//正则验证手机号
		$card_phone = input('post.card_phone');
		$search = '/^1[34578]\d{9}$/';
		$bool = preg_match($search,$card_phone);
		if ($bool == 0) {
			return ['msg'=>'请输入正确的手机号'];
		}
		//上传文件
		$file = request()->file('image');
		if ($file) {
			//将上传的文件移动到我们拼接的路径
			$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'. DS .'user_card');
			//判断移动成功没有，成功则将post提交的数据修改到数据库
			if ($info) {
				$user = model('User');
				$data = [];
				$data['id'] = $id;
				$data['card_number'] = $card_number;
				$data['card_name'] = $card_name;
				$data['card_phone'] = $card_phone;
				//返回文件路径
				$card_img = DS.'uploads'.DS.'user_card'.DS.$info->getSaveName();
				$data['card_img'] = $card_img;
				//将is_submit是否提交实名认证的字段改变为1
				$data['is_submit'] = 1;
				//修改操作
				$res = $user->isUpdate(true)->save($data);
				//返回提示信息
				if ($res) {
					return ['reg'=>'上传认证信息成功'];
				}else{
					return ['reg'=>'上传认证信息失败'];
				}
			}else{
				return ['reg'=>'身份证照片失败'];
			}
		}
	}
	/**
     * @api {post} yanzheng/shenhe 获取实名验证和审核状态
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  获取是否实名验证和审核状态
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/yanzheng/shenhe
     * @apiParam {string} token 放到header里，用来获取用户id的token
     */
	public function shenhe(){
		$id = Token::getCurrentTokenUserId();
		$user = model('User');
		$res = $user->field(['id','is_submit','is_examine'])->where('id',$id)->find();
		$data = $res->getData();
		return $data;
	}
}

 ?>