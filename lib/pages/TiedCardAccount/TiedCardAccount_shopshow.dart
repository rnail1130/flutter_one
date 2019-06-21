import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/detail_msg.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/core.dart';

class TiedCardAccount_shopshow extends StatefulWidget {
  TiedCardAccount_shopshow({Key key}) : super(key: key);

  _TiedCardAccount_shopshowState createState() =>
      _TiedCardAccount_shopshowState();
}

class _TiedCardAccount_shopshowState extends State<TiedCardAccount_shopshow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购买须知"),
      ),
      body: ListView(
        children: <Widget>[
          GetH5(businessCode: "102101", ifsgin: true),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: mt20, bottom: mt20),
            child: RaisedButton(
              padding: EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 10.0),
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: AppColors.themeColor,
              child: Text(
                "已了解并确认购买",
                style: rstyle,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TiedCardAccount_getphone()));
              },
            ),
          ))
        ],
      ),
    );
  }
}

class TiedCardAccount_getphone extends StatefulWidget {
  TiedCardAccount_getphone({Key key}) : super(key: key);

  _TiedCardAccount_getphoneState createState() =>
      _TiedCardAccount_getphoneState();
}

class _TiedCardAccount_getphoneState extends State<TiedCardAccount_getphone> {
  var numbu = "0";
  var _phone;
  var _code;

  @override
  void initState() {
    GetPageData.getdata((data) {
      var d = json.decode(data)["d"];
      setState(() {
        var result = d["Result"];
        numbu = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themebody,
      appBar: getheader("购买VIP账户"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                AppSize.upp875, AppSize.up1p5, AppSize.upp875, AppSize.up1),
            child: Text(
              "居民卡VIP用户年费",
              style: TextStyle(
                  color: AppColors.themeColor, fontSize: AppSize.ufp9375),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: AppSize.upp875, right: AppSize.upp875),
            child: Text(
              "价格：${numbu}点居民卡移动消费券",
              style: TextStyle(fontSize: AppSize.ufp9375),
            ),
          ),
          SizedBox(height: AppSize.up1p25),
          Divider(height: 1.0),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: AppSize.upp875),
                    Text("手机号", style: TextStyle(fontSize: AppSize.ufp8125)),
                    SizedBox(width: AppSize.up2p5),
                    Expanded(
                      child: TextField(
                        onChanged: (registered) {
                          _phone = registered;
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: AppSize.ufp9,
                        ),
                        decoration: InputDecoration(
                          labelText: "请输入手机号码",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSize.upp875),
                  ],
                ),
                Divider(height: 1.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: AppSize.upp875),
                    Text("验证码", style: TextStyle(fontSize: AppSize.ufp8125)),
                    SizedBox(width: AppSize.up2p5),
                    Expanded(
                      child: TextField(
                        onChanged: (registered) {
                          _phone = registered;
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: AppSize.ufp9,
                        ),
                        decoration: InputDecoration(
                          labelText: "请输入验证码",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: AppColors.themeColor,
                      textColor: AppColors.twhite,
                      child: Text("获取验证码"),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      onPressed: () {
                        GetPageData.getphonecode((data) {
                          var d = json.decode(data)["d"];
                          if (d["Code"] > 0) {
                            alertErr(null, d["Msg"]);
                          } else {
                            showToast("验证码发送成功");
                          }
                        }, _phone);
                      },
                    ),
                    SizedBox(width: AppSize.up1p4),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1.0),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(120.0, 13.0, 120.0, 13.0),
                color: AppColors.themeColor,
                textColor: AppColors.twhite,
                child: Text("立即购买"),
                shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetPageData {
  static getdata(Function callback) async {
    var res = await httpManager.netFetch(
        hostAddres.getConsumePoints(), {}, null, null);
    callback(res.data);
  }

  static getphonecode(Function callback, _phone) async {
    var res = await httpManager.netFetch(
        hostAddres.sendConsumeValidCode(),
        {"cardCode": currentUser.fCard.toString(), "mobileNo": _phone},
        null,
        null);
    callback(res.data);
  }
}
