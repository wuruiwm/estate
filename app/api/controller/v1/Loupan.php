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
     * @apiParam {int} province 传省的ID
     * @apiParam {int} city 传市的ID
     * @apiParam {int} area 传县的ID
     */
	public function loupan2($province='',$city='',$area=''){
		if (!(is_numeric($province)&&is_numeric($city)&&is_numeric($area))) {
			return ['reg'=>'请输入正确的省,市,区县ID'];
		}
		// $area_model = model('Area');
		// $area_res = $area_model->where('_id',$area)->find()->getData();
		// if ($area_res['name'] == '市辖区') {
		// 	$house = model('HouseSource');
		// 	$res = $house->field(['id','title'])->where('province',$province)->where('city',$city)->select();
		// 	$data = [];
		// 	foreach ($res as $k => $v) {
		// 		$data[] = $v->getData();
		// 	}
		// 	if (!$data) {
		// 		return ['reg'=>'暂无房源信息'];
		// 	}else {
		// 		return $data;
		// 	}
		// }else{
			$house = model('HouseSource');
			$res = $house->field(['id','title'])->where('province',$province)->where('city',$city)->where('area',$area)->select();
			$data = [];
			foreach ($res as $k => $v) {
				$data[] = $v->getData();
			}
			if (!$data) {
				return ['reg'=>'暂无房源信息'];
			}else {
				return $data;
			}
	  	// }
	}
}



 ?>




