<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/26 0026
 * Time: 14:13
 */

namespace app\api\controller\v1;


use app\admin\model\Attachment;
use app\admin\model\Income;
use app\api\model\ApplyOrder;
use app\api\model\EnterPrice;
use app\api\model\Loan;
use app\api\model\UserInvite;
use app\api\model\UserRealname;
use app\api\service\Token;
use app\api\model\User as ModelUser;
use app\lib\exception\ErrorMessage;
use app\lib\exception\SuccessMessage;
use app\lib\validate\AddRealName;
use app\lib\validate\ChangeNickname;
use app\lib\validate\ChangePassword;
use app\lib\validate\ModileCode;
use app\lib\validate\UpdateAlipay;
use app\lib\validate\UpdateWx;
use app\lib\validate\VerifyPhone;
use think\Db;


class User extends BaseController
{

    //根据当前登录者获取用户信息
    public function getUserById()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = ModelUser::get($user_id);
        unset($result->password);
        if (!$result) {
            throw new ErrorMessage([
                'msg' => '账号异常：请重新登录'
            ]);
        }
        $result->mobile = $result->phone;
        $result->phone = hide_phone($result->phone);
        if ($result->superior_id == 0) {
            $result->superior_id = '平台';
        } else {
            $result->superior_id = \app\api\model\User::where('id', $result->superior_id)->column('nickname')[0];
        }
        return $result;
    }

    // 修改昵称
    public function UpdateUserById()
    {
        (new ChangeNickname())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        $post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update($post);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 验证手机+验证码
    public function verifyPhone()
    {
        (new VerifyPhone())->goCheck();
        $mobile = input('post.mobile');
        $code = input('post.code');
        if ($mobile !== \think\Cache::get('mobile') || $code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }
        throw new SuccessMessage();
    }

    // 修改手机号
    public function updateMobile()
    {
        (new ModileCode())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'phone' => input('post.mobile')
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 设置支付宝
    public function UpdateUserAlipay()
    {
        (new UpdateAlipay())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'alipay_name' => input('post.alipay_name'),
                'alipay_no' => input('post.alipay_no')
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 设置微信
    public function UpdateUserWx()
    {
        (new UpdateWx())->goCheck();
        $user_id = Token::getCurrentTokenUserId();
        //$post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update([
                'wx_no' => input('post.wx_no'),
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 修改密码
    public function updatePassword()
    {
        $user_id = Token::getCurrentTokenUserId();
        $code = input('post.code');
        if ($code !== \think\Cache::get('codeNumber')) {
            throw new ErrorMessage([
                'msg' => '验证码错误'
            ]);
        }
        (new ChangePassword())->goCheck();
        $password = input('post.password');
        $password = password($password);
        $result = ModelUser::where('id', $user_id)
            ->update([
                'password' => $password
            ]);
        if ($result) {
            throw new SuccessMessage();
        }
    }

    // 修改接收通知
    public function updateRearnings()
    {
        $user_id = Token::getCurrentTokenUserId();
        $post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update($post);
        if ($result) {
            throw new SuccessMessage([
                'msg' => input('post.is_earnings')
            ]);
        }
        throw new ErrorMessage();
    }

    // 修改接收粉丝信息
    public function updateFans()
    {
        $user_id = Token::getCurrentTokenUserId();
        $post = input('post.');
        $result = ModelUser::where('id', $user_id)
            ->update($post);
        if ($result) {
            throw new SuccessMessage([
                'msg' => input('post.is_fans')
            ]);
        }
        throw new ErrorMessage();
    }

    // 获取我的下级用户
    public function getSub($lev = 1)
    {
        $user_id = Token::getCurrentTokenUserId();
        $invite = UserInvite::all();
        $arr = $this->subTree($invite, $user_id);
        //return $arr;
        $lev_data = [];
        foreach ($arr as $key => $value) {
            if ($value['lev'] == $lev) {
                $value['phone'] = hide_phone($value->user->phone);
                $value->user['time'] = substr($value->user->create_time, 0, 10);
                $lev_data[] = $value;
            }
        }
        return $lev_data;

    }

    // 递归
    public function subTree($arr, $id = 0, $lev = 1)
    {
        $sub = array();
        foreach ($arr as $k => $v) {
            if ($v['source_user_id'] == $id) {
                $v['lev'] = $lev;
                $v['user'] = \app\api\model\User::get($v['target_user_id']);
                $sub[] = $v;
                $sub = array_merge($sub, $this->subTree($arr, $v['target_user_id'], $lev + 1));
            }
        }
        return $sub;
    }

    // 客户列表
    public function getClientList($status = '')
    {
        $suid = Token::getCurrentTokenUserId();
        $orderAll = ApplyOrder::where('status', $status)
            ->where('source_user_id', $suid)
            ->order('create_time desc')
            ->select();
        if ($orderAll) {
            foreach ($orderAll as $key => $value) {
                // 下单源
                if ($orderAll[$key]['user_id'] <= 0) {
                    $orderAll[$key]['user_id'] = '非会员';
                } else {
                    $orderAll[$key]['user_id'] = \app\api\model\User::where('id', $orderAll[$key]['user_id'])->column('nickname')[0];
                }
                // 产品类型
                if ($orderAll[$key]['type_id'] == 1) {
                    $orderAll[$key]['type_id'] = '贷款';
                    // 产品详情信息
                    $img_id = Loan::where('id', $orderAll[$key]['product_id'])->column('thumb')[0];
                    $orderAll[$key]['thumb_url'] = http_type() . Attachment::where('id', $img_id)->column('filepath')[0];
                    $orderAll[$key]['product_name'] = Loan::where('id', $orderAll[$key]['product_id'])->column('title')[0];
                    $orderAll[$key]['bonus'] = Loan::where('id', $orderAll[$key]['product_id'])->column('bonus')[0];


                } else {
                    $orderAll[$key]['type_id'] = '信用卡';
                }

                // 手机号
                $orderAll[$key]['phone'] = hide_phone($orderAll[$key]['phone']);
                // 时间
                $orderAll[$key]['time'] = substr($orderAll[$key]['create_time'], 0, 16);


            }
            return $orderAll;
        }
    }

    // 实名
    public function realname()
    {
        //return input('post.mobile');
        $user_id = Token::getCurrentTokenUserId();
        (new AddRealName())->goCheck();
        // 正面
        $file_1 = request()->file('img_1');
        if (empty($file_1)) {
            throw new ErrorMessage([
                'msg' => '请上传正面照'
            ]);
        }

        // 反面
        $file_2 = request()->file('img_2');
        if (empty($file_2)) {
            throw new ErrorMessage([
                'msg' => '请上传反面照'
            ]);
        }

        // 获取正面
        $info_1 = $file_1->validate(['size' => 4000000, 'ext' => 'jpg,png'])->move('../public/uploads/user/');
        if ($info_1) {
            //uploads\user\20181106\615fac65bc552aaa692cfc36d2c6ab82.jpg
            $img_1_path = 'uploads\user\\' . $info_1->getSaveName();
            // return $img_1_path;
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }

        // 获取反面
        $info_2 = $file_2->validate(['size' => 4000000, 'ext' => 'jpg,png'])->move('../public/uploads/user/');
        if ($info_2) {
            //uploads\user\20181106\615fac65bc552aaa692cfc36d2c6ab82.jpg
            $img_2_path = 'uploads\user\\' . $info_2->getSaveName();
            //return $img_2_path;
        } else {
            // 上传失败获取错误信息
            throw new ErrorMessage([
                'msg' => '上传失败'
            ]);
        }

        $data = [
            'name' => input('post.name'),
            'card_no' => input('post.card_no'),
            'mobile' => input('post.mobile'),
            'img_1' => $img_1_path,
            'img_2' => $img_2_path,
            'user_id' => $user_id
        ];
        $realModel = new UserRealname();
        $real = $realModel->where('user_id', $user_id)->find();
        if (!$real) {// 新增
            $result = $realModel->create($data);
            if ($result) {
                throw new SuccessMessage();
            }
        }// 修改
        else {
            $data['status'] = 0;
            $result = $realModel->where('user_id', $user_id)->update($data);
            if ($result) {
                throw new SuccessMessage();
            }
        }
        throw new ErrorMessage([
            'msg' => '提交失败'
        ]);
    }

    public function item()
    {
        $user_id = Token::getCurrentTokenUserId();
        $result = UserRealname::where('user_id', $user_id)
            ->find();
        $result['img_1'] = http_type() . '\\' . $result['img_1'];
        $result['img_2'] = http_type() . '\\' . $result['img_2'];
        return $result;
    }

    // 用户中心 头部收入信息
    public function getUserIncome()
    {
        // 总收入
        $user_id = Token::getCurrentTokenUserId();
        $total = ApplyOrder::where('source_user_id', $user_id)
            ->sum('bonus');
        // 已结算
        $end = ApplyOrder::where('source_user_id', $user_id)
            ->where('status', 1)
            ->sum('bonus');

        // 可结算
        $may = ApplyOrder::where('source_user_id', $user_id)
            ->where('status', 0)
            ->sum('bonus');

        $data = [
            'total' => number_format($total, 2, ".", ""),
            'end' => number_format($end, 2, ".", ""),
            'may' => number_format($may, 2, ".", ""),
        ];
        return $data;
    }


    // 用户钱包明细
    public function getWallet()
    {
        $user_id = Token::getCurrentTokenUserId();

        $user = ModelUser::where('id', $user_id)->find();// 用户信息
        //return $user;
        // 账户余额 == 已结算
        $end = ApplyOrder::where('source_user_id', $user_id)
            ->where('status', 1)
            ->sum('bonus');
        //收入明细
        $income = Income::where('user_id', $user_id)->select();

        return [
            'userInfo' => $user,
            'phone' => hide_phone($user['phone']),
            'end' => number_format($end, 2, ".", ""),
            'income' => $income
        ];

    }

    // 佣金说明
    public function getBrokerageList()
    {
        return Loan::all();
    }


    // 是否实名
    public function isRealname()
    {
        $user_id = Token::getCurrentTokenUserId();
        $userInfo = \app\api\model\User::get($user_id);
        if ($userInfo['is_realname'] <= 0) {
            throw new ErrorMessage([
                'msg' => '请先进行实名认证'
            ]);
        }
        throw new SuccessMessage();
    }

    // 获取购买价格
    public function getEnterPrice()
    {
        return EnterPrice::get(1);
    }


    // 获取月度报表
    public function getReport()
    {
        $status = input('post.status');
        $type_id = input('post.type_id');

        $begin_time = strtotime(input('post.begin_time'));
        $end_time = strtotime(input('post.end_time'));
        $user_id = Token::getCurrentTokenUserId();
        if ($begin_time >= $end_time) {
            throw new ErrorMessage([
                'msg' => '结束时间必须大于开始时间'
            ]);
        }
        $sql = "SELECT *,COUNT(*) as pv FROM tplay_goods_pv WHERE
`status`=$status
and
`type_id`=$type_id
and
user_id =$user_id
and
(create_time >=$begin_time and create_time<=$end_time )
GROUP BY title ";
        return Db::query($sql);
    }


    // 排行榜
    public function top($m='',$n='')
    {
        $sql = "(SELECT  *,sum(money) as top FROM tplay_income
where user_id !=0
GROUP BY user_id)
ORDER BY top desc
limit $m,$n";
        $result = Db::query($sql);
        foreach ($result as $k => $v) {
            $result[$k]['name'] = ModelUser::where('id', $result[$k]['user_id'])->column('nickname')[0];
            $head_img = ModelUser::where('id', $result[$k]['user_id'])->column('head_img');
            if ($head_img[0] > 0) {
                $img_id = $head_img[0];
            } else {
                $img_id = 1;
            }
            $result[$k]['img_id'] = $img_id;
            $result[$k]['img'] = http_type() . Attachment::where('id', $img_id)->column('filepath')[0];
        }
        return $result;
    }


}