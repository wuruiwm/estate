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
Route::post('admin_api/house/update','admin/House/updateNewHouse');
Route::get('admin_api/house/list','admin/House/getHouseList');
Route::get('admin_api/house/is_head','admin/House/isHead');
Route::get('admin_api/brokerage/list', 'admin/Brokerage/getBrokerageList');
Route::get('admin_api/brokerage/list_copy', 'admin/Brokerage/getList');
Route::post('admin_api/brokerage/new', 'admin/Brokerage/addNewBrokerage');
Route::post('admin_api/brokerage/update', 'admin/Brokerage/updateById');
Route::any('admin_api/brokerage/remove', 'admin/Brokerage/delById');
Route::get('admin_api/house/info', 'admin/House/getHouseById');
Route::get('admin_api/house/remove', 'admin/House/delById');
Route::get('admin_api/house/dels', 'admin/House/dels');
Route::post('admin_api/store/new','admin/Store/newStore');
Route::get('admin_api/store/code','admin/Store/createCode');
Route::get('admin_api/store/list','admin/Store/getList');
Route::get('admin_api/store/remove', 'admin/Store/delById');
Route::get('admin_api/store/item', 'admin/store/getInfoById');
Route::post('admin_api/store/update', 'admin/Store/updateById');
Route::get('admin_api/store/dels', 'admin/store/dels');
Route::get('admin_api/store/user_list', 'admin/User/getStoreUserList');


Route::get('admin_api/user/list','admin/User/getList');
Route::get('admin_api/user/remove', 'admin/User/delById');
Route::get('admin_api/user/dels', 'admin/User/dels');
Route::get('admin_api/user/remove_store_user', 'admin/User/removeStoreUserById');
Route::get('admin_api/user/remove_store_users', 'admin/User/removeStoreUserByIds');
Route::get('admin_api/user/realname', 'admin/User/getRealname');
Route::get('admin_api/user/update_realname', 'admin/User/updateRealname');



/**
 * 客户端接口
 */
Route::post('api/:version/upload/file_img', 'api/:version.Upload/upload');


Route::get('api/:version/banner/select', 'api/:version.Banner/getBanner');
Route::post('api/:version/register/code', 'api/:version.Register/getRandom');
Route::post('api/:version/register/mobile', 'api/:version.Register/mobileReg');
Route::post('api/:version/user/login', 'api/:version.WebToken/getWebToken');
Route::post('api/:version/password/code', 'api/:version.Register/getCode');
Route::post('api/:version/password/update', 'api/:version.Register/password');
Route::get('api/:version/house/list','api/:version.House/getList');
Route::get('api/:version/house/info','api/:version.House/getHouseById');
Route::get('api/:version/house/head','api/:version.House/getHouseHead');
Route::get('api/:version/user/info', 'api/:version.User/getUserById');
Route::post('api/:version/user/head_img', 'api/:version.User/updateHeadImg');
Route::post('api/:version/user/update', 'api/:version.User/updateById');
Route::get('api/:version/province/list','api/:version.City/getProvinceList');
Route::get('api/:version/city/list','api/:version.City/getCityByPid');
Route::get('api/:version/area/list','api/:version.City/getAreaByCid');
Route::post('api/:version/house/add_used','api/:version.House/addUsed');




// 修改新手机号
Route::post('api/:version/user/update_mobile', 'api/:version.User/updateMobile');
// 修改密码
Route::post('api/:version/user/update_password', 'api/:version.User/updatePassword');
//获取创建时间最新的公告
Route::get('api/:version/notice/find', 'api/:version.Notice/noticeUrl');
//根据id获取公告内容
Route::get('api/:version/notice/content', 'api/:version.Notice/noticeContent');
//报备客户信息提交
Route::any('api/:version/order/add', 'api/:version.Order/orderadd');
//我的客户里四种列表
Route::get('api/:version/order/baobei', 'api/:version.Orderlist/baobei');
//我的客户列表点进去显示内容
Route::get('api/:version/order/content', 'api/:version.Orderlist/content');
//实名认证,上传名字，手机号，身份证号，身份证照片
Route::post('api/:version/yanzheng/yanzheng', 'api/:version.Yanzheng/yanzheng');
//获取实名是否验证和审核状态
Route::any('api/:version/yanzheng/shenhe', 'api/:version.Yanzheng/shenhe');
//传参，获取楼盘信息
Route::get('api/:version/house/loupan2', 'api/:version.Loupan/loupan2');
//获取我的客户里的佣金管理
Route::post('api/:version/comm/commlist', 'api/:version.Commission/commlist');
//首页房源搜索
Route::get('api/:version/house/search', 'api/:version.Housesearch/search');
