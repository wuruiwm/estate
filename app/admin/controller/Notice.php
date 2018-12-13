<?php 
namespace app\admin\controller;
use think\Controller;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddNotice;
class Notice extends Permissions{
	//列表
	public function noticeList(){
		$notice = model('Notice');
		//$res = $notice->select();
		// $data = [];
		// foreach ($res as $v) {
		// 	$data[] = $v->getData();
		// }
		//var_dump($data);	
		//分页，并且获取所有的行数据，并且按照id倒序排列,放到一个二维数组里，并且每页是10个,
		$list = $notice->order('id desc')->paginate(10);
		//获取分页代码
		$page = $list->render();
		$this->assign('list',$list);
		$this->assign('page',$page);
		//$this->assign('data',$data);
		return $this->fetch();
	}
	//添加
	public function noticeAdd(){
		//获取post传参
		$post = input('post.');
		//echo $post['title'],$post['content'];
		//exit();
		//判断post传参是否为空，为空则说明没有添加数据过来，直接输出模板
		if (empty($post)) {
			return $this->fetch();
		}
		//判断标题和内容是否为空，为空则输出提示信息，并且exit
		$notice = model('Notice');
		if (empty($post['title'])) {
			echo '标题不能为空';
			exit();
		}
		if (empty($post['content'])) {
			echo '内容不能为空';
			exit();
		}
		//(new AddNotice())->goCheck();
		//将post传参赋值给model实例化对象，然后调用save方法，插到数据库
		$notice->title = $post['title'];
		$notice->content = $post['content'];
		$notice->create_time = time();
		$res = $notice->save();
		if ($res) {
			echo "添加公告成功";
		}
		// if ($res) {
		// 	throw new SuccessMessage(['msg'=>'添加公告成功']);
		// }
	}
	//编辑
	public function noticeEdit(){
		//获取传来的id
		$id = input('id');
		//判断post是否为空，如果不为空，说明有数据提交，则获取数据，并且判断传来的标题和内容是否为空，如果为空，则输出提示信息，并且exit
		if (!empty($_POST)) {
			$notice = model('Notice');
			$data = input('post.');
			if (empty($data['title'])) {
			echo '标题不能为空';
			exit();
			}
			if (empty($data['content'])) {
			echo '内容不能为空';
			exit();
			}
			//执行修改操作，并返回提示信息
			$res = $notice->isUpdate(true)->save($data);
			if ($res) {
				echo '修改成功';
			}
		}else {
			//如果为空，说明没有提交数据，则根据id查出一行数据，然后assign，再输出到模板
		if (!(is_numeric($id))) {
			return "公告id不合法";
		}
		//echo $id;exit();
		$notice = model('Notice');
		$res = $notice->find($id);
		//print_r($res->getData());
		$data = $res->getData();
		//print_r($data);exit();
		$this->assign('data',$data);
		return $this->fetch();
		}
	}
	//删除
	public function noticeDel(){
		//获取传来的id，并且赋值给实例化对象，然后调用删除操作
		$notice = model('Notice');
		$id = input('id');
		//echo $id;exit();
		if (!is_numeric($id)) {
			echo "id不合法";
			exit();
		}
		$notice->id = $id;
		$res = $notice->delete();
		if ($res) { 
            echo '删除成功';
		}else { 
			echo '删除失败';
		}
	}
}



 ?>