import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/detail_msg.dart';

class YdjfXiaoFei extends StatefulWidget {
  final titleName;
  YdjfXiaoFei(this.titleName);
  _YdjfXiaoFeiState createState() => _YdjfXiaoFeiState();
}

class _YdjfXiaoFeiState extends State<YdjfXiaoFei> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset(
          "assets/images/header_bg.png",
          height: 130.0,
          fit: BoxFit.cover,
        ),
        GetH5(businessCode: '100401', titleName: widget.titleName),
      ],
    );
  }
}
