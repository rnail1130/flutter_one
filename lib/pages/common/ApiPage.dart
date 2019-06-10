import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utiles/getHost.dart';
import '../../utiles/net/api.dart';
class ApiHome extends StatefulWidget {
  int id;
  String title;
  ApiHome(this.id,this.title);
  @override
  _ApiHomeState createState() => _ApiHomeState(this.id,this.title);
}

class _ApiHomeState extends State<ApiHome> {
  int id;
  String title;
  String dz;
  _ApiHomeState(this.id,this.title);
  var _futureBuilderFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = getPageData.getdata(this.id);
  }
  //加载中的小部件
  Widget _loadingWidget (){
    Widget content;
    content = new Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 35.0),
          child: new Center(
            child: SpinKitCubeGrid(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  return content;
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
      return _loadingWidget();
      case ConnectionState.done://请求成功
        Map userMap = json.decode(snapshot.data.toString());
        var trrs = userMap['d']['Result']['Content'];
        dz = trrs.toString();
        return Container(
          padding: EdgeInsets.all(15.0),
          child:Html(
            data: dz,
          ),
        );
      default:
        return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(this.title,
            overflow:TextOverflow.ellipsis ,
            style: TextStyle(fontSize: 16.0,color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.chevron_left,size: 30.0,color: Colors.white,), onPressed: (){Navigator.pop(context);})

      ),
      body: SingleChildScrollView(
          child:FutureBuilder(
            builder: _buildFuture,
            future:  _futureBuilderFuture,
          )
      ),
    );
  }
}
//页面获取数据
class getPageData {
  static getdata (int b) async {
    var res = await httpManager.netFetch(hostAddres.getDeatilUrl(),{"ArticleId":b}, null,  null);
    return res.data;
  }
}
