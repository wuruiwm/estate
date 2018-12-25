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
use app\api\service\IdCardAudit;
use app\api\service\Token;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddRealName;
use app\lib\validate\ChangeNickname;
use app\lib\validate\IDCard;
use app\lib\validate\UpdateAlipay;
use app\lib\validate\UpdateWx;
use app\lib\validate\VerifyPhone;
use think\Db;
use think\exception\ErrorException;

class User extends BaseController
{

    /**
     * @api {get} user/info 获取登陆者用户信息
     * @apiGroup user
     * @apiVersion 0.1.0
     * @apiDescription  根据token获取用户信息
     * @apiParam {string} token header传参
     * @apiSuccessExample {json} Success-Response:
     * {
     * "id": 1,
     * "nickname": "17681125543", 昵称
     * "phone": "17681125543", 手机号
     * "head_img": "http://estate.dingdingmaoer.cn/null.jpg", 用户头像
     * "level": "门店经纪人", 用户身份
     * "store_id":"安徽华邦地产", 所属房产公司名称
     * "area": "安徽" 主营区域
     * }
     */
    public function getUserById()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = ModelUser::where('id', $user_id)->field('id,nickname,phone,head_img,level,store_id,area')->find();
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
    public function updateHeadImg()
    {
        $user_id = Token::getCurrentTokenUserId();
        $head_img = request()->file('head_img');
        if (empty($head_img)) {
            throw new ErrorMessage([
                'msg' => '请上传图片'
            ]);
        }
        $head_img = $head_img->validate(['size' => 4000000, 'ext' => 'jpg,png,jpeg'])->move('../public/uploads/user/');
        if ($head_img) {
            $head_img_path = 'uploads\user\\' . $head_img->getSaveName();
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }
        $result = ModelUser::where('id', $user_id)
            ->update([
                'head_img' => $head_img_path
            ]);
        if ($result) {
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
    public function updateById()
    {
        $user_id = Token::getCurrentTokenUserId();
        $model = new ModelUser();
        $post = input('post.');
        $store_name = input('post.store_name');
        if (isset($store_name)) {
            $store = Store::where('name', $store_name)->find();
            if (!$store) {
                throw new ErrorMessage([
                    'msg' => '该门店未入驻平台,请先联系平台负责人'
                ]);
            } else {
                //return $store['id']; //1
                $result = $model->allowField(true)->save([
                    'store_id' => $store['id']
                ], ['id' => $user_id]);
                if ($result) {
                    throw new SuccessMessage();
                }
            }
        }

        $result = $model->allowField(true)->save($post, ['id' => $user_id]);
        if ($result) {
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

    // 身份证实名认证
    public function idCardAudit($id_card = '', $name = '')
    {
        $user_id = Token::getCurrentTokenUserId();
        (new \app\lib\validate\IdCardAudit())->goCheck();
        /*
         * 不匹配返回
        {
            "showapi_res_error": "",
            "showapi_res_id": "f464d0e14203497bae8a2cc8f68146e5",
            "showapi_res_code": 0,
            "showapi_res_body": {
                    "ret_code": 0,
                "code": 0,
                "msg": "匹配",
                "birthday": "1993-12-11",
                "sex": "M",
                "address": "重庆市彭水苗族土家族自治县"
            }
        }
        不匹配返回
        {
            "showapi_res_error": "",
            "showapi_res_id": "8a9637aa628645b58645829704d559ef",
            "showapi_res_code": 0,
            "showapi_res_body": {
                "ret_code": 0,
                "code": 1,
                "msg": "身份证与姓名不匹配"
            }
        }y
        */
        $userInfo = IdCardAudit::Audit($id_card, $name);
        if (!is_array($userInfo) || empty($userInfo)) {
            throw new ErrorException();
        }
        $showapi_res_body = $userInfo['showapi_res_body'];
        if($showapi_res_body['code']==1){
            throw new ErrorMessage([
                'msg'=>'认证失败,姓名与身份证号不匹配'
            ]);
        }else if($showapi_res_body['code']==0){
            // 把数据存储数据库
            $userData['card_name'] = $name;
            $userData['card_number'] = $id_card;
            $userData['is_realname']=1;
            $result = ModelUser::where('id', $user_id)
                ->update($userData);
            if($result){
                throw new ErrorMessage([
                    'msg'=>'恭喜,认证成功'
                ]);
            }
        }
    }


}
