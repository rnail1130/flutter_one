import 'package:flutter/material.dart';
import 'package:phone_yiyang/utiles/core.dart';

class TiedCardAccount_shopList extends StatefulWidget {
  TiedCardAccount_shopList({Key key}) : super(key: key);

  _TiedCardAccount_shopListState createState() =>
      _TiedCardAccount_shopListState();
}

class _TiedCardAccount_shopListState extends State<TiedCardAccount_shopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getheader(title: "购买记录"),
      body: Text("goumaijilu"),
    );
  }
}
