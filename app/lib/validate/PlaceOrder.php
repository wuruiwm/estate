<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/10/11
 * Time: 16:27
 */

namespace app\lib\validate;


use app\lib\exception\ParameterException;

class PlaceOrder extends BaseValidate
{
    protected $rule = [
        'products' => 'checkProducts'
    ];

    //下单的数据格式二维数组 参考
    /*
    protected $data_order = [
        ['product_id'=>'1','count'=>1],
        ['product_id'=>'2','count'=>2],
        ['product_id'=>'3','count'=>3],
    ];
    */

    // 自定义验证下单商品
    protected function checkProducts($values){
        // 校验是否是一个数组
        if(!is_array($values)){
            throw new ParameterException([
                'msg' => 'products参数格式不正确!'
            ]);
        }
        // 校验是否为空值
        if(empty($values)){
            throw new ParameterException([
                'msg' => 'products参数不能为空!'
            ]);
        }
        // 校验数组下的每一个单元项
        foreach($values as $key=>$value){
            $this->check_item($value);
        }
        return true;
    }

    // 独立验证规则 [商品id,购买数量,...]
    protected $singleRule = [
        'product_id' => 'require|isPositiveInteger',
        'count' => 'require|isPositiveInteger'
    ];

    // 独立验证 每一个子单元项
    protected function check_item($value){
        $validate = new BaseValidate($this->singleRule);
        $result = $validate->check($value);
        if(!$result){
            throw new ParameterException([
                'msg' => 'products参数规则错误!'
            ]);
        }
    }
}