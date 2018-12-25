<?php
/**
 * Created by PhpStorm.
 * User: QQ:758246061
 * Date: 2018/9/23
 * Time: 16:06
 */

namespace app\lib\validate;


use app\lib\exception\ParameterException;
use think\Exception;
use think\facade\Request;
use think\Validate;

// 验证基类
class BaseValidate extends Validate
{
    public function goCheck()
    {
        // 获取所有类型参数 get/post
        $request = \think\Request::instance();
        $params = $request->param();

        // 开始校验 加->batch()为批量验证
        $result = $this->check($params);
        if (!$result) {
            // tp5自带异常
//             throw new Exception($this->error);

            // 自定义异常
            throw new ParameterException([
                'msg' => $this->error
            ]);
        } else {
            return true;
        }
    }

    /**
     * @method  检测参数是否为正整数
     * @param $value 参数值
     * @param string $rule
     * @param string $data 参数组
     * @param string $field 参数名
     * @return bool
     */
    protected function isPositiveInteger($value, $rule = '', $data = '', $field = '')
    {
        if (is_numeric($value) && is_int($value + 0) && ($value + 0) > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @method 检测参数是否为集合 例如:1, 2, 3, 4, 5
     * @param $value
     * @return bool
     */
    protected function isSets($value)
    {
        $values = explode(',', $value);
        if (empty($values)) {
            return false;
        }
        foreach ($values as $v) {
            if (!$this->isPositiveInteger($v)) {
                return false;
            }
        }
        return true;
    }

    //独立验证方法 是否为空
    protected function isNotEmpty($value, $rule = '', $data = '', $field = '')
    {
        if (empty($value)) {
            return false;
        } else {
            return true;
        }
    }

    //独立验证方法 是否为手机号
    protected function isMobile($value, $rule = '', $data = '', $field = '')
    {
        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    //独立验证方法 密码正则，4到16位（字母，数字，下划线，减号）
    protected function StrongPassword($value, $rule = '', $data = '', $field = '')
    {
        $rule = '^[a-zA-Z0-9_-]{6,32}$^';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * @method 非法参数过滤, 以及根据验证规则参数 获取对应参数值
     * @param $data 客户端传来的数据
     * @return array 返回真实所需数据
     * @throws ParameterException
     */
    public function getDataByRule($data)
    {
        if (array_key_exists('user_id', $data) || array_key_exists('uid', $data)) {
            throw new ParameterException([
                'msg' => '参数错误:包含非法参数user_id或uid'
            ]);
        }
        $newArray = [];
        foreach ($this->rule as $key => $value) {
            $newArray[$key] = $data[$key];
        }
        return $newArray;
    }


    /**
     * @method 验证身份证号是否正确
     * @param $value
     * @return bool
     */
    public function isIdCard($value)
    {
        if (!preg_match('/^\d{17}[0-9xX]$/', $value)) { //基本格式校验
            return false;
        }
        $parsed = date_parse(substr($value, 6, 8));
        if (!(isset($parsed['warning_count'])
            && $parsed['warning_count'] == 0)
        ) { //年月日位校验
            return false;
        }
        $base = substr($value, 0, 17);
        $factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        $tokens = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
        $checkSum = 0;
        for ($i = 0; $i < 17; $i++) {
            $checkSum += intval(substr($base, $i, 1)) * $factor[$i];
        }
        $mod = $checkSum % 11;
        $token = $tokens[$mod];
        $lastChar = strtoupper(substr($value, 17, 1));
        return ($lastChar === $token); //最后一位校验位校验
    }
}
