<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/1
 * Time: 17:32
 */

namespace app\lib\exception;


use think\Exception;

class BaseException extends Exception
{
    // HTTP状态码
    public $statusCode = 400;
    // 提示信息
    public $msg = '系统默认: 参数规则错误~';
    // 自定义错误码
    public $errorCode = 10000;

    /**
     * @method 构造方法,当所有异常类(子类)被实例化时,自动执行
     * @param array $params
     */
    public function __construct($params=[])
    {
        if(!is_array($params)){
            return;
        }
        if(array_key_exists('statusCode',$params)){
            $this->statusCode = $params['statusCode'];
        }
        if(array_key_exists('errorCode',$params)){
            $this->errorCode = $params['errorCode'];
        }
        if(array_key_exists('msg',$params)){
            $this->msg = $params['msg'];
        }
    }
}