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
     */
	public function search(){
		$search = input('get.search');
		$house = model('HouseSource');
		$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where('title','like',"%$search%")->select();
		$data = [];
		foreach ($res as $k => $v) {
			$data[] = $v->getData();
		}
		if(!$data){
			return ['reg'=>'关键词没有查到结果，建议更换关键词'];
		}
		return $data;
	}
}







 ?>