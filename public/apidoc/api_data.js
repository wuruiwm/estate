define({ "api": [
  {
    "type": "get",
    "url": "user/getBanner",
    "title": "首页轮播图",
    "group": "ad",
    "version": "0.1.0",
    "description": "<p>根据广告位置获取相应轮播图</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/banner/select"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "id",
            "description": "<p>广告位置 参数1</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Banner.php",
    "groupTitle": "广告管理",
    "name": "GetUserGetbanner"
  },
  {
    "type": "post",
    "url": "admin/common/login",
    "title": "管理员登录",
    "group": "admin",
    "version": "0.1.0",
    "description": "<p>供后台开发者调用 正确接口地址：http://estate.dingdingmaoer.cn/admin/common/login</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>账号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>密码</p>"
          }
        ]
      }
    },
    "name": "______",
    "filename": "app/admin/controller/Common.php",
    "groupTitle": "后台管理接口"
  },
  {
    "type": "get",
    "url": "house/head",
    "title": "房源头条",
    "group": "house",
    "version": "0.1.0",
    "description": "<p>获取房源头条,无须做下拉加载更多</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/house/head"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "limit",
            "description": "<p>限制取几条 默认不参为10条</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/House.php",
    "groupTitle": "房源",
    "name": "GetHouseHead"
  },
  {
    "type": "get",
    "url": "house/info",
    "title": "新房/二手房 房源详情信息",
    "group": "house",
    "version": "0.1.0",
    "description": "<p>根据房源Id获取详细信息</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/house/info"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "id",
            "description": "<p>房源id</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\"id\": 22,\n\"title\": \"标题\", --新房/二手房 名称\n\"desc\": \"简介\",  --新房/二手房 简介\n\"cover_img\": {  --新房/二手房 封面图片\n\"img_id\": 125,\n\"img_url\": \"http://estate.dingdingmaoer.cn\\\\uploads\\\\admin\\\\house_cover_head\\\\20181212\\\\56e0f5f9f141af02dd74f5f1c008dc20.jpg\"\n},\n\"head_img\": [   --新房/二手房 详情页头部轮播图\n{\n\"img_id\": \"137\",\n\"img_url\": \"http://estate.dingdingmaoer.cn\\\\uploads\\\\admin\\\\admin_thumb\\\\20181212\\\\062a11cb14da5f691f7c87518081f487.jpg\"\n},\n{\n\"img_id\": \"138\",\n\"img_url\": \"http://estate.dingdingmaoer.cn\\\\uploads\\\\admin\\\\admin_thumb\\\\20181212\\\\b0ce29e4aaf7e8d48b8a4c51b903b996.jpg\"\n}\n],\n\"house_price\": \"60000.00\", --新房/二手房 房价\n\"opening_time\": \"2018-12-11\", --新房 开盘时间\n\"house_address\": \"房源地址\", --新房/二手房 详细地址\n\"brokerage_plan\": [], --新房 佣金方案\n\"developer\": \"开发商\", --新房 开发商\n\"province\": {\n\"id\": \"340000\",\n\"name\": \"安徽省\"\n},\n\"city\": {\n\"id\": \"340500\",\n\"name\": \"马鞍山市\"\n},\n\"area\": {\n\"id\": \"1042\",\n\"name\": \"当涂县\"\n},\n\"greening_rate\": 60, --新房 绿化率\n\"parking_space\": 888, --新房 停车位数量\n\"floor_area\": 12, --新房/二手房 占地面积\n\"property_costs\": \"60.00\", --新房/二手房 物业费用\n\"property_company\": \"物业公司\", -- 新房 物业公司\n\"decoration_type\": [  --新房/二手房 装修类型\n\"毛坯\",\n\"简约\"\n],\n\"room_map\": [ --新房户型图 /二手房房源图\n{\n\"img_id\": \"134\",\n\"img_url\": \"http://estate.dingdingmaoer.cn\\\\uploads\\\\admin\\\\admin_thumb\\\\20181212\\\\6e4e2716280bd3af3b9e351f073839bd.jpg\"\n},\n{\n\"img_id\": \"136\",\n\"img_url\": \"http://estate.dingdingmaoer.cn\\\\uploads\\\\admin\\\\admin_thumb\\\\20181212\\\\37ec82aeb82553c10786a96f6ca4a6a6.png\"\n}\n],\n\"detail\": \"<p>内容<br/></p>\", --新房/二手房 详情介绍\n\"is_head\": 1,\n\"house_type\": \"\", --二手房 房屋类型\n\"init_status\": \"新房\", 房源类型\n\"create_time\": \"2018-12-12 16:30:40\",\n\"update_time\": \"2018-12-14 20:11:54\",\n\"delete_time\": null\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/api/controller/v1/House.php",
    "groupTitle": "房源",
    "name": "GetHouseInfo"
  },
  {
    "type": "get",
    "url": "house/list",
    "title": "首页最新房源/新房/二手房列表",
    "group": "house",
    "version": "0.1.0",
    "description": "<p>根据当前城市获取房源列表</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/house/list"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "page",
            "description": "<p>当前页</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "limit",
            "description": "<p>每页显示条数</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "province",
            "description": "<p>省</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "city",
            "description": "<p>市</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "type",
            "description": "<p>房源类型(不传为新房和二手房,值1为新房,值2为二手房)</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/House.php",
    "groupTitle": "房源",
    "name": "GetHouseList"
  },
  {
    "type": "post",
    "url": "password/code",
    "title": "获取验证码[找密用]",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>用户忘记密码时，输入手机号获取验证码</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/password/code"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Register.php",
    "groupTitle": "用户",
    "name": "PostPasswordCode"
  },
  {
    "type": "post",
    "url": "password/update",
    "title": "重置密码",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>重新修改用户密码</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/password/update"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "code",
            "description": "<p>验证码</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "password",
            "description": "<p>新密码</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "password_old",
            "description": "<p>确认密码</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Register.php",
    "groupTitle": "用户",
    "name": "PostPasswordUpdate"
  },
  {
    "type": "post",
    "url": "register/code",
    "title": "获取验证码[注册用]",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>用户注册时，输入手机号获取验证码</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/register/code"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Register.php",
    "groupTitle": "用户",
    "name": "PostRegisterCode"
  },
  {
    "type": "post",
    "url": "register/mobile",
    "title": "注册",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>输入手机号和短信验证码进行注册</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/register/mobile"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "nickname",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "code",
            "description": "<p>验证码</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "password",
            "description": "<p>密码</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "type",
            "description": "<p>注册类型,1为邀请码,2为普通</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": true,
            "field": "invite_code",
            "description": "<p>门店邀请码,当type为1必填,type为2时可选</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Register.php",
    "groupTitle": "用户",
    "name": "PostRegisterMobile"
  },
  {
    "type": "post",
    "url": "user/head_img",
    "title": "修改头像",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>根据token获取用户信息</p>",
    "permission": [
      {
        "name": "token header头传参"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "file",
            "optional": false,
            "field": "head_img",
            "description": "<p>用户头像</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/User.php",
    "groupTitle": "用户",
    "name": "PostUserHead_img"
  },
  {
    "type": "post",
    "url": "user/info",
    "title": "获取登陆者用户信息",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>根据token获取用户信息</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "token",
            "description": "<p>header传参</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\"id\": 1,\n\"nickname\": \"17681125543\", 昵称\n\"phone\": \"17681125543\", 手机号\n\"head_img\": \"http://estate.dingdingmaoer.cn/null.jpg\", 用户头像\n\"level\": \"门店经纪人\", 用户身份\n\"store_id\":\"安徽华邦地产\", 所属房产公司名称\n\"area\": \"安徽\" 主营区域\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/api/controller/v1/User.php",
    "groupTitle": "用户",
    "name": "PostUserInfo"
  },
  {
    "type": "post",
    "url": "user/login",
    "title": "登录",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>根据账号和密码进行登录,获取token值</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/user/login"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>密码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": true,
            "field": "expires",
            "description": "<p>默认不填2小时自动过期</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/WebToken.php",
    "groupTitle": "用户",
    "name": "PostUserLogin"
  },
  {
    "type": "post",
    "url": "user/update",
    "title": "修改用户信息",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>根据token获取用户信息</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/user/update"
      }
    ],
    "permission": [
      {
        "name": "token header头传参"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "optional": true,
            "field": "nickname",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Parameter",
            "optional": true,
            "field": "area",
            "description": "<p>主营地区</p>"
          },
          {
            "group": "Parameter",
            "optional": true,
            "field": "store_name",
            "description": "<p>门店名称</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/User.php",
    "groupTitle": "用户",
    "name": "PostUserUpdate"
  },
  {
    "type": "post",
    "url": "yanzheng/yanzheng",
    "title": "实名认证",
    "group": "user",
    "version": "0.1.0",
    "description": "<p>报备客户信息提交</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/yanzheng/yanzheg"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "card_name",
            "description": "<p>姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "card_phone",
            "description": "<p>手机号码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "card_number",
            "description": "<p>身份证号</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "token",
            "description": "<p>放到header里，用来获取用户id的token</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Yanzheng.php",
    "groupTitle": "用户",
    "name": "PostYanzhengYanzheng"
  },
  {
    "type": "get",
    "url": "house/loupan",
    "title": "获取所有楼盘信息，不需要传参",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>获取所有楼盘信息</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/house/loupan"
      }
    ],
    "filename": "app/api/controller/v1/Loupan.php",
    "groupTitle": "客户端接口",
    "name": "GetHouseLoupan"
  },
  {
    "type": "get",
    "url": "house/loupan2",
    "title": "获取所有楼盘信息，传省和市",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>获取所有楼盘信息</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/house/loupan2"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "province",
            "description": "<p>传省的名字 例如 安徽省</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "city",
            "description": "<p>传市的名字 例如 蚌埠市</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Loupan.php",
    "groupTitle": "客户端接口",
    "name": "GetHouseLoupan2"
  },
  {
    "type": "get",
    "url": "notice/content",
    "title": "获取公告内容",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>根据传来的id，获取相应公告内容</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/notice/content"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "id",
            "description": "<p>公告id</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Notice.php",
    "groupTitle": "客户端接口",
    "name": "GetNoticeContent"
  },
  {
    "type": "get",
    "url": "notice/find",
    "title": "获取首页公告标题",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>获取首页公告标题</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/notice/find"
      }
    ],
    "filename": "app/api/controller/v1/Notice.php",
    "groupTitle": "客户端接口",
    "name": "GetNoticeFind"
  },
  {
    "type": "post",
    "url": "order/add",
    "title": "报备客户信息提交",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>报备客户信息提交</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/order/add"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "str",
            "optional": false,
            "field": "name",
            "description": "<p>用户名</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "number",
            "description": "<p>手机号码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "gender",
            "description": "<p>1男2女</p>"
          },
          {
            "group": "Parameter",
            "type": "str",
            "optional": false,
            "field": "date",
            "description": "<p>预计带看时间，例2018-11-11</p>"
          },
          {
            "group": "Parameter",
            "type": "str",
            "optional": false,
            "field": "content",
            "description": "<p>购房意向</p>"
          },
          {
            "group": "Parameter",
            "type": "str",
            "optional": false,
            "field": "token",
            "description": "<p>用来获取用户id的token</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Order.php",
    "groupTitle": "客户端接口",
    "name": "PostOrderAdd"
  },
  {
    "type": "post",
    "url": "yanzheng/shenhe",
    "title": "获取实名验证和审核状态",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>获取是否实名验证和审核状态</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/yanzheng/shenhe"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "token",
            "description": "<p>放到header里，用来获取用户id的token</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Yanzheng.php",
    "groupTitle": "客户端接口",
    "name": "PostYanzhengShenhe"
  },
  {
    "type": "get",
    "url": "order/baobei",
    "title": "获取我的客户里四种列表",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>根据传来的用户id获取四种状态列表</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/order/baobei"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "page",
            "description": "<p>当前页</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "limit",
            "description": "<p>每页显示条数</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "state",
            "description": "<p>四种状态，1已报备，2已到访，3已成交，4已提额</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "token",
            "description": "<p>放在header里传过来</p>"
          }
        ]
      }
    },
    "name": "_____________",
    "filename": "app/api/controller/v1/Orderlist.php",
    "groupTitle": "客户端接口"
  },
  {
    "type": "get",
    "url": "order/content",
    "title": "获取报备列表的内容详情",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>根据传来的用户id获取四种状态列表</p>",
    "sampleRequest": [
      {
        "url": "http://estate.dingdingmaoer.cn/api/v1/order/content"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "id",
            "description": "<p>报备列表的id</p>"
          },
          {
            "group": "Parameter",
            "type": "string",
            "optional": false,
            "field": "token",
            "description": "<p>放在header里传过来</p>"
          }
        ]
      }
    },
    "name": "__________________",
    "filename": "app/api/controller/v1/Orderlist.php",
    "groupTitle": "客户端接口"
  }
] });
