<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/25
 * Time: 12:56
 */

namespace app\api\controller\v1;


use app\api\model\Code;
use app\api\model\User;
use app\api\model\UserAscend;
use app\api\model\UserInvite;
use app\api\service\SendSms;
use app\lib\exception\ErrorMessage;
use app\lib\exception\RegisterException;
use app\lib\exception\SuccessMessage;
use app\lib\validate\MobileRegister;
use app\lib\validate\ModileCode;
use app\lib\validate\PasswordCode;
use think\Exception;
use think\facade\Cache;


//用户注册
class Register extends BaseController
{
    //手机号注册 发送验证码
    public function getRandom()
    {
        //1.验证手机号是否合法
        (new ModileCode())->goCheck();
        //2.获取客户端传来的手机号
        $mobile = input('post.mobile');
        //3.生成随机验证码
        $random = $this->getRandomNumber();
        //4.把随机验证码 发送给用户 并把验证码返回给客户端
        $result = SendSms::sendSms($mobile, $random);
        // 把手机号加入缓存 注册时进行校验（注册号与获取短信码是否同一号码）
        \think\Cache::set('mobile', $mobile, 300);

        // 阿里大鱼短信异常
        if ($result->Code !== "OK") {
            //return '大鱼短信错误信息：'. $result->Code;
            //throw new Exception();
//            if($result->Code == 'isv.BUSINESS_LIMIT_CONTROL'){
//
//            }
//            throw new ErrorMessage([
//                'msg'=>'发送失败'
//            ]);
            throw new Exception('阿里大鱼短信错误码:' . $result->Code . ' 见开发文档:https://help.aliyun.com/document_detail/55451.html?spm=a2c4g.11186623.6.572.49813be7YSDGOY');

        }

        throw new SuccessMessage();
        //return json_encode($result);

    }

    /**
     * 执行注册功能
     * 参数1：手机号,参数2：验证码
     */
    public function mobileReg()
    {
        //1.校验手机号是否正确输入
        (new MobileRegister())->goCheck();
        $mobile = input('post.mobile');
        $password = input('post.password');
        $invite_code = input('post.user_id');//推荐人code码
        $code = input('post.code');
        // 推荐人存在
        if ($invite_code !== 'null') {
            $invite_code = Code::where('code', $invite_code)->column('code');
            if (empty($invite_code)) {
                throw new ErrorMessage([
                    'msg' => '请重新获取注册地址'
                ]);
            }
            $recommend_id = base64_decode($invite_code[0]);
            $str = explode('A', $recommend_id);
            $superior_id = $str[0];// 邀请人的user_id
        } else {
            $superior_id = 0;
        }

        //2. 检测是否已经注册
        $result = User::where('phone', $mobile)->find();
        if ($result) {
            throw new ErrorMessage([
                'msg' => '手机号已经被注册'
            ]);
        }

        //3.校验输入手机号是否与缓存的手机号 一致 以及短信验证码是否正确
        if ($mobile !== \think\Cache::get('mobile') || $code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }

        //4.密码再次加密
        $password = password($password);
        $post = [
            'phone' => $mobile,
            'password' => $password,
            'superior_id' => $superior_id,
            'nickname'=>$mobile
        ];


        // 1.添加用户表信息
        $model_A = new User();
        $model_A->startTrans();// 开启事务
        $user = $model_A->create($post);
        if ($user === false) {
            $model_A->rollback();// 回滚事务A
            throw new ErrorMessage([
                'msg' => '注册失败'
            ]);
        }


        // 2.添加邀请表的信息
        $model_B = new UserInvite();
        $invite = $model_B->create([
            'source_user_id' => $superior_id,// 邀请人 1
            'target_user_id' => $user->id //被邀请人 2
        ]);

        if ($invite === false) {
            $model_A->rollback();// 回滚事务A
            $model_B->rollback();// 回滚事务B
            throw new ErrorMessage([
                'msg' => '注册失败'
            ]);
        }

        // 3.准备 添加用户祖先表的信息 1 2
        $ascend = UserAscend::where('user_id', $superior_id)->column('ascend');
        if (empty($ascend)) {
            $ascend_data = [
                'user_id' => $user->id,
                'ascend' => '0',
            ];
        } else {
            $ascend_data = [
                'user_id' => $user->id,
                'ascend' => $superior_id . ',' . $ascend[0],
            ];
        }
        // 4.开始添加祖先表
        $model_C = new UserAscend();
        $ascend = $model_C->create($ascend_data);
        if ($ascend === false) {
            $model_A->rollback();// 回滚事务A
            $model_B->rollback();// 回滚事务B
            $model_C->rollback();// 回滚事务C
            throw new ErrorMessage([
                'msg' => '注册失败'
            ]);
        }
        // 提交事务
        $model_C->commit();
        $model_B->commit();
        $model_A->commit();
        // 注册成功
        throw new SuccessMessage();
    }

    //生成4位随机验证码,并加入缓存中
    public function getRandomNumber()
    {
        $str = substr(str_shuffle(time()), 0, 4);
        \think\Cache::set('codeNumber', $str, 300);
        return $str;
    }


    // 忘记密码 获取验证码
    public function getCode($mobile = '')
    {
        (new PasswordCode())->goCheck();
        $mobile = input('post.mobile');
        //2. 检测是否已经注册
        $result = User::where('phone', $mobile)->find();
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '该用户不存在'
            ]);
        }
        $random = $this->getRandomNumber();
        $result = SendSms::sendSms($mobile, $random);
        \think\Cache::set('mobile', $mobile, 300);
        if ($result->Code !== "OK") {
            throw new Exception('阿里大鱼短信错误码:' . $result->Code . ' 见开发文档:https://help.aliyun.com/document_detail/55451.html?spm=a2c4g.11186623.6.572.49813be7YSDGOY');

        }
        throw new SuccessMessage();
    }

    // 忘记密码
    public function password($mobile = '', $code = '', $password = '', $password_old = '')
    {
        (new MobileRegister())->goCheck();
        if ($password !== $password_old) {
            throw new ErrorMessage([
                'msg' => '新密码与确认密码不一致'
            ]);
        }
        //2. 检测是否已经注册
        $result = User::where('phone', $mobile)->find();
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '该用户不存在'
            ]);
        }
        // 检测验证码与手机号是否匹配
        if ($mobile !== \think\Cache::get('mobile') || $code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }
        // 修改操作
        // 密码加密计算
        $password = password($password);
        $result = User::where('phone', $mobile)
            ->update(['password' => $password]);
        if ($result >= 0) {
            throw new SuccessMessage([
                'msg' => '修改成功，请登录'
            ]);
        }
        throw new ErrorMessage([
            'msg' => '修改失败，请稍后重试'
        ]);

    }
}