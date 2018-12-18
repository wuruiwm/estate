<?php 
namespace app\api\controller\v1;
use think\Controller;
use think\Db;
class Loupan extends controller{
	/**
     * @api {get} house/loupan2 获取所有楼盘信息，传省和市
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  获取所有楼盘信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/loupan2
     * @apiParam {string} province 传省的名字 例如 安徽省
     * @apiParam {string} city 传市的名字 例如 蚌埠市 
     */
	public function loupan2($province='',$city=''){
		$conn = Db::connect();
		//将传来的名字查出对应的id，然后根据id，放到表里查询出数据传给前端
		$province = $conn->table('tplay_province')->field(['province_id'])->where("name='"."$province"."'")->find()['province_id'];
		if (!is_numeric($province)) {
			return ['reg'=>'请输入正确的省份'];
		}
		$city = $conn->table('tplay_city')->field(['city_id'])->where("name='"."$city"."'")->find()['city_id'];
		if (!is_numeric($city)) {
			return ['reg'=>'请输入正确的市'];
		}
		$house =  model('HouseSource');
		$res = $house->field(['id','title'])->where('init_status','2')->where('province',$province)->where('city',$city)->select();
		$num = count($res);
		if ($num == 0) {
			return ['reg'=>'查询结果为空'];
		}
		foreach ($res as $k => $v) {
			$data[] = $v->getData(); 
		}
		return $data;
	}
}



 ?>