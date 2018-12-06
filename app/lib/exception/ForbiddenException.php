<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/11
 * Time: 11:30
 */

namespace app\lib\exception;


class ForbiddenException extends BaseException
{
    public $statusCode = 403;
    public $msg = '未经授权:访问由于凭据无效被拒绝!';
    public $errorCode = 40301;
}