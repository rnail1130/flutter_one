import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

BuildContext context;
setContext(context_) {
  context = context_;
}

/// 头部模板
getheader({title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: AppSize.ufp95),
    ),
  );
}

/// 弹出提示框
/// callback 回调函数
/// text1 标题
/// text2 信息
/// iftwob 是否显示取消按键 null为不显示 true为显示
alertMsg(Function callback, String text1, String text2, iftwob) {
  callback = callback != null ? callback : () {};
  text1 = text1 != null ? text1 : "提示";
  List<DialogButton> buttons = List<DialogButton>();
  if (iftwob != null) {
    buttons
      ..add(DialogButton(
        color: AppColors.text_Tide_hui,
        child: Text(
          "取消",
          style: TextStyle(color: AppColors.twhite, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      ));
  }
  buttons
    ..add(DialogButton(
      color: AppColors.themeColor,
      child: Text(
        "确定",
        style: TextStyle(color: AppColors.twhite, fontSize: 20),
      ),
      onPressed: () {
        callback();
        Navigator.pop(context);
      },
      width: 120,
    ));
  Alert(
    context: context,
    type: AlertType.warning,
    title: text1,
    desc: text2,
    buttons: buttons,
  ).show();
}

/// 弹出错误提示框
/// callback 回调函数
/// text1 标题
alertErr(Function callback, String text1) {
  Alert(
    context: context,
    type: AlertType.error,
    title: text1,
    buttons: [
      DialogButton(
        color: AppColors.themeColor,
        child: Text(
          "确定",
          style: TextStyle(color: AppColors.twhite, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        width: 120,
      )
    ],
  ).show();
}

/// 弹出 Toast 框
/// msg 提示的信息 String
showToast(msg, {int timeInSecForIos}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: timeInSecForIos == null ? 1 : timeInSecForIos,
  );
}

/// 显示 loading 遮罩
showDiog() {
  return Container(
    margin: EdgeInsets.only(top: 200.0),
    child: SizedBox(
      width: 100.0,
      height: 100.0,
      child: SpinKitCubeGrid(
        color: Colors.orange,
        size: 50.0,
      ),
    ),
  );
}

/// 校验手机号
/// str 手机号
/// @returns {boolean} 成功返回true，失败false
bool checkMobile(str) {
  var _bol = new RegExp(
          '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
      .hasMatch(str);
  if (!_bol) {
    showToast("请输入正确的手机号码");
  }
  return _bol;
}

/// 校验身份证
bool checkIdCard(str) {
  var _bol = RegExp(r'^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$')
      .hasMatch(str);

  if (!_bol) {
    showToast("请输入正确的身份证号");
  }
  return _bol;
}

/// 检验是否为邮箱
bool checkEmail(email) {
  var _bol = RegExp(
          r'^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$')
      .hasMatch(email);

  if (!_bol) {
    showToast('请输入正确的邮箱地址');
  }
  return _bol;
}

ifDefine(value) {
  if (value == null ||
      value.trim() == '' ||
      value == 'undefined' ||
      value == 'null' ||
      value == '(null)' ||
      value == 'NULL') {
    return false;
  } else {
    return true;
  }
}
