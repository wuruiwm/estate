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
use app\lib\validate\MobileCode;
use think\Exception;
use think\facade\Cache;


//用户注册
class Register extends BaseController
{
    /**
     * @api {post} register/code 获取验证码[注册用]
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  用户注册时，输入手机号获取验证码
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/register/code
     * @apiParam {string} mobile 手机号
     */
    public function getRandom()
    {
        //1.验证手机号是否合法
        (new MobileCode())->goCheck();
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
            throw new Exception('阿里大鱼短信错误码:' . $result->Code . ' 见开发文档:https://help.aliyun.com/document_detail/55451.html?spm=a2c4g.11186623.6.572.49813be7YSDGOY');
        }
        throw new SuccessMessage();
    }

    /**
     * @api {post} register/mobile 用户注册
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  输入手机号和短信验证码进行注册
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/register/mobile
     * @apiParam {string} mobile 手机号
     * @apiParam {string} code 验证码
     * @apiParam {string} password 密码
     */
    public function mobileReg()
    {
        //1.验证
        (new MobileRegister())->goCheck();
        $mobile = input('post.mobile');
        $password = input('post.password');
        $code = input('post.code');

        //2.检测用户
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
        $password = password($password);
        $post = [
            'phone' => $mobile,
            'password' => $password,
            'nickname'=>$mobile
        ];
        $model = new User();
        $user = $model->create($post);
        if ($user === false) {
            throw new ErrorMessage([
                'msg' => '注册失败'
            ]);
        }
        // 注册成功
        throw new SuccessMessage();
    }

    // 生成4位随机验证码,并加入缓存中
    public function getRandomNumber()
    {
        $str = substr(str_shuffle(time()), 0, 4);
        \think\Cache::set('codeNumber', $str, 300);
        return $str;
    }


    /**
     * @api {post} password/code 获取验证码[找密用]
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  用户忘记密码时，输入手机号获取验证码
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/password/code
     * @apiParam {string} mobile 手机号
     */
    public function getCode($mobile = '')
    {
        (new MobileCode())->goCheck();
        $mobile = input('post.mobile');
        $result = User::where('phone', $mobile)->find();
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '该用户不存在'
            ]);
        }
        $this->getRandom();
    }

    /**
     * @api {post} password/update 重置密码
     * @apiGroup web
     * @apiVersion 0.1.0
     * @apiDescription  重新修改用户密码
     * @apiSampleRequest http://estate.dingdingmaoer.cn/api/v1/password/update
     * @apiParam {string} mobile 手机号
     * @apiParam {string} code 验证码
     * @apiParam {string} password 新密码
     * @apiParam {string} password_old 确认密码
     */
    public function password($mobile = '', $code = '', $password = '', $password_old = '')
    {
        (new MobileRegister())->goCheck();
        if ($password !== $password_old) {
            throw new ErrorMessage([
                'msg' => '新密码与确认密码不一致'
            ]);
        }
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
        $password = password($password);
        $result = User::where('phone', $mobile)
            ->update(['password' => $password]);
        if ($result >= 0) {
            throw new SuccessMessage([
                'msg' => '修改成功，请重新登录'
            ]);
        }
        throw new ErrorMessage([
            'msg' => '修改失败，请稍后重试'
        ]);

    }
}