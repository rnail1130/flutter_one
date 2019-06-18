import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:phone_yiyang/styles/theme.dart';
import 'package:phone_yiyang/utiles/localeCommon.dart';
import 'pages/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:phone_yiyang/model/provide/provide.dart';

void main() {
  runZoned(() {
    runApp(MyApp());
    PaintingBinding.instance.imageCache.maximumSize = 10000; //图片缓存的大小
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserDataModel>(
      model: UserDataModel(),
      child:MaterialApp(
        locale: const Locale('zh', 'CN'),
        debugShowCheckedModeBanner: false, //关闭debug显示条
        title: 'MyApp',
        theme: ThemeData(
          platform: TargetPlatform.iOS, //手势滑动关闭页面
          // primaryColor: AppColors.themeColor,
          primaryColor: GSYColors.primarySwatch,
          //  accentColor: AppColors.twhite
          accentColor: GSYColors.primarySwatch,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: AppColors.themebody,

        ),
        // initialRoute: "/",//功能测试初始化的页面
/*      routes: <String,WidgetBuilder>{//配置路径
        '/':(BuildContext context)  => BottomNav(),
      },*/
        home: BottomNav(),
        localizationsDelegates: [
          //此处
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          CommonLocalizationsDelegate(),
        ],
        supportedLocales: [
          //此处
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
        ],
      )
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
