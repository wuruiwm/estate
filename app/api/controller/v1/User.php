<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/26 0026
 * Time: 14:13
 */

namespace app\api\controller\v1;


use app\admin\model\Income;
use app\admin\model\Store;
use app\api\model\ApplyOrder;
use app\api\model\EnterPrice;
use app\api\model\Loan;
use app\api\model\User as ModelUser;
use app\api\model\UserInvite;
use app\api\model\UserRealname;
use app\api\service\Token;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddRealName;
use app\lib\validate\ChangeNickname;
use app\lib\validate\UpdateAlipay;
use app\lib\validate\UpdateWx;
use app\lib\validate\VerifyPhone;
use think\Db;


class User extends BaseController
{

    /**
     * @api {post} user/info 获取登陆者用户信息
     * @apiGroup user
     * @apiVersion 0.1.0
     * @apiDescription  根据token获取用户信息
     * @apiParam {string} token header传参
     * @apiSuccessExample {json} Success-Response:
    {
    "id": 1,
    "nickname": "17681125543", 昵称
    "phone": "17681125543", 手机号
    "head_img": "http://estate.dingdingmaoer.cn/null.jpg", 用户头像
    "level": "门店经纪人", 用户身份
    "store_id":"安徽华邦地产", 所属房产公司名称
    "area": "安徽" 主营区域
    }
     */
    public function getUserById()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = ModelUser::where('id',$user_id)->field('id,nickname,phone,head_img,level,store_id,area')->find();
        unset($result->password);
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '账号异常：请重新登录'
            ]);
        }
        return $result;
    }

    /**
     * @api {post} user/head_img 修改头像
     * @apiGroup user
     * @apiVersion 0.1.0
     * @apiDescription  根据token获取用户信息
     * @apiPermission  token header头传参
     * @apiParam {file} head_img 用户头像
     */
    public function updateHeadImg(){
        $user_id = Token::getCurrentTokenUserId();
        $head_img = request()->file('head_img');
        if(empty($head_img)){
            throw new ErrorMessage([
                'msg'=>'请上传图片'
            ]);
        }
        $head_img = $head_img->validate(['size' => 4000000, 'ext' => 'jpg,png'])->move('../public/uploads/user/');
        if ($head_img) {
            $head_img_path = 'uploads\user\\' . $head_img->getSaveName();
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }
        $result = ModelUser::where('id',$user_id)
            ->update([
                'head_img'=>$head_img_path
            ]);
        if($result){
            throw new SuccessMessage();
        }
    }
    /**
     * @api {post} user/update 修改用户信息
     * @apiGroup user
     * @apiVersion 0.1.0
     * @apiDescription  根据token获取用户信息
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/user/update
     * @apiPermission  token header头传参
     * @apiParam [nickname] 用户昵称
     * @apiParam [area] 主营地区
     * @apiParam [store_name] 门店名称
     *
     */
    public function updateById(){
        $user_id = Token::getCurrentTokenUserId();
        $model = new ModelUser();
        $post = input('post.');
        $store_name = input('post.store_name');
        if(isset($store_name)){
            $store = Store::where('name',$store_name)->find();
            if(!$store){
                throw new ErrorMessage([
                    'msg'=>'该门店未入驻平台,请先联系平台负责人'
                ]);
            }
        }
        $result = $model->allowField(true)->save($post,['id' => $user_id]);
        if($result){
            throw new SuccessMessage();
        }
    }

    // 验证手机+验证码
    public function verifyPhone()
    {
        (new VerifyPhone())->goCheck();
        $mobile = input('post.mobile');
        $code = input('post.code');
        if ($mobile !== \think\Cache::get('mobile') || $code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }
        throw new SuccessMessage();
    }



}
