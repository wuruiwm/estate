<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/1
 * Time: 17:28
 */

namespace app\lib\exception;

use think\exception\Handle;
use Exception;
use think\facade\Config;
use think\facade\Log;
use think\facade\Request;


// 继承thinkphp自带异常类
class ExceptionHandler extends Handle
{
    private $statusCode;    // http状态码
    private $msg;       // 异常错误
    private $errorCode;     // 错误码
                            // 当前请求的URL路径

    // 重写父类方法
    public function render(\Exception $e)
    {
        // 如果是自定义异常
        if($e instanceof BaseException){
            $this->statusCode = $e->statusCode;
            $this->msg = $e->msg;
            $this->errorCode = $e->errorCode;
            // 不记录日志
            \think\Log::close();
        // 否则是服务器异常
        }else{
            // 如果开发模式,则默认为TP页面异常信息，助于开发者调试,不需要记录日志

            if(\think\Config::get('app_debug')){
                \think\Log::close();
                return parent::render($e);// 调用父类(tp自带的异常处理机制)
            // 否则线上模式,记录具体错误信息,编译排查错误
            }else{
                $this->statusCode = 500;
                $this->msg = '未知错误:服务器无法处理该请求';
                $this->errorCode = 999;
                // 记录日志
                $this->recordErrorLog($e);
            }
        }

        // 统一返回信息给客户端
        $request = \think\Request::instance();
        $result = [
            'errorCode'     => $this->errorCode,
            'msg'       => $this->msg,
            'requestUrl'    => $request->url(true),
        ];
        // 参数讲解：json('数组/字符串',http状态码)
        return json($result,$this->statusCode);
    }


    /**
     * @method 记录日志 并接错误信息
     * @param Exception $e
     */
    private function recordErrorLog(\Exception $e){
        //写入日志 设置级别
        \think\Log::record('[1]内部错误：'.$e->getMessage(),'error');
        \think\Log::record('[2]文件地址：'.$e->getFile(),'error');
        \think\Log::record('[3]错误行号：'.$e->getLine(),'error');
    }
}