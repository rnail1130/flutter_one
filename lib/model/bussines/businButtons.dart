import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/Tab1.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/TiedCardAccount_shopList.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/TiedCardAccount_shopshow.dart';
import 'package:phone_yiyang/pages/bankOutlets/bankOutlets_index.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_index_sms.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/pages/tabThird/checkDeil.dart';
import 'package:phone_yiyang/pages/tabThird/hubThird.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/plug.dart';
import 'business_list.dart';
import '../../pages/TiedCardAccount/TiedListDetail.dart';

class BusinessButtons {
  List<BusinessButton> butt;
  List<BusinessButton> b_1001 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f100102, "虚拟卡", true),
    BusinessButton(f100103, "交易记录", true),
    BusinessButton(f100104, "修改信息", true),
    BusinessButton(f100105, "一键挂失", true),
  ];
  List<BusinessButton> b_1002 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "身份认证", false),
  ];
  List<BusinessButton> b_1003 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "银行积分", false),
    BusinessButton(notFun, "居民卡转账", false),
    BusinessButton(f100304, "办卡网点", true)
  ];
  List<BusinessButton> b_1004 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "缴纳话费", false),
    BusinessButton(notFun, "流量充值", false),
    BusinessButton(f100404, "积分兑换", true)
  ];
  List<BusinessButton> b_1005 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f100502, "交易记录", true),
    BusinessButton(notFun, "居民卡转账", false),
  ];
  List<BusinessButton> b_1006 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f100602, "APP下载", true),
    BusinessButton(notFun, "交易记录", false),
    BusinessButton(f100604, "重置密码", true),
    BusinessButton(f100605, "免密签约授权", true),
  ];
  List<BusinessButton> b_1007 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "账户充值", false),
    BusinessButton(notFun, "账户余额", false),
    BusinessButton(notFun, "乘车记录", false)
  ];
  List<BusinessButton> b_1008 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "社保缴费", false),
    BusinessButton(notFun, "养老查询", false),
    BusinessButton(notFun, "医疗查询", false),
    BusinessButton(notFun, "公积金查询", false),
    BusinessButton(notFun, "失业查询", false),
  ];
  List<BusinessButton> b_1009 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "身份核实", false),
    BusinessButton(notFun, "特惠商户", false),
  ];
  List<BusinessButton> b_1010 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "身份核实", false),
    BusinessButton(notFun, "特惠商户", false),
  ];
  List<BusinessButton> b_1011 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "违章查询", false),
    BusinessButton(notFun, "违章缴费", false),
  ];
  List<BusinessButton> b_1012 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "记分查询", false),
  ];
  List<BusinessButton> b_1013 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "免密支付", false),
  ];
  List<BusinessButton> b_1014 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "免密支付", false),
  ];
  List<BusinessButton> b_1015 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "学历证书查询", false),
  ];
  List<BusinessButton> b_1016 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "咪咕视频", false),
    BusinessButton(notFun, "咪咕音乐", false),
    BusinessButton(notFun, "咪咕游戏", false),
    BusinessButton(notFun, "咪咕阅读", false),
    BusinessButton(notFun, "咪咕动漫", false),
  ];
  List<BusinessButton> b_1017 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "网络电话", false),
    BusinessButton(notFun, "和彩云", false),
    BusinessButton(notFun, "我的移动", false),
  ];
  List<BusinessButton> b_1018 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "查看邮件", false),
    BusinessButton(notFun, "修改密码", false),
  ];
  List<BusinessButton> b_1019 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "解除绑定", false),
    BusinessButton(notFun, "缴纳党费", false),
  ];
  List<BusinessButton> b_1020 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f102002, "申请开通", true),
    BusinessButton(f102002, "虚拟卡", true),
    BusinessButton(f102003, "交易记录", true),
  ];
  List<BusinessButton> b_1021 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f102102, "购买VIP", true),
    BusinessButton(f102103, "购买记录", true),
  ];
  List<BusinessButton> b_1022 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(f102202, "公积金查询", true),
    BusinessButton(notFun, "贷款查询", false),
  ];
  List<BusinessButton> b_1023 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "账户绑定", false),
    BusinessButton(notFun, "账户解绑", false),
    BusinessButton(notFun, "物业费缴纳", false),
  ];
  List<BusinessButton> b_1024 = [
    BusinessButton(gotodetail, "详情", true),
    BusinessButton(notFun, "医保查询", false),
  ];
  BusinessButtons.fromget(code) {
    switch (code) {
      case '1001':
        this.butt = this.b_1001;
        break;
      case '1002':
        this.butt = this.b_1002;
        break;
      case '1003':
        this.butt = this.b_1003;
        break;
      case '1004':
        this.butt = this.b_1004;
        break;
      case '1005':
        this.butt = this.b_1005;
        break;
      case '1006':
        this.butt = this.b_1006;
        break;
      case '1007':
        this.butt = this.b_1007;
        break;
      case '1008':
        this.butt = this.b_1008;
        break;
      case '1009':
        this.butt = this.b_1009;
        break;
      case '1010':
        this.butt = this.b_1010;
        break;
      case '1011':
        this.butt = this.b_1011;
        break;
      case '1012':
        this.butt = this.b_1012;
        break;
      case '1013':
        this.butt = this.b_1013;
        break;
      case '1014':
        this.butt = this.b_1014;
        break;
      case '1015':
        this.butt = this.b_1015;
        break;
      case '1016':
        this.butt = this.b_1016;
        break;
      case '1017':
        this.butt = this.b_1017;
        break;
      case '1018':
        this.butt = this.b_1018;
        break;
      case '1019':
        this.butt = this.b_1019;
        break;
      case '1020':
        this.butt = this.b_1020;
        break;
      case '1021':
        this.butt = this.b_1021;
        break;
      case '1022':
        this.butt = this.b_1022;
        break;
      case '1023':
        this.butt = this.b_1023;
        break;
      case '1024':
        this.butt = this.b_1024;
    }
  }
}

