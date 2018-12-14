define({ "api": [
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
    "type": "get",
    "url": "user/getBanner",
    "title": "获取首页轮播图",
    "group": "web",
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
            "description": "<p>广告位置 1</p>"
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Banner.php",
    "groupTitle": "客户端接口",
    "name": "GetUserGetbanner"
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
    "url": "password/code",
    "title": "获取验证码[找密用]",
    "group": "web",
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
    "groupTitle": "客户端接口",
    "name": "PostPasswordCode"
  },
  {
    "type": "post",
    "url": "password/update",
    "title": "重置密码",
    "group": "web",
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
    "groupTitle": "客户端接口",
    "name": "PostPasswordUpdate"
  },
  {
    "type": "post",
    "url": "register/code",
    "title": "获取验证码[注册用]",
    "group": "web",
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
    "groupTitle": "客户端接口",
    "name": "PostRegisterCode"
  },
  {
    "type": "post",
    "url": "register/mobile",
    "title": "用户注册",
    "group": "web",
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
          }
        ]
      }
    },
    "filename": "app/api/controller/v1/Register.php",
    "groupTitle": "客户端接口",
    "name": "PostRegisterMobile"
  },
  {
    "type": "get",
    "url": "house/info",
    "title": "获取房源详情",
    "group": "web",
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
    "name": "______",
    "filename": "app/api/controller/v1/House.php",
    "groupTitle": "客户端接口"
  },
  {
    "type": "get",
    "url": "house/list",
    "title": "获取首页房源列表",
    "group": "web",
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
          }
        ]
      }
    },
    "name": "________",
    "filename": "app/api/controller/v1/House.php",
    "groupTitle": "客户端接口"
  },
  {
    "type": "post",
    "url": "user/login",
    "title": "用户登录",
    "group": "web",
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
    "name": "_________",
    "filename": "app/api/controller/v1/WebToken.php",
    "groupTitle": "客户端接口"
  },
  {
    "type": "get",
    "url": "order/baobei",
    "title": "获取我的客户已报备列表",
    "group": "web",
    "version": "0.1.0",
    "description": "<p>根据传来的用户id获取已报备列表</p>",
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
    "name": "___________",
    "filename": "app/api/controller/v1/Orderlist.php",
    "groupTitle": "客户端接口"
  }
] });
