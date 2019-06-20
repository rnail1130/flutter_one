import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/code.dart';
import 'Tab0.dart';
import 'Tab1.dart';
import 'Tab2.dart';
import '../utiles/data_config.dart';
import 'login/loginPage.dart';

class BottomNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNav();
  }
}
class _BottomNav extends State<BottomNav>{
  int _currentIndex = 0;
  StreamSubscription stream;
  void _onTapHandler (int index) {

    LocalStorage.getstring('currentUser', (data){
      if(data == null){
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => login()),
        );
        return;
      }else{
        setState(() {
          _currentIndex = index;
        });
      }
    });
  }
  List<Widget> list = List();
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(msg: "网络错误");
        break;
      case 401:
        Fluttertoast.showToast(msg: "登录过期");
        break;
      case 403:
        Fluttertoast.showToast(msg: "403权限错误");
        break;
      case 404:
        Fluttertoast.showToast(msg: "404错误");
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        Fluttertoast.showToast(msg: "请求超时");
        break;
      default:
        Fluttertoast.showToast(msg: message);
        break;
    }
  }
  @override
  void initState() {
    //检查网络状态
    list
      ..add(firstTab())
      ..add(MyCard())
      ..add(thirdTab());
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }
  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: list[_currentIndex],//HomeContent(),
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[0],style: AppContent.bottomTextSize,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[1],style: AppContent.bottomTextSize,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[2],style: AppContent.bottomTextSize,),
          ),
        ],
      ),
    );
  }
}
