<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/16
 * Time: 11:04
 */

namespace app\lib\exception;

//参数异常类

class ParameterException extends BaseException
{
    public $statusCode = 400;
    public $msg = '默认提示:请求参数有误~';
    public $errorCode = 40000;
}