<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/7/28
 * Time: 16:52
 */

namespace app\lib\exception;


class NullException extends BaseException
{
    public $statusCode = 404;
    public $msg = '请求失败:请求所希望得到的资源未被在服务器上发现~';
    public $errorCode = 40400;
}