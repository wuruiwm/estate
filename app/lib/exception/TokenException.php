<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/7
 * Time: 12:07
 */

namespace app\lib\exception;


class TokenException extends BaseException
{
    public $statusCode = 403;
    public $msg = '身份验证异常：Token无效或已过期~';
    public $errorCode = 40300;
}