class BusinessButton {
  Function fun;
  String name;
  bool isonclick;
  BusinessButton(this.fun, this.name, this.isonclick);
  setisonclick(bol) {
    this.isonclick = bol;
  }
}

notFun() {
  alertMsg(null, "暂未开通", "", null);
}

gotodetail(BuildContext context, ResultBusinessList movie, bool ifsign) {
  Navigator.of(context).push(
    new MaterialPageRoute(
      builder: (context) => TiedListDetail(
        ifsign: ifsign,
        status: movie.status == 1,
        businessname: movie.name,
        businessCode: movie.businessCode,
        code: movie.status == 1 ? movie.code : null,
        detailInfo: movie.status == 1 ? null : movie,
      ),
    ),
  );
}

/// 虚拟卡
f100102(BuildContext context, movie, bool ifsign) {
  if (ifsign)
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyCard()));
  else
    gotoLogin(context);
  // 跳转到虚拟卡页面
}

/// 交易记录
f100103(BuildContext context, movie, bool ifsign) {
  // 跳转到交易记录页面
  if (ifsign) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => checkDeil("交易记录")));
  } else {
    gotoLogin(context);
  }
}

/// 修改信息
f100104(BuildContext context, movie, bool ifsign) {
  // 跳转到修改信息页面
  if (ifsign) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => hubThird("个人信息")));
  } else {
    gotoLogin(context);
  }
}

/// 一键挂失
f100105(BuildContext context, movie, bool ifsign) {
  // 跳转到 一键挂失 页面
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => hubThird("居民卡一键挂失")));
}

/// 银行网点
f100304(BuildContext context, movie, bool ifsign) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => BankOutlets()));
  // 跳转到 银行网点 页面
}

/// 积分兑换
f100404(BuildContext context, movie, bool ifsign) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return SmsContent();
    },
  ).then((val) {
    print(val);
  });
  // 弹出选择框
}

/// 交易记录
f100502(BuildContext context, ResultBusinessList movie, bool ifsign) {
  // 跳转到 电子钱包-交易记录 页面
  if (ifsign) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => checkDeil("交易记录")));
  } else {
    gotoLogin(context);
  }
}

/// APP下载
f100602(BuildContext context, ResultBusinessList movie, bool ifsign) {
  openWithBrowser("https://p.10086.cn/info/wap/sjqb/cpb/jsym/index.html");
}

/// 重置密码
f100604(BuildContext context, ResultBusinessList movie, bool ifsign) {
  openWithBrowser(
      "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=1&BACK_FLG=6");
}

/// 免密签约授权
f100605(BuildContext context, ResultBusinessList movie, bool ifsign) {
  openWithBrowser(
      "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=2&BACK_FLG=6");
}

/// 居民卡VIP账户-购买记录
f102103(BuildContext context, ResultBusinessList movie, bool ifsign) {
  if (ifsign) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TiedCardAccount_shopList()));
  } else {
    gotoLogin(context);
  }
}

/// 公积金账户-公积金查询
f102202(BuildContext context, ResultBusinessList movie, bool ifsign) {
  alertMsg(null, "暂未开通", "", null);
}

/// 居民卡VIP账户-购买VIP
f102102(BuildContext context, ResultBusinessList movie, bool ifsign) {
  if (ifsign) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TiedCardAccount_shopshow()));
  } else {
    gotoLogin(context);
  }
}

/// 交易记录
f102003(BuildContext context, ResultBusinessList movie, bool ifsign) {
  if (ifsign) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => checkDeil("交易记录")));
  } else {
    gotoLogin(context);
  }
}

/// 申请开通/虚拟卡
f102002(BuildContext context, ResultBusinessList movie, bool ifsign) {
  alertMsg(null, "暂未开通", "", null);
}

gotoLogin(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
}
