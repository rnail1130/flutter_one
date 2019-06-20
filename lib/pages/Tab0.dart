import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabFrist/tab_first_body.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class firstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: HeaderTitle(),
            elevation: 0.0,
            backgroundColor:  Theme.of(context).backgroundColor,
          ),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1)
      ),
      body: HomeBody(),
    );
  }
}

class HeaderTitle extends StatefulWidget {
  @override
  _HeaderTitleState createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  final TextStyle font1 = TextStyle(fontSize: 30.0,color: Color(0xFF0076CB));

  final TextStyle font2 = TextStyle(fontSize: 15.0,color: Color(0xFF0076CB));

  final TextStyle font3 = TextStyle(color:Color(0xFF0076CB) );
  var _futureBuilderFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    setState(() {
      _futureBuilderFuture = getPageData.getdata();
    });

  }
  Widget builrd (List<String> conrs){
   return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/img/index_pic47.png',width: 130.0,),
          Row(
            children: <Widget>[
              Text(conrs[4],style: font1,),
              SizedBox(width: 5.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(conrs[2].toString()+'°C  -  '+conrs[3].toString()+"°C",style:font2,),
                  Text("空气质量："+conrs[5],style: font2,)
                ],
              ),
            ],
          ),
          Text("|",style: font3,),
          Container(
            child: Center(child: Icon(Icons.camera,color:Color(0xFF0076CB) ,),),
          ),
        ],
      ),
    );
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
      return Center(
        child: Text(HttpManager.loading,style: AppContent.moreMinText,),
      );
      case ConnectionState.done://请求成功
      if(snapshot.data == null){
        return builrd([" "," ","0","0","0"," "]);
      }
      Map weatherMap = snapshot.data;
      if(weatherMap['d'] == null){
        return builrd([" "," ","0","0","0"]);
      }
      RegExp exp = new RegExp(r'\d{1,2}');
      weatherMap['d']['high'] = exp.stringMatch(weatherMap['d']['high']);
      weatherMap['d']['low'] = exp.stringMatch(weatherMap['d']['low']);
      return builrd([weatherMap['d']['city'],weatherMap['d']['date'],weatherMap['d']['high'],weatherMap['d']['low'],weatherMap['d']['type'],weatherMap['d']['aqi']]);
      default:
        return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: _buildFuture ,
      future:  _futureBuilderFuture,
    );
  }
}
//页面获取数据
class getPageData {
  static getdata () async {
    try {
      var res = await httpManager.netFetch(hostAddres.getWeatherUrl(),null, null,  null);
      Map weatherMap = json.decode(res.data.toString());
      return weatherMap;
    } catch(e) { /**/ }
  }
}