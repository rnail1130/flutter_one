import 'package:flutter/material.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/plug.dart';
import 'business_list.dart';
import '../../pages/TiedCardAccount/TiedListDetail.dart';

class BusinessButtons {
  List<BusinessButton> butt;
  List<BusinessButton> b_1001 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100102, "虚拟卡", true),
    BusinessButton(f100103, "交易记录", true),
    BusinessButton(f100104, "修改信息", true),
    BusinessButton(f100105, "一键挂失", true),
  ];
  List<BusinessButton> b_1002 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100202, "身份认证", false),
  ];
  List<BusinessButton> b_1003 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100302, "银行积分", false),
    BusinessButton(f100303, "居民卡转账", false),
    BusinessButton(f100304, "办卡网点", true)
  ];
  List<BusinessButton> b_1004 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100402, "缴纳话费", false),
    BusinessButton(f100403, "流量充值", false),
    BusinessButton(f100404, "积分兑换", true)
  ];
  List<BusinessButton> b_1005 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100502, "交易记录", true),
    BusinessButton(f100503, "居民卡转账", false),
  ];
  List<BusinessButton> b_1006 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100602, "APP下载", true),
    BusinessButton(f100603, "交易记录", false),
    BusinessButton(f100604, "重置密码", true),
    BusinessButton(f100605, "免密签约授权", true),
  ];
  List<BusinessButton> b_1007 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f100702, "解除绑定", false),
    BusinessButton(f100703, "账户充值", false),
    BusinessButton(f100704, "账户余额", false),
    BusinessButton(f100705, "乘车记录", false)
  ];
  List<BusinessButton> b_1008 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f100802, "解除绑定", false),
    BusinessButton(f100803, "社保缴费", false),
    BusinessButton(f100804, "养老查询", false),
    BusinessButton(f100805, "医疗查询", false),
    BusinessButton(f100806, "公积金查询", false),
    BusinessButton(f100807, "失业查询", false),
  ];
  List<BusinessButton> b_1009 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f100902, "解除绑定", false),
    BusinessButton(f100903, "身份核实", false),
    BusinessButton(f100904, "特惠商户", false),
  ];
  List<BusinessButton> b_1010 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101002, "解除绑定", false),
    BusinessButton(f101003, "身份核实", false),
    BusinessButton(f101004, "特惠商户", false),
  ];
  List<BusinessButton> b_1011 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101102, "解除绑定", false),
    BusinessButton(f101103, "违章查询", false),
    BusinessButton(f101104, "违章缴费", false),
  ];
  List<BusinessButton> b_1012 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101202, "解除绑定", false),
    BusinessButton(f101203, "记分查询", false),
  ];
  List<BusinessButton> b_1013 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101302, "解除绑定", false),
    BusinessButton(f101303, "免密支付", false),
  ];
  List<BusinessButton> b_1014 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101402, "解除绑定", false),
    BusinessButton(f101403, "免密支付", false),
  ];
  List<BusinessButton> b_1015 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101502, "解除绑定", false),
    BusinessButton(f101503, "学历证书查询", false),
  ];
  List<BusinessButton> b_1016 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101602, "解除绑定", false),
    BusinessButton(f101603, "咪咕视频", false),
    BusinessButton(f101604, "咪咕音乐", false),
    BusinessButton(f101605, "咪咕游戏", false),
    BusinessButton(f101606, "咪咕阅读", false),
    BusinessButton(f101607, "咪咕动漫", false),
  ];
  List<BusinessButton> b_1017 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101702, "解除绑定", false),
    BusinessButton(f101703, "网络电话", false),
    BusinessButton(f101704, "和彩云", false),
    BusinessButton(f101705, "我的移动", false),
  ];
  List<BusinessButton> b_1018 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101802, "解除绑定", false),
    BusinessButton(f101803, "查看邮件", false),
    BusinessButton(f101804, "修改密码", false),
  ];
  List<BusinessButton> b_1019 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100702, "账户绑定", false),
    BusinessButton(f101902, "解除绑定", false),
    BusinessButton(f101903, "缴纳党费", false),
  ];
  List<BusinessButton> b_1020 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f100102, "申请开通", true),
    BusinessButton(f100102, "虚拟卡", true),
    BusinessButton(f102003, "交易记录", true),
  ];
  List<BusinessButton> b_1021 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f102102, "购买VIP", true),
    BusinessButton(f102103, "购买记录", true),
  ];
  List<BusinessButton> b_1022 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f102202, "公积金查询", true),
    BusinessButton(f102203, "贷款查询", false),
  ];
  List<BusinessButton> b_1023 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f102302, "账户绑定", false),
    BusinessButton(f102302, "账户解绑", false),
    BusinessButton(f102303, "物业费缴纳", false),
  ];
  List<BusinessButton> b_1024 = [
    BusinessButton(f100101, "详情", true),
    BusinessButton(f102402, "医保查询", false),
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

f100101(context, ResultBusinessList movie, bool ifsign) {
  Navigator.of(context).push(
    new MaterialPageRoute(
      builder: (context) {
        return TiedListDetail(
          ifsign: ifsign,
          status: movie.status == 1,
          businessname: movie.name,
          businessCode: movie.businessCode,
          code: movie.status == 1 ? movie.code : null,
          detailInfo: movie.status == 1 ? null : movie,
        );
      },
    ),
  );
}

/// 虚拟卡
f100102() {}

/// 交易记录
f100103() {}

/// 修改信息
f100104() {}

/// 一键挂失
f100105() {
  openlaunchUrl("url");
}

/// 身份认证
f100202() {
  alertMsg(null, "暂未开通", [], false);
}

/// 银行积分
f100302() {
  alertMsg(null, "暂未开通", [], false);
}

/// 居民卡转账
f100303() {
  alertMsg(null, "暂未开通", [], false);
}

/// 银行网点
f100304() {}

/// 缴纳话费
f100402() {
  alertMsg(null, "暂未开通", [], false);
}

/// 流量充值
f100403() {
  alertMsg(null, "暂未开通", [], false);
}

/// 积分兑换
f100404() {}

/// 交易记录
f100502() {}

/// 居民卡转账
f100503() {
  alertMsg(null, "暂未开通", [], false);
}

/// APP下载
f100602() {
  openlaunchUrl("https://p.10086.cn/info/wap/sjqb/cpb/jsym/index.html");
}

/// 交易记录
f100603() {
  alertMsg(null, "暂未开通", [], false);
}

/// 重置密码
f100604() {
  openlaunchUrl(
      "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=1&BACK_FLG=6");
}

/// 免密签约授权
f100605() {
  openlaunchUrl(
      "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=2&BACK_FLG=6");
}

/// 账户绑定/解绑
f100702() {}

/// 账户充值
f100703() {
  alertMsg(null, "暂未开通", [], false);
}

/// 账户余额
f100704() {
  alertMsg(null, "暂未开通", [], false);
}

/// 乘车记录
f100705() {
  alertMsg(null, "暂未开通", [], false);
}

/// 社保缴费
f100803() {
  alertMsg(null, "暂未开通", [], false);
}

/// 养老查询
f100804() {
  alertMsg(null, "暂未开通", [], false);
}

// 医疗查询
f100805() {
  alertMsg(null, "暂未开通", [], false);
}

/// 公积金查询
f100806() {
  alertMsg(null, "暂未开通", [], false);
}

/// 失业查询
f100807() {
  alertMsg(null, "暂未开通", [], false);
}

/// 身份核实
f100903() {
  alertMsg(null, "暂未开通", [], false);
}

/// 特惠商户
f100904() {
  alertMsg(null, "暂未开通", [], false);
}

/// 身份核实
f101003() {
  alertMsg(null, "暂未开通", [], false);
}

/// 特惠商户
f101004() {
  alertMsg(null, "暂未开通", [], false);
}

/// 违章查询
f101103() {
  alertMsg(null, "暂未开通", [], false);
}

/// 违章缴费
f101104() {
  alertMsg(null, "暂未开通", [], false);
}

/// 记分查询
f101203() {
  alertMsg(null, "暂未开通", [], false);
}

/// 免密支付
f101303() {
  alertMsg(null, "暂未开通", [], false);
}

/// 免密支付
f101403() {
  alertMsg(null, "暂未开通", [], false);
}

/// 学历证书查询
f101503() {
  alertMsg(null, "暂未开通", [], false);
}

/// 咪咕视频
f101603() {
  alertMsg(null, "暂未开通", [], false);
}

/// 咪咕音乐
f101604() {
  alertMsg(null, "暂未开通", [], false);
}

/// 咪咕游戏
f101605() {
  alertMsg(null, "暂未开通", [], false);
}

/// 咪咕阅读
f101606() {
  alertMsg(null, "暂未开通", [], false);
}

/// 咪咕动漫
f101607() {
  alertMsg(null, "暂未开通", [], false);
}

/// 网络电话
f101703() {
  alertMsg(null, "暂未开通", [], false);
}

/// 和彩云
f101704() {
  alertMsg(null, "暂未开通", [], false);
}

/// 我的移动
f101705() {
  alertMsg(null, "暂未开通", [], false);
}

/// 朋友圈
f101706() {
  alertMsg(null, "暂未开通", [], false);
}

/// 查看邮件
f101803() {
  alertMsg(null, "暂未开通", [], false);
}

/// 修改密码
f101804() {
  alertMsg(null, "暂未开通", [], false);
}

/// 缴纳党费（通过和包）
f101903() {
  alertMsg(null, "暂未开通", [], false);
}

/// 申请开通/虚拟卡
f102002() {
  alertMsg(null, "暂未开通", [], false);
}

/// 交易记录
f102003() {
  alertMsg(null, "暂未开通", [], false);
}

/// 居民卡VIP账户-购买VIP
f102102() {
  alertMsg(null, "暂未开通", [], false);
}

/// 居民卡VIP账户-购买记录
f102103() {
  alertMsg(null, "暂未开通", [], false);
}

/// 公积金账户-公积金查询
f102202() {
  alertMsg(null, "暂未开通", [], false);
}

/// 公积金账户-贷款查询
f102203() {
  alertMsg(null, "暂未开通", [], false);
}

/// 物业缴费账户-账户绑定/解绑
f102302() {
  alertMsg(null, "暂未开通", [], false);
}

/// 物业缴费账户-物业费缴纳
f102303() {
  alertMsg(null, "暂未开通", [], false);
}

/// 医疗保险账户-医保查询
f102402() {
  alertMsg(null, "暂未开通", [], false);
}

f100802() {
  alertMsg(null, "暂未开通", [], false);
}

f100902() {
  alertMsg(null, "暂未开通", [], false);
}

f101002() {
  alertMsg(null, "暂未开通", [], false);
}

f101102() {
  alertMsg(null, "暂未开通", [], false);
}

f101202() {
  alertMsg(null, "暂未开通", [], false);
}

f101302() {
  alertMsg(null, "暂未开通", [], false);
}

f101402() {
  alertMsg(null, "暂未开通", [], false);
}

f101502() {
  alertMsg(null, "暂未开通", [], false);
}

f101602() {
  alertMsg(null, "暂未开通", [], false);
}

f101702() {
  alertMsg(null, "暂未开通", [], false);
}

f101802() {
  alertMsg(null, "暂未开通", [], false);
}

f101902() {
  alertMsg(null, "暂未开通", [], false);
}
