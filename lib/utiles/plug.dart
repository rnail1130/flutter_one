import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

/// 打开一个网页或打开手机短信或打开电话
/// 打开网页直接传 http 
/// 发送短信 sms:sms?body=body  sms:电话号,body:要短信的信息
/// 调起电话 tel:tel tel:电话号
openWithBrowser(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
/// 调起外部App
/// scheme 苹果应用的 scheme
/// ssbdapp 安卓应用的 ssbdapp
/// url 调起失败后跳转的应用下载地址
openAppurl(scheme, ssbdapp, url) async {
  if (await canLaunch(url)) {
    try {
      if (Platform.isIOS) {
        await launch("scheme:$scheme");
      } else if (Platform.isAndroid) {
        await launch("ssbdapp:$ssbdapp");
      }
    } catch (e) {
      await launch(url);
    }
  } else {
    throw 'Could not launch $url';
  }
}
