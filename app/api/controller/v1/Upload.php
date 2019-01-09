<?php
// +----------------------------------------------------------------------
// | estate [ iActing ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2019 http://www.ijiandian.com All rights reserved.
// +----------------------------------------------------------------------
// | Data: 2018/12/19
// +----------------------------------------------------------------------
// | Author: iActing <758246061@qq.com>
// +----------------------------------------------------------------------

namespace app\api\controller\v1;

// 图片 统一上传接口

use app\lib\exception\ErrorMessage;
use think\Db;
use think\Session;

class Upload extends BaseController
{
    /**
     * @apiDefine  upload 上传图片
     */

    /**
     * @api {post} upload/file_img 上传图片
     * @apiGroup upload
     * @apiVersion 0.1.0
     * @apiDescription  上传图片
     * @apiParam {file} file 文件名
     */
    public function upload()
    {
        
            $files = request()->file('file');
        // foreach ($files as $key => $value) {
        //     var_dump($value);
        // }
        // exit();
        // $web_config = Db::name('webconfig')->where('web', 'web')->find();
        $data = [];
        foreach ($files as $key => $file) {
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . 'user');
           // var_dump($info);
            if ($info) {
            //写入到附件表
            $data = [];
            $data['module'] = 'user';
            $data['filename'] = $info->getFilename();//文件名
            $data['filepath'] = DS . 'uploads' . DS . 'user' . DS . $info->getSaveName();//文件路径
            $data['fileext'] = $info->getExtension();//文件后缀
            $data['filesize'] = $info->getSize();//文件大小
            $data['create_time'] = time();//时间
            $data['uploadip'] = $this->request->ip();//IP
            $data['user_id'] = Session::has('admin') ? Session::get('admin') : 0;
            //通过后台上传的文件直接审核通过
            $data['status'] = 1;
            $data['admin_id'] = $data['user_id'];
            $data['audit_time'] = time();
            $data['use'] = 'user';//用处
            $res['id'] = Db::name('attachment')->insertGetId($data);
            $res['src'] = DS . 'uploads' . DS . 'user' . DS . $info->getSaveName();
            $res['code'] = 2;
            $data[] = $res;
           // return json($res);
           echo '成功';
            }else{
                echo '失败';
            }
        }
        return json($data);
    }
}
