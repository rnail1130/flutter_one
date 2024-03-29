import 'package:phone_yiyang/pages/cardBag/cardBag_index.dart';

import "config.dart";

class DataConfig {
  //底部导航的配置
  static const TAB = ['首页', '我的虚拟卡', '个人中心'];
  //首页顶部的数据配置
  static const topPart = {
    '0': ['政务便民', 'assets/images/bianmin.png'],
    '1': ['缴费账户', 'assets/images/jiaofei.png'],
    '2': ['会员账户', 'assets/images/huiyuan.png'],
    '3': ['票券卡包', 'assets/images/piaoquan.png'],
    '4': ['绑卡账户', 'assets/images/bangka.png'],
  };
  //用户中心的配置
  static const userList = [
    ['个人信息', 'assets/images/myCenter0.png'],
    ['云闪付绑卡', 'assets/images/bangka.png'],
    ['实名认证', 'assets/images/person3.png'],
    ['交易查询', 'assets/images/myCenter1.png'],
    ['关联账户', 'assets/images/myCenter2.png'],
    ['用户手册', 'assets/images/myCenter3.png'],
    ['修改智慧益阳app密码', 'assets/images/myCenter4.png'],
    ['修改虚拟卡支付密码', 'assets/images/personal_pwd.png'],
    ['居民卡一键挂失', 'assets/images/myCenter5.png'],
    ['客户服务', 'assets/images/myCenter6.png']
  ];
  //首页居民卡数据配置
  //颜色['red',"green","blue","yellow","black","orange"]
  //政务便民服务
  static const middleData = {
    "color": "red",
    "more": "middleData",
    "title": "政务便民服务",
    "data": [
      {
        "data_title": "政务查询",
        "sub_title": "便民政务在线办",
        "src": "assets/img/index_pic41.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "true" //是否需要验证登录
      },
      {
        "data_title": "个人办事",
        "sub_title": "便民政务在线办",
        "src": "assets/img/index_pic43.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "企业办事",
        "sub_title": "便民政务在线办",
        "src": "assets/img/index_pic44.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "公告发布",
        "sub_title": "便民政务在线办",
        "src": "assets/img/index_pic42.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
    ]
  };
  static const middleData_list = [
    {
      "img": "assets/images/more/rdcx.png",
      "isJump": "false",
      "title": "政务查询",
      "url": "",
      "ischeck": "true" //是否需要验证登录
    },
    {
      "img": "assets/images/more/grbs.png",
      "isJump": "false",
      "title": "个人办事",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/qybs.png",
      "isJump": "false",
      "title": "企业办事",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/ggfb.png",
      "isJump": "false",
      "title": "公告发布",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/bjcx.png",
      "isJump": "false",
      "title": "办件查询",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
  ];
  //公共缴费服务
  static const difangData = {
    "color": "red",
    "more": "difList",
    "title": "公共缴费服务",
    "data": [
      {
        "data_title": "水费缴费",
        "sub_title": "在线公共生活缴费",
        "src": "assets/images/index/index_pic11.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "燃气缴费",
        "sub_title": "在线公共生活缴费",
        "src": "assets/images/index/index_pic13.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "电费缴费",
        "sub_title": "在线公共生活缴费",
        "src": "assets/images/index/index_pic12.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "有线缴费",
        "sub_title": "在线公共生活缴费",
        "src": "assets/images/index/index_pic14.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
    ]
  };
  static const difangData_list = [
    {
      "img": "assets/images/more/moreID2_0.png",
      "isJump": "false",
      "title": "水费缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_1.png",
      "isJump": "false",
      "title": "电费缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_2.png",
      "isJump": "false",
      "title": "燃气缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_5.png",
      "isJump": "false",
      "title": "有线电视缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_6.png",
      "isJump": "false",
      "title": "话费缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_7.png",
      "isJump": "false",
      "title": "流量缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID2_8.png",
      "isJump": "false",
      "title": "加油卡缴费",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
  ];
  //地方商业服务
  static const gonggjfeiData = {
    "color": "green",
    "more": "difList",
    "title": "地方商业服务",
    "data": [
      {
        "data_title": "一公里网点",
        "sub_title": "充值缴费消费全覆盖",
        "src": "assets/images/index/index_pic7.png",
        "url": config.API_VER +
            "/html5/pages/juminka/BMwangdian.html", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "申请加入",
        "sub_title": "成为居民卡签约商户",
        "src": "assets/images/index/index_pic10.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "data_title": "商户APP",
        "sub_title": "商户服务的终端应用",
        "src": "assets/images/index/index_pic8.png",
        "url": config.API_VER +
            "/html5/pages/difangshangyeServer/shanghuAPP.html", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
        "ischeck": "false" //是否需要验证登录
      },
      {
        "ischeck": "true",
        "data_title": "票券服务",
        "sub_title": "获取促销券电子门票",
        "src": "assets/images/index/index_pic9.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "false",
      }
    ]
  };
  static const gonggjfeiData_list = [
    {
      "img": "assets/images/more/moreID1_0.png",
      "isJump": "false",
      "title": "签约商户",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID1_1.png",
      "isJump": "false",
      "title": "商户积分",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID1_2.png",
      "isJump": "false",
      "title": "商户点卡",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
    {
      "img": "assets/images/more/moreID1_3.png",
      "isJump": "false",
      "title": "申请加入",
      "url": "",
      "ischeck": "false" //是否需要验证登录
    },
  ];
  //益阳居民卡
  static const wuyuanData = {
    "color": "orange",
    "more": "wuyuanList",
    "title": "益阳居民卡",
    "data": [
      {
        "data_title": "申请办理",
        "sub_title": "如何办理居民卡",
        "src": "assets/images/index/index_pic.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "交易查询",
        "sub_title": "居民卡交易明细",
        "src": "assets/images/index/index_pic2.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "移动积分消费",
        "sub_title": "移动积分当钱花",
        "src": "assets/images/index/index_pic3.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "和包支付",
        "sub_title": "中国移动第三方支付",
        "src": "assets/images/index/index_pic4.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
    ]
  };
  static const wuyuanData_list = [
    {
      "img": "assets/images/more/moreID0_0.png",
      "isJump": "true",
      "title": "虚拟卡",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_6.png",
      "isJump": "true",
      "title": "申请办理",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_4.png",
      "isJump": "true",
      "title": "交易查询",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_2.png",
      "isJump": "true",
      "title": "移动积分消费",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_1.png",
      "isJump": "true",
      "title": "和包支付",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_5.png",
      "isJump": "true",
      "title": "快速上手",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_8.png",
      "isJump": "true",
      "title": "了解居民卡",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_10.png",
      "isJump": "true",
      "title": "紧急挂失",
      "url": ""
    },
    {
      "img": "assets/images/more/moreID0_11.png",
      "isJump": "true",
      "title": "使用说明",
      "url": ""
    },
  ];
  //多彩益阳
  static const shiyuData = {
    "color": "yellow",
    "more": "",
    "title": "多彩益阳",
    "data": [
      {
        "data_title": "益阳时政",
        "sub_title": "了解益阳政治民生",
        "src": "assets/images/index/index_pic60.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "益阳新闻",
        "sub_title": "地方新闻资讯动态",
        "src": "assets/images/index/index_pic26.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "益阳文化",
        "sub_title": "领略银城文化",
        "src": "assets/images/index/index_pic24.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
      {
        "data_title": "益阳旅游",
        "sub_title": "益阳全域旅游攻略",
        "src": "assets/images/index/index_pic25.png",
        "url": "", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "",
      },
    ]
  };
  //合作伙伴
  static const hezuoData = {
    "color": "red",
    "more": "hezuoList",
    "title": "合作伙伴",
    "data": [
      {
        "data_title": "中移和包",
        "sub_title": "金牌金融支付公司",
        "src": "assets/images/index_pic28.png",
        "url": "www.baidu.com", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
      },
      {
        "data_title": "招商银行",
        "sub_title": "第六大商业银行",
        "src": "assets/images/index_pic29.png",
        "url": "www.baidu.com", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
      },
      {
        "data_title": "红枣科技",
        "sub_title": "区域支付生态服务商",
        "src": "assets/images/index_pic30.png",
        "url": "www.baidu.com", //可以跳转的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
      },
      {
        "data_title": "中国移动",
        "sub_title": "最大通信运营商",
        "src": "assets/images/index_pic31.png",
        "url": "www.baidu.com", //可以跳转s的话给链接，否则给类名，并且isjump为false
        "isjump": "true",
      },
    ]
  };
}
