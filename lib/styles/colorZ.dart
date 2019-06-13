import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/public.dart';
//文本样式
class AppContent {
  static var smallTextSize = AppSize.ufp8;
  static var minTextSize = AppSize.ufp6875;
  static const basic = 17.4912;
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const moreminTextSize = 11.0;
  static const normalText = TextStyle(
    color: Colors.white,
  );

  //底部导航样式
  static const sizeIcon = 20.0;
  static var bottomTextSize = TextStyle(
    fontSize: minTextSize,
  );

  //首页标题样式---------title
  static const moreMinText = TextStyle(
      color: Colors.blue,
      fontSize: moreminTextSize,
      fontWeight: FontWeight.w700);
  static const middleMinText = TextStyle(
    color: Colors.white,
    fontSize: middleTextWhiteSize,
  );
  static const imagesWidth = basic;
  //首页标题样式---------top(绑卡账户......)
  static const borderWidth = 0.5; //底部线的宽度
  static const topimagesWidth = basic * 2.28125; //图片大小
  static const topTextImage = basic * 0.5625; //图片距离字体的高度
  static const ContainerHight = 100.0; //盒子模型的高度
  static const BorderSideStyle =
  BorderSide(color: Colors.black12, width: borderWidth);
  static const topText = TextStyle(fontSize: basic * 0.775);
  //首页标题样式---------top(最新消息......)
  static const paddings = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
  static const newHight = 45.0;
  static const bacgroundColor = 0xFFF5F5F5;
  static var nText0 = TextStyle(
      fontSize: AppSize.ufp6875,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static var nText1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppSize.ufp6875,
      color: Colors.blue);
  static var nText2 = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: AppSize.ufp6875,
      color: Colors.black);
  static var nText3 = TextStyle(fontSize: AppSize.ufp6875, color: Colors.amber);
  //居民卡.......样式
  static const mHight = 35.0;
  static const mpaddings = EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0);
  static const mBorderSideStyle = BorderSideStyle;
  static const mWidth = 5.0;
  static const mContainerHight = 20.0; //行高
  static var mtopText =
  TextStyle(fontFamily:'alm',fontSize: smallTextSize); //标题字体的样式
  static var mMore =
  TextStyle(fontSize: minTextSize, color: Colors.grey); //更多的样式
  static const mpHight = 60.0; //小格子的高度
  static const mpzHight = 8.0; //内部字体和解释字体的高度
  static var mpzSub = TextStyle(fontSize: AppSize.ufp6, color: Colors.grey); //
  static const mpzImgWidth = 35.0;
}
///颜色
class GSYColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFFAA3200;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int accentValue = 0xFFFFFFFF;
  static const int accentLightValue = 0xFF42464b;
  static const int accentDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
  static const MaterialColor accentSwatch = const MaterialColor(
    accentValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(accentValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}
