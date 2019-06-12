//跳转的中转
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabThird/user.dart';
import 'package:phone_yiyang/pages/tabThird/userUse.dart';

import 'chat.dart';
import 'checkDeil.dart';
import 'editEmail.dart';
import 'editJmkPass.dart';
import 'editXnkPass.dart';
import 'lostCall.dart';
class hubThird extends StatefulWidget {
  final String name;
  final String url;

  hubThird(this.name,{this.url});

  @override
  _hubState createState() => _hubState();
}

class _hubState extends State<hubThird> {
  _hubHome(){
    switch(this.widget.name){
      case "个人信息":
        return user();
        break;
      case "修改邮箱":
        return editEmail();
        break;
      case "用户手册":
        return userUse();
        break;
      case "修改智慧益阳app密码":
        return editPass();
        break;
      case "修改虚拟卡支付密码":
        return editxPass();
        break;
      case "居民卡一键挂失":
        return lostCall();
        break;

    }
  }
  _buildScaffold(){
    switch(this.widget.name){
      case "交易查询":
        return checkDeil(this.widget.name);
        break;
      case "客户服务":
        return chats(this.widget.name);
        break;
      default:
       return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
              title: Text(
                this.widget.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0, color: Colors.white,fontFamily: "alm"),
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
          ),
          body: _hubHome(),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }
}
