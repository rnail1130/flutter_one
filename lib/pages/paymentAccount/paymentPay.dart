import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/login/registered.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/core.dart' as prefix0;

class Paymentjbh extends StatefulWidget {
  Paymentjbh({Key key, this.businessCode, this.name, this.categoryCode})
      : super(key: key);
  final businessCode;
  final name;
  final categoryCode;
  _PaymentjbhState createState() => _PaymentjbhState();
}

class _PaymentjbhState extends State<Paymentjbh> {
  var _controller;
  Map desmsg = {
    "2001": "益阳市自来水有限公司",
    "2002": "国网湖南省电力有限公司益阳供电分公司",
    "2003": "益阳瑞华燃气有限公司",
    "2004": "益阳国安广播电视宽带网络有限责任公司",
    "2005": "支持全国移动、联通、电信手机号",
    "2006": "支持全国移动、联通、电信手机号",
    "2007": "中石化加油卡充值"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("缴费账户"),
        ),
        body: Container(
          color: AppColors.themebody,
          child: Column(
            children: <Widget>[
              Container(
                color: AppColors.twhite,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(AppSize.upp9375, AppSize.up1,
                      AppSize.upp9375, AppSize.up1),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                          "assets/paymentimg/account_${widget.categoryCode}.png",
                          width: AppSize.up2,
                          height: AppSize.up2),
                      Padding(
                        padding: EdgeInsets.only(left: AppSize.up1),
                        child: Text(
                          desmsg[widget.categoryCode],
                          style: TextStyle(fontSize: AppSize.ufp875),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1.0),
              Container(
                color: AppColors.twhite,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(AppSize.upp9375, AppSize.up1,
                      AppSize.upp9375, AppSize.up1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("缴费单位", style: TextStyle(fontSize: AppSize.ufp875)),
                      Text("${widget.name}",
                          style: TextStyle(fontSize: AppSize.ufp875)),
                    ],
                  ),
                ),
              ),
              Divider(height: 1.0),
              SizedBox(
                height: AppSize.up1p0625,
              ),
              Divider(height: 1.0),
              Container(
                color: AppColors.twhite,
                padding: EdgeInsets.fromLTRB(
                    AppSize.upp875, 0.0, AppSize.upp875, 0.0),
                child: Row(
                  children: <Widget>[
                    Text("手机号码", style: TextStyle(fontSize: AppSize.ufp875)),
                    Text("*", style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (registered) {
                          _controller = registered;
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: AppSize.ufp875,
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
                  ],
                ),
              ),
              Divider(height: 1.0),
              SizedBox(
                height: AppSize.up2p5,
              ),
              RaisedButton(
                color: AppColors.themeColor,
                disabledColor: AppColors.themeColor,
                padding: EdgeInsets.fromLTRB(150.0, 15.0, 150.0, 15.0),
                shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "确定",
                  style:
                      TextStyle(color: AppColors.twhite, fontSize: AppSize.uf1),
                ),
                onPressed: () {
                  if (widget.businessCode == "200501" ||
                      widget.businessCode == "200601" ||
                      widget.businessCode == "200701") {
                  } else {
                    alertMsg(null, "", "暂未开通",null);
                  }
                  print(_controller);
                },
              ),
            ],
          ),
        ));
  }
}
