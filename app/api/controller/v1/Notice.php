<?php 
namespace app\api\controller\v1;
use think\Controller;

class Notice extends Controller{
    /**
     * @api notice/find 获取首页公告标题
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  获取首页公告标题
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/notice/find
     */
	public function noticeUrl(){
		$notice = model('Notice');
		$find = $notice->field(['id','title'])->order('create_time desc')->find();
		$data = $find->getData();
		return json_encode($data);
	}
    /**
     * @api {get} notice/content 获取公告内容
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  根据传来的id，获取相应公告内容
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/notice/content
     * @apiParam {int} id 公告id
     */
	public function noticeContent($id){
		//$id = input('id');
		//echo $id;exit();
		$notice = model('Notice');
		//$id = 'id='+$id;
		$find = $notice->field(['id','title','content','create_time','update_time'])->find($id);
		$data = $find->getData();
		$data['create_time'] = date('Y-n-j G:i:s',$data['create_time']);
		$data['update_time'] = date('Y-n-j G:i:s',$data['update_time']);
		return json_encode($data);
	}
}


 ?>