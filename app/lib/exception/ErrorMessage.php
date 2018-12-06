<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/25 0025
 * Time: 18:03
 */

namespace app\lib\exception;


class ErrorMessage extends BaseException
{
    public $code = 400;
    public $msg = '服务错误：统一400错误！';
    public $errorCode = 40000;
}