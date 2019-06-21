export 'package:phone_yiyang/utiles/getHost.dart';
export 'package:phone_yiyang/utiles/net/api.dart';
export 'package:phone_yiyang/utiles/refresh.dart';
export 'package:phone_yiyang/styles/fontSize.dart';
export 'package:phone_yiyang/styles/colors.dart';
export 'package:phone_yiyang/styles/colorQ.dart';
export 'package:phone_yiyang/styles/colorZ.dart';
export 'package:phone_yiyang/model/currentUser.dart';
export 'package:phone_yiyang/utiles/core.dart';
export 'package:phone_yiyang/utiles/LocalStorage.dart';

import 'package:flutter/material.dart';
import 'package:phone_yiyang/model/currentUser.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';

var currentUser;

/// context 上下文信息：必传
/// iflogin 如果没有登录信息是否跳转登录
/// callback 需要执行的回调方法返回 bool true:已登录，false：未登录
getcurrentUser(context, {iflogin, callback}) {
  if (currentUser == null) {
    LocalStorage.getjson("currentUser", (data) {
      if (data != null) {
        currentUser = ResultCurrentUser.fromJson(data);
        callback(true);
      } else if (callback != null) {
        callback(false);
      } else if (iflogin == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login()));
      }
    });
  } else if (callback != null) {
    callback();
  } else if (iflogin == true) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }
}
