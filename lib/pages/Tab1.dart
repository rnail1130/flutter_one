import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:phone_yiyang/pages/tabSecond/tabShub.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'dart:io';
import 'dart:async';
import 'package:phone_yiyang/pages/tabSecond/large_page.dart';
import 'package:phone_yiyang/utiles/getHost.dart';



class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var titleStyle = TextStyle(fontSize: 16.0,color: Colors.white);
  var fontStyle = TextStyle(
      fontSize: 12.0,
      color: Colors.black45
  );
  String code = "011424346964863426268";
  String name;
  String cardNo = '0000000000';
  @override
  void initState() {
    getCode();
    _reGetCountdown();
    super.initState();
  }

  void getCode (){
    LocalStorage.getstring("currentUser", (data) async {
      var Cards = jsonDecode(data)["FCard"];
      var res = await httpManager.netFetch(hostAddres.getQR(),{"virtualCardCode":Cards,"transType":0}, null,  null);
      Map NewMap = json.decode(res.data.toString());
      Map nNewdata = json.decode(NewMap["d"].toString());
      setState(() {
        code = nNewdata["Result"];
        name = jsonDecode(data)["FUserName"];
        cardNo = Cards;
      });
     // return NewMap;
    });


/*    int strlenght = 21; /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
//    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }*/

  }
  int _count = 30;
  Timer _countdownTimer;
  void _reGetCountdown() {
    setState(() {

      _countdownTimer =
      new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          _count--;
          if(_count == 0){
            _count = 30;
            getCode();
          }
        });
      });
    });
  }
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
  List<String> title = ['虚拟卡',"云闪付"];
  List<Widget> creatBuild(){
    List<Widget> con = [];
    title.forEach((item){
      con.add(Padding(padding:EdgeInsets.fromLTRB(0.0,0.0,0.0,10),
        child: Text(item,style: TextStyle(fontFamily: "alr",fontSize: 14.0),),
      ));
    });
    return con;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: title.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text('我的居民卡虚拟卡',style:titleStyle,),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh,color: Colors.white,), onPressed: getCode)
            ],
            elevation: 0.0,
            bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: creatBuild()
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,

          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(15.0),
                      width: double.infinity,
                      height: 300.0,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child:Container(
                                width: double.infinity,
                                height: 90.0,
                                child:  Center(
                                  child:BarCodeImage(
                                    data: code,   // Code string. (required)
                                    codeType: BarCodeType.Code128,  // Code type (required)
                                    lineWidth: 1.1,                // width for a single black/white bar (default: 2.0)
                                    barHeight: 90.0,               // height for the entire widget (default: 100.0)
                                    hasText: false,                 // Render with text label or not (default: false)
                                    onError: (error) {             // Error handler
                                      print('error = $error');
                                    },
                                  ),
                                )
                            ),
                            onTap: (){
                              //添加一个页面
                              Navigator.push<String>(
                                  context,
                                  new PageRouteBuilder(
                                      pageBuilder: (
                                          BuildContext context,
                                          Animation<double> animation1,
                                          Animation<double> animation2,
                                          ) {
                                        // 跳转的路由对象
                                        return LargePage(code,0);
                                      }, transitionsBuilder: (
                                      BuildContext context,
                                      Animation<double> animation1,
                                      Animation<double> animation2,
                                      Widget child
                                      ) {
                                    return FadeTransition (
                                      opacity: Tween(begin: 0.0,end:1.0)
                                          .animate(CurvedAnimation(parent: animation1, curve: Curves.easeIn)),
                                      child: child,
                                    );
                                  }));
                            },
                          ),

                          Text(code,style: fontStyle,),
                          InkWell(
                            child:Center(
                              child:new QrImage(
                                data: code,
                                size: 140.0,
                              ),
                            ),
                            onTap: (){
                              //添加一个页面
                              Navigator.push<String>(
                                  context,
                                  new PageRouteBuilder(
                                      pageBuilder: (
                                          BuildContext context,
                                          Animation<double> animation1,
                                          Animation<double> animation2,
                                          ) {
                                        // 跳转的路由对象
                                        return LargePage(code,1);
                                      }, transitionsBuilder: (
                                      BuildContext context,
                                      Animation<double> animation1,
                                      Animation<double> animation2,
                                      Widget child
                                      ) {
                                    return FadeTransition (
                                      opacity: Tween(begin: 0.0,end:1.0)
                                          .animate(CurvedAnimation(parent: animation1, curve: Curves.easeIn)),
                                      child: child,
                                    );
                                  }));
                            },
                          ),

                          Text('虚拟卡条形码和二维码每30秒自动更新',style: fontStyle,),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => tabShub("虚拟卡基本信息")),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 0.0),
                            height: 220.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage('assets/img/myCard.png'),
                                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                              ),
                            ),
                          ),
                          Positioned(
                            top:95.0,
                            left: MediaQuery.of(context).size.width/3,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('姓　　名：',style: fontStyle,),
                                    Text(name == null ? "":name,style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900
                                    ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('居民卡号：',style: fontStyle,),
                                    Text(cardNo.substring(0,4)+"*******"+cardNo.substring(cardNo.length-4),style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ) ,
              ),
              Center(child: Text('云闪付'),)
            ],
          )
      ),
    ) ;
  }
}

//页面获取数据
class getPageData {
  static getdata () async {
    LocalStorage.getstring("currentUser", (data) async {
      var Cards = jsonDecode(data)["FCard"];
      var res = await httpManager.netFetch(hostAddres.getQR(),{"virtualCardCode":Cards,"transType":0}, null,  null);
      Map NewMap = json.decode(res.data.toString());

      return NewMap;
    });
  }
}

