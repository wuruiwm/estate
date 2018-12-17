<?php 
namespace app\api\controller\v1;
use think\Controller;
use think\Db;
class Loupan extends controller{
	/**
     * @api {get} house/loupan 获取所有楼盘信息，不需要传参
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  获取所有楼盘信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/loupan
     */
	public function loupan(){
		//查出所有楼盘信息
		$house =  model('HouseSource');
		$res = $house->field(['id','title','province','city'])->select();
		foreach ($res as $v) {
			$data[] = $v->getData();
		}
		//然后根据省的id和市的id查出名字，然后再赋值回去
		foreach ($data as $k => $v) {
			$conn = Db::connect();
			//省
			$res = $conn->table('tplay_province')->field(['name'])->where('province_id='.$v['province'])->find();
			$data[$k]['province'] = $res['name'];
			//市
            $res = $conn->table('tplay_city')->field(['name'])->where('city_id='.$v['city'])->find();
			$data[$k]['city'] = $res['name'];
		}
		return $data;
	}
	/**
     * @api {get} house/loupan2 获取所有楼盘信息，传省和市
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  获取所有楼盘信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/house/loupan2
     * @apiParam {int} province 传省的名字 例如 安徽省
     * @apiParam {int} city 传市的名字 例如 蚌埠市
     */
	public function loupan2($province='',$city=''){
		$conn = Db::connect();
		$province = $conn->table('tplay_province')->field(['province_id'])->where("name='"."$province"."'")->find()['province_id'];
		$city = $conn->table('tplay_city')->field(['city_id'])->where("name='"."$city"."'")->find()['city_id'];
		$house =  model('HouseSource');
		$res = $house->field(['id','title'])->where('province',$province)->where('city',$city)->select();
		foreach ($res as $k => $v) {
			$data[] = $v->getData(); 
		}
		return $data;
	}
}



 ?>