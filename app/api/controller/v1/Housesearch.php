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
     * @apiParam {string} search 房源名称
     * @apiParam {string} address 地址
     * @apiParam {int} area 区县的ID 
     * @apiParam {int} floor_area_min 面积最小值
     * @apiParam {int} floor_area_max 面积最大值
     * @apiParam {int} init_status 房屋类型  1新房 2二手房
     */
	public function search(){
		//获取搜索关键词
		$search = input('get.search');
		$address = input('get.address');
		$str = '1';
		//获取传来的市的ID,拼接成where语句
		$area = input('get.area');
		if ($area) {
			$str = $str . " and area=" . $area;
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
		//判断是否有面积参数传入，如果没有则不查面积范围，如果有则查询
		if ((($floor_area_min==='0')||(!empty($floor_area_min)))&&(($floor_area_max==='0')||(!empty($floor_area_max)))) {
				//实例化model并执行查询
				//先执行进行标题查询
				$house = model('HouseSource');
				$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status','brokerage_plan','cover_img'])->where($str)->where('floor_area','between',"$floor_area_min,$floor_area_max")->where('title','like',"%$search%")->where('house_address','like',"%$address%")->select();
				$data = [];
				foreach ($res as $k => $v) {
					//判断房源类型，如果是新房，则查出佣金
					if ($init_status == 1) {
						$a = $v->getData()['brokerage_plan'];
						$arr = explode(',',$a);
						$brokerage =  model('Brokerage');
						$brok_res = $brokerage->field(['price'])->where('id',$arr['0'])->find();
						$brok_price=$brok_res->getData()['price'];
						$array = $v->getData();
						$array['price'] = $brok_price;
						//如果是新房，数出佣金方案数，传给前端
						$array['brokerage_plan'] = count($arr);
					}else{
						$array = $v->getData();
					}
					//根据cover_img的id值，去attachment表中查出图片路径，赋值到数组里
						$attachment = model('attachment');
						$atta_res = $attachment->where('id',$array['cover_img'])->find();
						//判断是否有返回值，因为一些原因，从房源表取出来的图片id，在图片表中可能查不到，就会报错，所以要先判断一下
						if ($atta_res) {
							$atta_res = $atta_res->getData()['filepath'];
							$array['img_id'] = $array['cover_img'];
							$array['cover_img'] = http_type().$atta_res;
							$array['decoration_type'] = explode(',',$array['decoration_type']);
						}else{
							$array['img_id'] = $array['cover_img'];
							$array['cover_img'] = '该房源暂无图片';
							$array['decoration_type'] = explode(',',$array['decoration_type']);
						}
						//将房屋类型字段，处理成字符串，方便前端调用
						if ($array['init_status'] == 1) {
							$array['init_status'] = '新房';
						}else if($array['init_status'] == 2){
							$array['init_status'] = '二手房';
						}
						$data[] = $array;
				}
				//判断是否有数据，没有则说明没有查到结果，返回提示信息，有结果则把数组return出去
				if(!$data){
					return ['reg'=>'暂无符合搜索条件房源信息!'];
				}
				return $data;
		}
		//实例化model并执行查询
		//先执行进行标题查询
		$house = model('HouseSource');
		$res = $house->field(['id','title','house_price','house_address','decoration_type','init_status','brokerage_plan','cover_img'])->where($str)->where('title','like',"%$search%")->where('house_address','like',"%$address%")->select();
		$data = [];
		foreach ($res as $k => $v) {
			//判断房源类型，如果是新房，则查出佣金
			if ($init_status == 1) {
				//取出佣金方案的字段，多个方案用逗号隔开
				$a = $v->getData()['brokerage_plan'];
				//用explode分割成数组
				$arr = explode(',',$a);
				//实例化佣金方案的表，然后查出楼盘表佣金方案的第一个方案的佣金
				$brokerage =  model('Brokerage');
				$brok_res = $brokerage->field(['price'])->where('id',$arr['0'])->find();
				//查出佣金，将佣金价格放入数组
				$brok_price=$brok_res->getData()['price'];
				$array = $v->getData();
				$array['price'] = $brok_price;
				//如果是新房，数出佣金方案数，传给前端
				$array['brokerage_plan'] = count($arr);
			}else{
				$array = $v->getData();
			}
			//根据cover_img的id值，去attachment表中查出图片路径，赋值到数组里
			$attachment = model('attachment');
			$atta_res = $attachment->where('id',$array['cover_img'])->find()->getData()['filepath'];
			$array['img_id'] = $array['cover_img'];
			//$ex = explode('\\',$atta_res);
			//$atta_res = implode('/', $ex);
			$array['decoration_type'] = explode(',',$array['decoration_type']);
			$array['cover_img'] = http_type().$atta_res;
			//将房屋类型字段，处理成字符串，方便前端调用
			if ($array['init_status'] == 1) {
				$array['init_status'] = '新房';
			}else if($array['init_status'] == 2){
				$array['init_status'] = '二手房';
			}
			$data[] = $array;
		}
		//判断是否有数据，没有则说明没有查到结果，返回提示信息，有结果则把数组return出去
		if(!$data){
			return ['reg'=>'暂无符合搜索条件房源信息!'];
		}
		return $data;
	}
}







 ?>