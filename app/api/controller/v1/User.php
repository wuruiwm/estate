<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/26 0026
 * Time: 14:13
 */

namespace app\api\controller\v1;


use app\admin\model\Attachment;
use app\admin\model\Income;
use app\api\model\ApplyOrder;
use app\api\model\EnterPrice;
use app\api\model\Loan;
use app\api\model\UserInvite;
use app\api\model\UserRealname;
use app\api\service\Token;
use app\api\model\User as ModelUser;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddRealName;
use app\lib\validate\ChangeNickname;
use app\lib\validate\ChangePassword;
use app\lib\validate\ModileCode;
use app\lib\validate\UpdateAlipay;
use app\lib\validate\UpdateWx;
use app\lib\validate\VerifyPhone;
use think\Db;


class User extends BaseController
{

    //根据当前登录者获取用户信息
    public function getUserById()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = ModelUser::get($user_id);
        unset($result->password);
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '账号异常：请重新登录'
            ]);
        }
        $result->mobile = $result->phone;
        $result->phone = hide_phone($result->phone);
        if ($result->superior_id == 0) {
            $result->superior_id = '平台';
        } else {
            $result->superior_id = \app\api\model\User::where('id', $result->superior_id)->column('nickname')[0];
        }
        return $result;
    }

    // 修改昵称
    public function UpdateUserById()
    {
        (new ChangeNickname())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        $post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update($post);
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

    // 修改手机号
    public function updateMobile()
    {
        (new ModileCode())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'phone' => input('post.mobile')
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 设置支付宝
    public function UpdateUserAlipay()
    {
        (new UpdateAlipay())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'alipay_name' => input('post.alipay_name'),
                'alipay_no' => input('post.alipay_no')
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 设置微信
    public function UpdateUserWx()
    {
        (new UpdateWx())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'wx_no' => input('post.wx_no'),
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 修改密码
    public function updatePassword()
    {
        $user_id = Token::getCurrentTokenUserId();
        $code = input('post.code');
        if ($code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }
        (new ChangePassword())->goCheck();
        $password = input('post.password');
        $password = password($password);
        $result = ModelUser::where('id', $user_id)
            ->update([
                'password' => $password
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }


    // 实名
    public function realname()
    {
        //return input('post.mobile');
        $user_id = Token::getCurrentTokenUserId();
        (new AddRealName())->goCheck();
        // 正面
        $file_1 = request()->file('img_1');
        if (empty($file_1)) {
            throw new ErrorMessage([
                'msg' => '请上传正面照'
            ]);
        }

        // 反面
        $file_2 = request()->file('img_2');
        if (empty($file_2)) {
            throw new ErrorMessage([
                'msg' => '请上传反面照'
            ]);
        }

        // 获取正面
        $info_1 = $file_1->validate(['size' => 4000000, 'ext' => 'jpg,png'])->move('../public/uploads/user/');
        if ($info_1) {
            //uploads\user\20181106\615fac65bc552aaa692cfc36d2c6ab82.jpg
            $img_1_path = 'uploads\user\\' . $info_1->getSaveName();
            // return $img_1_path;
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }

        // 获取反面
        $info_2 = $file_2->validate(['size' => 4000000, 'ext' => 'jpg,png'])->move('../public/uploads/user/');
        if ($info_2) {
            //uploads\user\20181106\615fac65bc552aaa692cfc36d2c6ab82.jpg
            $img_2_path = 'uploads\user\\' . $info_2->getSaveName();
            //return $img_2_path;
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }

        $data = [
            'name' => input('post.name'),
            'card_no' => input('post.card_no'),
            'mobile' => input('post.mobile'),
            'img_1' => $img_1_path,
            'img_2' => $img_2_path,
            'user_id' => $user_id
        ];
        $realModel = new UserRealname();
        $real = $realModel->where('user_id', $user_id)->find();
        if (!$real) {// 新增
            $result = $realModel->create($data);
            if ($result) {
                throw new SuccessMessage();
            }
        }// 修改
        else {
            $data['status'] = 0;
            $result = $realModel->where('user_id', $user_id)->update($data);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new ErrorMessage([
            'msg' => '提交失败'
        ]);
    }

    public function item()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = UserRealname::where('user_id', $user_id)
            ->find();
        $result['img_1'] = http_type() . '\\' . $result['img_1'];
        $result['img_2'] = http_type() . '\\' . $result['img_2'];
        return $result;
    }



}