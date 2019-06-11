import 'package:flutter/material.dart';
import 'package:phone_yiyang/styles/colors.dart';

BuildContext context;
setContext(context_) {
  context = context_;
}

/// 弹出提示框
/// callback 回调函数
/// text1 标题
alertMsg(Function callback, String text1, List<String> text2, bool iftwob) {
  callback = callback != null ? callback : (index) {};
  // text1 = text1 != null ? text1 : "标题";
  List<Widget> tcontent = List();
  for (var i = 0; i < text2.length; i++) {
    tcontent..add(Text(text2[i]));
  }

  showDialog<Null>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: text1 == null ? null : Center(child: Text(text1)),
        content: tcontent.length <= 0
            ? null
            : SingleChildScrollView(
                child: ListBody(
                  children: tcontent,
                ),
              ),
        actions: [
          FlatButton(
            child: Text(
              "确定",
              style: TextStyle(color: AppColors.themeColor),
            ),
            onPressed: () {
              callback(0);
              Navigator.of(context).pop();
            },
          ),
          !iftwob
              ? null
              : FlatButton(
                  child: Text(
                    "取消",
                    style: TextStyle(color: AppColors.text_Tide_hui),
                  ),
                  onPressed: () {
                    callback(1);
                    Navigator.of(context).pop();
                  },
                )
        ],
      );
    },
  ).then((val) {
    print(val);
  });
}
