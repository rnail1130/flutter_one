import 'package:flutter/material.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
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

  @override
  void initState() {
    list
      ..add(firstTab())
      ..add(MyCard())
      ..add(thirdTab());
    super.initState();
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
            icon: Icon(Icons.explore,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[0],style: AppContent.bottomTextSize,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[1],style: AppContent.bottomTextSize,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history,size: AppContent.sizeIcon,),
            title: Text(DataConfig.TAB[2],style: AppContent.bottomTextSize,),
          ),
        ],
      ),
    );
  }
}
