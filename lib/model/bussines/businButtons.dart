import 'package:flutter/material.dart';
import 'business_list.dart';
import '../../pages/TiedCardAccount/TiedListDetail.dart';

class BusinessButtons {
  List<BusinessButton> butt;
  Widget msgH5;
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
  Widget m_1001 = Container(
    child: Text("1001"),
  );
  Widget m_1002 = Container(
    child: Text("1002"),
  );
  Widget m_1003 = Container(
    child: Text("1003"),
  );
  Widget m_1004 = Container(
    child: Text("1004"),
  );
  Widget m_1005 = Container(
    child: Text("1005"),
  );
  Widget m_1006 = Container(
    child: Text("1006"),
  );
  Widget m_1007 = Container(
    child: Text("1007"),
  );
  Widget m_1008 = Container(
    child: Text("1008"),
  );
  Widget m_1009 = Container(
    child: Text("1009"),
  );
  Widget m_1010 = Container(
    child: Text("1010"),
  );
  Widget m_1011 = Container(
    child: Text("1011"),
  );
  Widget m_1012 = Container(
    child: Text("1012"),
  );
  Widget m_1013 = Container(
    child: Text("1013"),
  );
  Widget m_1014 = Container(
    child: Text("1014"),
  );
  Widget m_1015 = Container(
    child: Text("1015"),
  );
  Widget m_1016 = Container(
    child: Text("1016"),
  );
  Widget m_1017 = Container(
    child: Text("1017"),
  );
  Widget m_1018 = Container(
    child: Text("1018"),
  );
  Widget m_1019 = Container(
    child: Text("1019"),
  );
  Widget m_1020 = Container(
    child: Text("1020"),
  );
  Widget m_1021 = Container(
    child: Text("1021"),
  );
  Widget m_1022 = Container(
    child: Text("1022"),
  );
  Widget m_1023 = Container(
    child: Text("1023"),
  );
  Widget m_1024 = Container(
    child: Text("1024"),
  );
  BusinessButtons.fromget(code) {
    switch (code) {
      case '1001':
        this.butt = this.b_1001;
        this.msgH5 = this.m_1001;
        break;
      case '1002':
        this.butt = this.b_1002;
        this.msgH5 = this.m_1002;
        break;
      case '1003':
        this.butt = this.b_1003;
        this.msgH5 = this.m_1003;
        break;
      case '1004':
        this.butt = this.b_1004;
        this.msgH5 = this.m_1004;
        break;
      case '1005':
        this.butt = this.b_1005;
        this.msgH5 = this.m_1005;
        break;
      case '1006':
        this.butt = this.b_1006;
        this.msgH5 = this.m_1006;
        break;
      case '1007':
        this.butt = this.b_1007;
        this.msgH5 = this.m_1007;
        break;
      case '1008':
        this.butt = this.b_1008;
        this.msgH5 = this.m_1008;
        break;
      case '1009':
        this.butt = this.b_1009;
        this.msgH5 = this.m_1009;
        break;
      case '1010':
        this.butt = this.b_1010;
        this.msgH5 = this.m_1010;
        break;
      case '1011':
        this.butt = this.b_1011;
        this.msgH5 = this.m_1011;
        break;
      case '1012':
        this.butt = this.b_1012;
        this.msgH5 = this.m_1012;
        break;
      case '1013':
        this.butt = this.b_1013;
        this.msgH5 = this.m_1013;
        break;
      case '1014':
        this.butt = this.b_1014;
        this.msgH5 = this.m_1014;
        break;
      case '1015':
        this.butt = this.b_1015;
        this.msgH5 = this.m_1015;
        break;
      case '1016':
        this.butt = this.b_1016;
        this.msgH5 = this.m_1016;
        break;
      case '1017':
        this.butt = this.b_1017;
        this.msgH5 = this.m_1017;
        break;
      case '1018':
        this.butt = this.b_1018;
        this.msgH5 = this.m_1018;
        break;
      case '1019':
        this.butt = this.b_1019;
        this.msgH5 = this.m_1019;
        break;
      case '1020':
        this.butt = this.b_1020;
        this.msgH5 = this.m_1020;
        break;
      case '1021':
        this.butt = this.b_1021;
        this.msgH5 = this.m_1021;
        break;
      case '1022':
        this.butt = this.b_1022;
        this.msgH5 = this.m_1022;
        break;
      case '1023':
        this.butt = this.b_1023;
        this.msgH5 = this.m_1023;
        break;
      case '1024':
        this.butt = this.b_1024;
        this.msgH5 = this.m_1024;
    }
  }
}

class BusinessButton {
  Function fun;
  String name;
  bool isonclick;
  BusinessButton(this.fun, this.name, this.isonclick);
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
f100102() {}
f100103() {}
f100104() {}
f100105() {}
f100202() {}
f100302() {}
f100303() {}
f100304() {}
f100402() {}
f100403() {}
f100404() {}
f100502() {}
f100503() {}
f100602() {}
f100603() {}
f100604() {}
f100605() {}
f100702() {}
f100703() {}
f100704() {}
f100705() {}
f100803() {}
f100804() {}
f100805() {}
f100806() {}
f100807() {}
f100903() {}
f100904() {}
f101003() {}
f101004() {}
f101103() {}
f101104() {}
f101203() {}
f101303() {}
f101403() {}
f101503() {}
f101603() {}
f101604() {}
f101605() {}
f101606() {}
f101607() {}
f101703() {}
f101704() {}
f101705() {}
f101706() {}
f101803() {}
f101804() {}
f101903() {}
f102002() {}
f102003() {}
f102102() {}
f102103() {}
f102202() {}
f102203() {}
f102302() {}
f102303() {}
f102402() {}
f100802() {}
f100902() {}
f101002() {}
f101102() {}
f101202() {}
f101302() {}
f101402() {}
f101502() {}
f101602() {}
f101702() {}
f101802() {}
f101902() {}
