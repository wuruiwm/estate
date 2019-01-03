<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/23 0023
 * Time: 15:26
 */

return [
    // 默认输出类型
    'default_return_type'    => 'json',
    // 数据集返回类型
    'resultset_type'  => 'collecton',

    //md5 密码盐 token盐
    'md5'=>[
        'password_salt' => 't$lErGine^rtFeg',
        'token_salt' => 'fkGrL4*f#fPyi!'
    ],

    // 缓存
    'cache' => [
        'token_expire'=>7200 //2小时
    ],

];
