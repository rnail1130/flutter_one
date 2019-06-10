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
      color: Colors.white,
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
  TextStyle(fontWeight: FontWeight.w500, fontSize: smallTextSize); //标题字体的样式
  static var mMore =
  TextStyle(fontSize: minTextSize, color: Colors.grey); //更多的样式
  static const mpHight = 60.0; //小格子的高度
  static const mpzHight = 8.0; //内部字体和解释字体的高度
  static var mpzSub = TextStyle(fontSize: AppSize.ufp6, color: Colors.grey); //
  static const mpzImgWidth = 35.0;
}