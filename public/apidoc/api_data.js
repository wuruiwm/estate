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
    "name": "______",
    "filename": "app/api/controller/v1/WebToken.php",
    "groupTitle": "客户端接口"
  }
] });
