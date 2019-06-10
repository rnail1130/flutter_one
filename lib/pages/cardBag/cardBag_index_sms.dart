import 'package:flutter/material.dart';
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
      _smsllist.add(SmsContentEntity(SMS_CON[i], Colors.white));
    }
  }
  /// 选中函数
  _smsllisteach(that) {
    setState(() {
      _smsKey = that;
      _smsllist.forEach((index) {
        if (index.smsContentName == that) {
          index.smsContentColor = AppColors.themeColor;
        } else {
          index.smsContentColor = Colors.white;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      title: new Text('选择移动消费券兑换档位'),
      children: <Widget>[
        Column(
          children: _smsllist.map((index) {
            return Container(
              color: index.smsContentColor,
              child: ListTile(
                title: Center(child: Text('${index.smsContentName}点移动消费券222')),
                onTap: () {
                  _smsllisteach(index.smsContentName);
                },
              ),
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
                      child: Text('取消'),
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
                        style: TextStyle(color: Colors.white),
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

  SmsContentEntity(this.smsContentName, this.smsContentColor);
}
