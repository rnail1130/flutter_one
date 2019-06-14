import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/pages/public.dart' as prefix0;

class join_index extends StatelessWidget {
  const join_index({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setContext(context);
    var _merchantName;
    var _contactsName;
    var _contactsPhone;
    var _email;
    onclick() {
      if (ifDefine(_merchantName) && ifDefine(_contactsName)) {
        if (checkMobile(_contactsPhone) && checkEmail(_email)) {
          GetPageData.getdata((data) {
            final _res = json.decode(data)["d"];
            if (_res["Code"] == 0) {
              showToast("提交成功", timeInSecForIos: 2);
              new Timer(new Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            } else {
              alertErr(() {
                onclick();
              }, _res["Msg"]);
            }
          }, _merchantName, _contactsName, _contactsPhone, _email);
        }
      } else {
        prefix0.alertMsg(null, null, "请输入提交信息", null);
      }
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: AppSize.upp875),
                  Text("商户名称", style: TextStyle(fontSize: AppSize.ufp9)),
                  Text("*", style: TextStyle(color: Colors.red[900])),
                  SizedBox(width: AppSize.up2p5),
                  Expanded(
                    child: TextField(
                      onChanged: (registered) {
                        _merchantName = registered;
                      },
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: AppSize.ufp9,
                      ),
                      decoration: InputDecoration(
                        labelText: "请输入商户名称",
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
                  Text("联系人", style: TextStyle(fontSize: AppSize.ufp9)),
                  Text("*　", style: TextStyle(color: Colors.red[900])),
                  SizedBox(width: AppSize.up2p5),
                  Expanded(
                    child: TextField(
                      onChanged: (registered) {
                        _contactsName = registered;
                      },
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: AppSize.ufp9,
                      ),
                      decoration: InputDecoration(
                        labelText: "请输入联系人姓名",
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
                  Text("手机号码", style: TextStyle(fontSize: AppSize.ufp9)),
                  Text("*", style: TextStyle(color: Colors.red[900])),
                  SizedBox(width: AppSize.up2p5),
                  Expanded(
                    child: TextField(
                      onChanged: (registered) {
                        _contactsPhone = registered;
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
                  Text("邮箱", style: TextStyle(fontSize: AppSize.ufp9)),
                  Text("*　　", style: TextStyle(color: Colors.red[900])),
                  SizedBox(width: AppSize.up2p5),
                  Expanded(
                    child: TextField(
                      onChanged: (registered) {
                        _email = registered;
                      },
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: AppSize.ufp9,
                      ),
                      decoration: InputDecoration(
                        labelText: "请输入邮箱地址",
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
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.fromLTRB(120.0, 13.0, 120.0, 13.0),
              color: AppColors.themeColor,
              textColor: AppColors.twhite,
              child: Text("提交"),
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              onPressed: onclick,
            ),
          ),
        )
      ],
    );
  }
}

class GetPageData {
  static getdata(Function callback, merchantName, contactsName, contactsPhone,
      email) async {
    var res = await httpManager.netFetch(
        hostAddres.getMerchantsApply(),
        {
          "merchantName": merchantName,
          "contactsName": contactsName,
          "contactsPhone": contactsPhone,
          "email": email
        },
        null,
        null);
    callback(res.data);
  }
}
