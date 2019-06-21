import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/detail_msg.dart';
import 'dart:convert';
import "package:phone_yiyang/pages/public.dart";
import 'package:phone_yiyang/pages/transactionRecord/transaction_index.dart';

//订单记录
class CardYDDetailsList extends StatefulWidget {
  String fCard;
  double balance;
  int validDays;
  String fTelephone;
  CardYDDetailsList(
      {this.balance, this.validDays, this.fTelephone, this.fCard});
  @override
  _CardYDDetailsListState createState() => _CardYDDetailsListState();
}

class _CardYDDetailsListState extends State<CardYDDetailsList> {
  Widget _mobleCouponInfoYD(context) {
    return Container(
      decoration: new BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey[300]),
          color: AppColors.twhite),
      margin: EdgeInsets.only(top: AppSize.ufp7),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Padding(
              padding:
                  EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
              child: Image.asset(
                'assets/images/tourismCard_0.png',
                height: AppSize.up3,
                width: AppSize.up3,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("居民卡移动消费券",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSize.ufp875,
                        fontWeight: FontWeight.w500)),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Text("移动消费券有效期为${widget.validDays}个自然日",
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSize.ufp75)),
                ),
                Text("移动消费券余额：${widget.balance}点",
                    style: TextStyle(
                        color: Colors.black, fontSize: AppSize.ufp75)),
              ],
            ),
            trailing: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(AppSize.ufp8125, AppSize.ufp375,
                      AppSize.ufp8125, AppSize.uf1),
                  child: Text(
                    '可用',
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return TransactionIndex(
                          cardCode: widget.fCard,
                          type: 4,
                        );
                      }),
                    );
                  },
                  child: Text(
                    "消费记录",
                    style: TextStyle(
                        color: AppColors.twhite, fontSize: AppSize.ufp6875),
                  ),
                  textColor: Colors.white,
                  color: AppColors.themeColor,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "可用商户",
                    style: TextStyle(
                        color: AppColors.twhite, fontSize: AppSize.ufp6875),
                  ),
                  textColor: Colors.white,
                  color: AppColors.themeColor,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _mobleCouponInfoData(context) {
    return Container(
      decoration: new BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey[300]),
          color: AppColors.twhite),
      margin: EdgeInsets.only(top: AppSize.ufp7),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "手机账户",
                        style: TextStyle(
                            color: Colors.black, fontSize: AppSize.ufp875),
                      ),
                      Text(
                        "${widget.fTelephone.substring(0, 3)}****${widget.fTelephone.substring(7, 11)}",
                        style: TextStyle(
                            color: Colors.black, fontSize: AppSize.ufp875),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "账户余额",
                        style: TextStyle(
                            color: Colors.black, fontSize: AppSize.ufp875),
                      ),
                      Text(
                        "${widget.balance}点",
                        style: TextStyle(
                            color: Colors.black, fontSize: AppSize.ufp875),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "订单记录",
          style: TextStyle(fontSize: AppSize.uf1),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _mobleCouponInfoYD(context),
          _mobleCouponInfoData(context),
          //分割线'
          Divider(
            height: AppSize.ubp_1,
          ),
          GetH5(businessCode: '100401'),
        ],
      ),
    );
  }
}
