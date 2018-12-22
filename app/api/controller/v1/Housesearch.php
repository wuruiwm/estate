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
     * @apiParam {int} floor_area_min 面积最小值
     * @apiParam {int} floor_area_max 面积最大值
     * @apiParam {int} init_status 房屋类型  1新房 2二手房 
     */
	public function search(){
		//获取搜索关键词
		$search = input('get.search');
		if (!$search) {
			return ['reg'=>'查询关键词不能为空'];
		}
		$str = '1';
		//获取传来的市的ID,拼接成where语句
		$city = input('get.city');
		if ($city) {
			$str = $str . " and city=" . $city;
		}else{
			return ['reg'=>'查询的地区不能为空'];
		}
		//获取传来的房屋类型
		$init_status = input('get.init_status');
		if (($init_status==1)||($init_status==2)) {
			$str = $str . " and init_status=" . $init_status;
		}
		$floor_area_min = input('get.floor_area_min');
		$floor_area_max = input('get.floor_area_max');
		if ((($floor_area_min==='0')||(!empty($floor_area_min)))&&(($floor_area_max==='0')||(!empty($floor_area_max)))) {
				//实例化model并执行查询
				//先执行进行标题查询
				$house = model('HouseSource');
				$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where($str)->where('floor_area','between',[$floor_area_min,$floor_area_max])->where('title','like',"%$search%")->select();
				$data1 = [];
				foreach ($res as $k => $v) {
					$data1[] = $v->getData();
				}
				//再执行地址查询
				$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where($str,$city)->where('floor_area','between',[$floor_area_min,$floor_area_max])->where('house_address','like',"%$search%")->select();
				$data2 = [];
				foreach ($res as $k => $v) {
					$data2[] = $v->getData();
				}
				//合并两个查询结果
				$data3 = array_merge($data1,$data2);
				//判断是否有数据，没有则说明没有查到结果，返回提示信息，有结果则把数组return出去
				if(!$data3){
					return ['reg'=>'关键词没有查到结果，建议更换关键词'];
				}
				return $data3;
		}
		//实例化model并执行查询
		//先执行进行标题查询
		$house = model('HouseSource');
		$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where($str)->where('title','like',"%$search%")->select();
		$data1 = [];
		foreach ($res as $k => $v) {
			$data1[] = $v->getData();
		}
		//再执行地址查询
		$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status'])->where($str,$city)->where('house_address','like',"%$search%")->select();
		$data2 = [];
		foreach ($res as $k => $v) {
			$data2[] = $v->getData();
		}
		//合并两个查询结果
		$data3 = array_merge($data1,$data2);
		//判断是否有数据，没有则说明没有查到结果，返回提示信息，有结果则把数组return出去
		if(!$data3){
			return ['reg'=>'关键词没有查到结果，建议更换关键词'];
		}
		return $data3;
	}
}







 ?>