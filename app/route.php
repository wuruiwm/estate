<?php

use think\Route;

/**
 * 后台接口
 */

Route::post('admin_api/banner/insert', 'admin/Banner/add');
Route::get('admin_api/banner/select', 'admin/Banner/getBannerAll');
Route::post('admin_api/banner/update', 'admin/Banner/updateById');
Route::get('admin_api/banner/item', 'admin/Banner/getItemById');
Route::any('admin_api/banner/remove', 'admin/Banner/delById');
Route::get('admin_api/province/list','admin/City/getProvinceList');
Route::get('admin_api/city/list','admin/City/getCityByPid');
Route::get('admin_api/area/list','admin/City/getAreaByCid');
Route::post('admin_api/house/new','admin/House/addNewHouse');
Route::get('admin_api/house/list','admin/House/getHouseList');
Route::get('admin_api/brokerage/list', 'admin/Brokerage/getBrokerageList');
Route::get('admin_api/brokerage/list_copy', 'admin/Brokerage/getList');
Route::post('admin_api/brokerage/new', 'admin/Brokerage/addNewBrokerage');
Route::post('admin_api/brokerage/update', 'admin/Brokerage/updateById');
Route::any('admin_api/brokerage/remove', 'admin/Brokerage/delById');

/**
 * 客户端接口
 */

Route::get('api/:version/banner/select', 'api/:version.Banner/getBanner');
Route::post('api/:version/register/code', 'api/:version.Register/getRandom');
Route::post('api/:version/register/mobile', 'api/:version.Register/mobileReg');
Route::post('api/:version/user/login', 'api/:version.WebToken/getWebToken');
Route::post('api/:version/password/code', 'api/:version.Register/getCode');
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
//获取创建时间最新的公告
Route::any('api/:version/notice/find', 'api/:version.Notice/noticeUrl');
//根据id获取公告内容
Route::get('api/:version/notice/content', 'api/:version.Notice/noticeContent');