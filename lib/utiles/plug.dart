import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

/// 打开一个网页
openlaunchUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

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
