<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/9
 * Time: 16:00
 */

namespace app\lib\exception;


class SuccessMessage extends BaseException
{
    public $statusCode = 201;
    public $msg = 'ok';
    public $errorCode = 20100;
}