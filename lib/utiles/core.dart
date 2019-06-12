import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

BuildContext context;
setContext(context_) {
  context = context_;
}

/// 弹出提示框
/// callback 回调函数
/// text1 标题
alertMsg(Function callback, String text1, String text2, iftwob) {
  callback = callback != null ? callback : () {};
  text1 = text1 != null ? text1 : "";
  Alert(
    context: context,
    type: AlertType.info,
    title: text1,
    desc: text2,
    buttons: [
      DialogButton(
        child: Text(
          "COOL",
          style: TextStyle(color: AppColors.text_Tide_hui, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      ),
      DialogButton(
        child: Text(
          "确定",
          style: TextStyle(color: AppColors.themeColor, fontSize: 20),
        ),
        onPressed: () {
          callback();
          Navigator.pop(context);
        },
        width: 120,
      )
    ],
  ).show();
}

showDiog() {
  return Container(
    margin: EdgeInsets.only(top: 200.0),
    child: SizedBox(
      width: 100.0,
      height: 100.0,
      child: SpinKitFadingCircle(
        color: Colors.black,
        size: 30.0,
      ),
    ),
  );
}
