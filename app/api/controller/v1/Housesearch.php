<?php 
namespace app\api\controller\v1;
use think\Controller;
class Housesearch extends Controller{
	/**
     * @api {get} House/search 首页模糊搜索
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  首页模糊搜索
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/House/search
     * @apiParam {string} search 搜索关键词  
     * @apiParam {int} city 市的ID 
     */
	public function search(){
		//获取搜索关键词
		$search = input('get.search');
		if (!$search) {
			return ['reg'=>'查询关键词不能为空'];
		}
		//获取传来的市的ID
		$city = input('get.city');
		if (!$city) {
			return ['reg'=>'查询的地区不能为空'];
		}
		//实例化model并执行查询
		$house = model('HouseSource');
		$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where('city',$city)->where('title','like',"%$search%")->select();
		$data = [];
		foreach ($res as $k => $v) {
			$data[] = $v->getData();
		}
		//判断是否有数据，没有则说明没有查到结果，返回提示信息，有结果则把数组return出去
		if(!$data){
			return ['reg'=>'关键词没有查到结果，建议更换关键词'];
		}
		return $data;
	}
}







 ?>