//跳转的中转
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabSecond/xuniInfo.dart';

class tabShub extends StatefulWidget {
  final String name;
  final String url;
  final String id;

  tabShub(this.name, {this.url,this.id});

  @override
  _hubState createState() => _hubState();
}

class _hubState extends State<tabShub> {
  _hubHome() {
    switch (this.widget.name) {
      case "虚拟卡基本信息":
        return userinfo();
        break;
    }
  }
  _buildScaffold(){
    switch(this.widget.name){
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
