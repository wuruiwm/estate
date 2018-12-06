<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/6
 * Time: 20:59
 */

namespace app\lib\exception;




class WeChatException extends BaseException
{
    public $statusCode = 400;
    public $msg = '微信小程序登录授权API接口连接失败!';
    public $errorCode = 999;
}