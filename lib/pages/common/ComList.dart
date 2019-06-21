import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_index.dart';
import 'package:phone_yiyang/pages/join/join_index.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/pages/tabFrist/hub.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'DeatilPage.dart';

class ComPage extends StatelessWidget {
  final String colors;
  final String title;
  final List more;
  ComPage(this.colors, this.title, this.more);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Giews(this.colors, this.title, this.more),
    );
  }
}

class Giews extends StatelessWidget {
  final String colors;
  final String title;
  final List more;
  Giews(this.colors, this.title, this.more);

  @override
  Widget build(BuildContext context) {
    //点击事件
    void jumpPage(String name, String isJump, String url, String isCheck) async {
      if(name == "办件查询"){
        Alert(
          context: context,
          type: AlertType.info,
          style: AlertStyle(
              animationType: AnimationType.grow
          ),
          title: "提示",
          desc: "该功能尚未完全开放",
          buttons: [
            DialogButton(
              child: Text(
                "确定",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            ),
          ],
        ).show();
        return;
      }
      //点击之前判断是否登陆
      if (isCheck == "true") {
        LocalStorage.getstring('currentUser', (data) {
          if (data == null) {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => login()),
            );
            return;
          } else {
            if (isJump == "true") {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => Deatile(
                      name,
                      url: url,
                    )),
              );
            } else {
              if (name == "票券服务") {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => CardBagIndex()),
                );
              } else
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => hub(name, url: url)),
                );
            }
          }
        });
      } else {
        if (isJump == "true") {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Deatile(
                  name,
                  url: url,
                )),
          );
        } else {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => hub(name, url: url)),
          );
        }
      }
    }

    List<Widget> createWidget() {
      List<Widget> con = [];

      for (var i = 0; i < this.more.length; i++) {
        con.add(InkWell(
            onTap: () {
              jumpPage(this.more[i]["title"], this.more[i]["isJump"],this.more[i]["url"],this.more[i]["ischeck"]);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    this.more[i]["img"],
                    width: 45.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    this.more[i]["title"],
                    style: TextStyle(fontSize: 12.0),
                  )
                ],
              ),
            )));
      }
      return con;
    }

    Widget _WidgetBuild() {
      return GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 0.0,
          children: createWidget());
    }

    return Container(
        //  height: 320.0,
        //color: Colors.green,
        width: double.infinity,
        child: _WidgetBuild());
  }
}
