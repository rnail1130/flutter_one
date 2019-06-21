import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/styles/fontSize.dart';

/// 签约商户
class SigningBusinessman_index extends StatelessWidget {
  final String name;
  SigningBusinessman_index(this.name);
  List<String> title = ['美食', "购物", "休闲娱乐", "生活服务", "丽人"];
  List<Widget> creatBuild() {
    List<Widget> con = [];
    title.forEach((item) {
      con.add(Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
        child: Text(
          item,
          style: TextStyle(fontFamily: "alr", fontSize: 14.0),
        ),
      ));
    });
    return con;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: getheader(this.name,
            actions: <Widget>[
              FlatButton(
                child: Text("附近", style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ],
            leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: creatBuild())),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nodatas.png",
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "暂无数据",
                    style: TextStyle(
                        fontSize: 14, fontFamily: "alr", color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nodatas.png",
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "暂无数据",
                    style: TextStyle(
                        fontSize: 14, fontFamily: "alr", color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nodatas.png",
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "暂无数据",
                    style: TextStyle(
                        fontSize: 14, fontFamily: "alr", color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nodatas.png",
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "暂无数据",
                    style: TextStyle(
                        fontSize: 14, fontFamily: "alr", color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nodatas.png",
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "暂无数据",
                    style: TextStyle(
                        fontSize: 14, fontFamily: "alr", color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
