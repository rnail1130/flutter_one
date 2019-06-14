//跳转的中转
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/join/join_index.dart';
import 'package:phone_yiyang/pages/tabFrist/juminka/transaction_record.dart';
import 'package:phone_yiyang/pages/tabFrist/juminka/ydjf_xiaofei.dart';
import 'package:phone_yiyang/pages/tabFrist/landscape/landscapeIndex.dart';
import 'package:phone_yiyang/pages/tabFrist/zhengwubianminfuwu/findPage.dart';
import 'package:phone_yiyang/pages/tabFrist/zhengwubianminfuwu/government.dart';

class hub extends StatefulWidget {
  final String name;
  final String url;

  hub(this.name, {this.url});

  @override
  _hubState createState() => _hubState();
}

class _hubState extends State<hub> {
  _hubHome() {
    switch (this.widget.name) {
      case "政务查询":
        return government();
        break;
      case "不动产登记查询":
        return find('请输入公民身份证号码');
        break;
      case "单位医保参保查询":
        return find('请输入业务系统单位编码');
        break;
      case "个人医保参保查询":
        return find('请输入公民身份证号码');
        break;
      case "个人公积金查询":
        return find('请输入公民身份证号码');
        break;
      case "单位失业查询":
        return find('请输入业务系统单位编码');
        break;
      case "个人失业查询":
        return find('请输入公民身份证号码');
        break;
      case "单位工伤查询":
        return find('请输入业务系统单位编码');
        break;
      case "个人工伤查询":
        return find('请输入公民身份证号码');
        break;
      case "交易查询":
        return TransactionRecord(widget.name);
        break;
      case "移动积分消费":
        return YdjfXiaoFei(widget.name);
        break;
      case "益阳时政":
        return LandscapeIndex(widget.name, '1');
        break;
      case "益阳新闻":
        return LandscapeIndex(widget.name, '2');
        break;
      case "益阳文化":
        return LandscapeIndex(widget.name, '3');
        break;
      case "益阳旅游":
        return LandscapeIndex(widget.name, '4');
        break;
      case "申请加入":
        return join_index();
        break;
      case "移动积分消费":
        return YdjfXiaoFei(widget.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.widget.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: _hubHome(),
    );
  }
}
