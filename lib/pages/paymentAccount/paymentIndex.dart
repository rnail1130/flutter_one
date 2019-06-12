import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phone_yiyang/model/paymentAccount/paymentAccountList.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/pages/paymentAccount/paymentPay.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/refresh.dart';

ResultCurrentUser currentUser;

class PaymentIndex extends StatefulWidget {
  PaymentIndex({Key key, this.categoryCode}) : super(key: key);
  final categoryCode;
  _PaymentIndexState createState() => _PaymentIndexState();
}

class _PaymentIndexState extends State<PaymentIndex> {
  List<PaymentAccountList> paymentAccountList;
  List<bool> _listbutt = List<bool>();
  double doub52p4736 = 52.4736;
  double doub85 = 85.0;
  int pagenum = 0;
  Map desmsg = {
    "2001": "益阳市自来水有限公司",
    "2002": "国网湖南省电力有限公司益阳供电分公司",
    "2003": "益阳瑞华燃气有限公司",
    "2004": "益阳国安广播电视宽带网络有限责任公司",
    "2005": "支持全国移动、联通、电信手机号",
    "2006": "支持全国移动、联通、电信手机号",
    "2007": "中石化加油卡充值"
  };

  Widget _createListView(context) {
    if (paymentAccountList == null) {
      return showDiog();
    }
    return ListView.builder(
      itemCount:
          paymentAccountList.length > 0 ? (paymentAccountList.length * 2) : 0,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider(height: 0.0);
        }
        index = index ~/ 2;
        PaymentAccountList movies = paymentAccountList[index];
        if (_listbutt.length <= index) {
          _listbutt.add(false);
        }
        var _icon = _listbutt[index]
            ? Icon(Icons.expand_less, color: AppColors.test95a)
            : Icon(Icons.expand_more, color: AppColors.test95a);
        return Container(
          decoration: new BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey[300]),
              color: AppColors.twhite),
          margin: EdgeInsets.only(top: AppSize.ufp7),
          child: ExpansionTile(
              onExpansionChanged: (bol) {
                setState(() {
                  if (bol)
                    _listbutt[index] = true;
                  else
                    _listbutt[index] = false;
                });
              },
              backgroundColor: Colors.white,
              leading: Padding(
                padding:
                    EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
                child: Image.asset(
                  'assets/paymentimg/account_${movies.categoryCode}.png',
                  height: doub52p4736,
                  width: doub52p4736,
                ),
              ),
              title: Padding(
                padding:
                    EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(movies.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: AppSize.ufp875,
                            fontWeight: FontWeight.w500)),
                    Text(desmsg[movies.categoryCode],
                        style: TextStyle(
                            color: AppColors.text_Tide_hui,
                            fontSize: AppSize.ufp75,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              trailing: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.ufp8125, AppSize.ufp75, AppSize.ufp8125, 0.0),
                      child: Text(movies.status > 0 ? '已绑定' : '未绑定',
                          style: TextStyle(
                              fontSize: AppSize.ufp625,
                              color: movies.status > 0
                                  ? AppColors.text_Tide_87c87f
                                  : AppColors.test95a))),
                  _icon,
                ],
              ),
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
                      child: Container(
                        width: doub85,
                        child: RaisedButton(
                          padding: EdgeInsets.all(1),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          color: AppColors.themeColor,
                          child: Text(
                            "缴费",
                            style: TextStyle(
                                color: AppColors.twhite,
                                fontSize: AppSize.ufp6875),
                          ),
                          onPressed: () => gotopay(movies.businessCode,
                              movies.name, movies.categoryCode),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
                      child: Container(
                        width: doub85,
                        child: RaisedButton(
                          padding: EdgeInsets.all(1),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          color: AppColors.themeColor,
                          child: Text(
                            "绑定缴费",
                            style: TextStyle(
                                color: AppColors.twhite,
                                fontSize: AppSize.ufp6875),
                          ),
                          onPressed: () => gotobinding(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
                      child: Container(
                        width: doub85,
                        child: RaisedButton(
                          padding: EdgeInsets.all(1),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          color: AppColors.themeColor,
                          child: Text(
                            "缴费记录",
                            style: TextStyle(
                                color: AppColors.twhite,
                                fontSize: AppSize.ufp6875),
                          ),
                          onPressed: () => gotorecord(),
                        ),
                      ),
                    )
                  ],
                )
              ]),
        );
      },
    );
  }

  // 缴费
  gotopay(businessCode, name, categoryCode) {
    if (currentUser != null) {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Paymentjbh(
                businessCode: businessCode,
                name: name,
                categoryCode: categoryCode)),
      );
    } else {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  // 绑定缴费
  gotobinding() {}
  // 缴费记录
  gotorecord() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缴费账户"),
      ),
      body: easyRefresh(_createListView(context), () async {
        LocalStorage.getjson("currentUser", (data) {
          if (data != null) currentUser = ResultCurrentUser.fromJson(data);
          pagenum = 1;
          GetPageData.getPaymentAccountList(pagenum, widget.categoryCode,
              (data) {
            var paymentAccountListD =
                PaymentAccountListD.fromJson(data.toString());
            setState(() {
              paymentAccountList = paymentAccountListD.result;
            });
          });
        });
      }, () async {
        pagenum++;
        GetPageData.getPaymentAccountList(pagenum, widget.categoryCode, (data) {
          var paymentAccountListD =
              PaymentAccountListD.fromJson(data.toString());
          setState(() {
            paymentAccountList.addAll(paymentAccountListD.result);
          });
        });
      }, true),
    );
  }

  @override
  void initState() {
    // LocalStorage.getjson("currentUser", (data) {
    //   if (data != null) currentUser = ResultCurrentUser.fromJson(data);
    //   pagenum = 1;
    //   GetPageData.getPaymentAccountList(pagenum, widget.categoryCode, (data) {
    //     var paymentAccountListD = PaymentAccountListD.fromJson(data.toString());
    //     setState(() {
    //       paymentAccountList = paymentAccountListD.result;
    //     });
    //   });
    // });
  }
}

class GetPageData {
  static getPaymentAccountList(
      int pagenum, categoryCode, Function callback) async {
    var cardNo = '';
    if (currentUser != null) {
      cardNo = currentUser.fCard.toString();
    }
    var res = await httpManager.netFetch(
        hostAddres.getPaymentAccountList(),
        {
          'cardNo': cardNo,
          'categoryCode': categoryCode != null ? categoryCode : "",
          'pageIndex': pagenum,
          'status': " "
        },
        null,
        null);
    callback(res.data);
  }
}
