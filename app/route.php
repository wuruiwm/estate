<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------

use think\Route;

// ======================================================后台接口
Route::get('one', 'admin/Test/one');

// 首页广告
Route::post('admin_api/banner/insert', 'admin/Banner/add');
Route::get('admin_api/banner/select', 'admin/Banner/getBannerAll');
Route::post('admin_api/banner/update', 'admin/Banner/updateById');
Route::get('admin_api/banner/item', 'admin/Banner/getItemById');
Route::any('admin_api/banner/remove', 'admin/Banner/delById');

// =========================================前台接口

// 获取轮播图
Route::get('api/:version/banner/select', 'api/:version.Banner/getBanner');

// 用户有关
// 注册获取验证码
Route::post('api/:version/register/code', 'api/:version.Register/getRandom');
// 注册
Route::post('api/:version/register/mobile', 'api/:version.Register/mobileReg');
// 登录
Route::post('api/:version/user/login', 'api/:version.WebToken/getWebToken');

// 忘记密码 获取短信验证码
Route::post('api/:version/password/code', 'api/:version.Register/getCode');
// 提交重置密码
Route::post('api/:version/password/update', 'api/:version.Register/password');
// 获取用户信息
Route::get('api/:version/user/info', 'api/:version.User/getUserById');
// 修改用户信息
Route::post('api/:version/user/update', 'api/:version.User/UpdateUserById');

// 验证手机号user/verify
Route::post('api/:version/user/verify', 'api/:version.User/verifyPhone');
// 修改新手机号
Route::post('api/:version/user/update_mobile', 'api/:version.User/updateMobile');
// 修改密码
Route::post('api/:version/user/update_password', 'api/:version.User/updatePassword');
