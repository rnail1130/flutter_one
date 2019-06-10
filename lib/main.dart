import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:phone_yiyang/styles/theme.dart';
import 'pages/index.dart';


void main() {
  runZoned(() {
    runApp(MyApp());
    PaintingBinding.instance.imageCache.maximumSize = 100;//图片缓存的大小
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//关闭debug显示条
      title: 'MyApp',
      theme: ThemeData(
          platform: TargetPlatform.iOS,//手势滑动关闭页面
          primaryColor: AppColors.themeColor,
          accentColor: AppColors.white
      ),
      // initialRoute: "/HomePage",//功能测试初始化的页面
/*      routes: <String,WidgetBuilder>{//配置路径
        '/HomePage':(BuildContext context)  => indexHome(),
      },*/
      home: BottomNav(),
    );
  }
}
//导航页面
class LauchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页面'),
      ),
      body: Center(
        child: Text("导航页"),
      ),
    );
  }
}

