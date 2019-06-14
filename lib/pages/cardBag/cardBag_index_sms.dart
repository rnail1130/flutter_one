import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/styles/colors.dart';

/// 选择移动消费券兑换但档位
class SmsContent extends StatefulWidget {
  SmsContent({Key key}) : super(key: key);
  _SmsContentState createState() => _SmsContentState();
}

class _SmsContentState extends State<SmsContent> {
  List<SmsContentEntity> _smsllist;
  var _smsKey;
  @override
  void initState() {
    const SMS_CON = [500, 1000, 2000, 5000, 10000, 20000];
    _smsllist = List();
    for (int i = 0; i < SMS_CON.length; i++) {
      _smsllist.add(
        SmsContentEntity(SMS_CON[i], Colors.white, Colors.black),
      );
    }
  }

  /// 选中函数
  _smsllisteach(that) {
    setState(() {
      _smsKey = that;
      _smsllist.forEach((index) {
        if (index.smsContentName == that) {
          index.smsContentColor = AppColors.themeColor;
          index.smstextColor = Colors.white;
        } else {
          index.smsContentColor = Colors.white;
          index.smstextColor = Colors.black;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      title: Center(
        child: Text(
          '选择移动消费券兑换档位',
          style: TextStyle(fontSize: AppSize.uf1, fontWeight: FontWeight.bold),
        ),
      ),
      children: <Widget>[
        Column(
          children: _smsllist.map((index) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 1.0,
                ),
                Container(
                  color: index.smsContentColor,
                  child: ListTile(
                    title: Center(
                        child: Text(
                      '${index.smsContentName}点移动消费券',
                      style: TextStyle(
                          fontSize: AppSize.ufp9375, color: index.smstextColor),
                    )),
                    onTap: () {
                      _smsllisteach(index.smsContentName);
                    },
                  ),
                )
              ],
            );
          }).toList(),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.grey,
              child: ListTile(
                title: Center(
                  child:
                      Text('取消', style: TextStyle(fontSize: AppSize.ufp9375)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            )),
            Expanded(
                child: Container(
              color: AppColors.themeColor,
              child: ListTile(
                title: Center(
                  child: Text(
                    '兑换',
                    style: TextStyle(
                        color: Colors.white, fontSize: AppSize.ufp9375),
                  ),
                ),
                onTap: () {
                  print(_smsKey);
                  Navigator.of(context).pop();
                },
              ),
            )),
          ],
        )
      ],
    );
  }
}

/// 兑换消费券实体
class SmsContentEntity {
  var smsContentName;
  Color smsContentColor;
  Color smstextColor;
  SmsContentEntity(
      this.smsContentName, this.smsContentColor, this.smstextColor);
}
