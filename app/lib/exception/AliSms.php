<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 17:40
 */

namespace app\lib\exception;


class AliSms extends BaseException
{
    public $statusCode = 412;
    public $msg = '非授权信息:服务器已成功处理了请求，但返回的信息可能来自另一来源~';
    public $errorCode = 41200;
}