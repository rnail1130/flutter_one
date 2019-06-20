import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

import '../hub.dart';


class goverDo extends StatefulWidget {
  final String name;
  goverDo(this.name);
  @override
  _personDoState createState() => _personDoState();
}

class _personDoState extends State<goverDo> {
  var futureBuilderFuture;

  List<String> title = ['主题分类',"部门分类",];

  List<Widget> creatBuild(){
    List<Widget> con = [];
    title.forEach((item){
      con.add(
        Padding(
          padding:EdgeInsets.fromLTRB(0.0,0.0,0.0,10),
          child: Text(item,style: TextStyle(fontFamily: "alr",fontSize: 14.0),),
        ),
      );
    });
    return con;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBuilderFuture = getPageData.getdata();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            this.widget.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: creatBuild()
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            zhuti(futureBuilderFuture),
            bumen(futureBuilderFuture),
          ],
        ),
      ),
    );
  }
}
class zhuti extends StatefulWidget {
  var data;
  zhuti(this.data);
  @override
  _zhutiState createState() => _zhutiState();
}

class _zhutiState extends State<zhuti> {
  TextStyle fon = TextStyle(fontSize: 14.0);
  var _futureBuilderFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureBuilderFuture =  this.widget.data;
  }
  //加载中的小部件
  Widget _loadingWidget() {
    Widget content;
    content = Center(
      child: Container(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: SpinKitCubeGrid(
            color: Colors.orange,
            size: 50.0,
          ),
        ),
      ),
    );
    return content;
  }
  List<Widget> _createBulid(List data,int start,int end){
    List<Widget> con = [];
    for(var i = start;i< end;i++){
      con.add(
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => hub(data[i]["ClassifyName"], id: data[i]["ClassifyId"],)),
            );
          },
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(data[i]["ClassifyName"],style: fon,),
                ),
                Expanded(
                    flex: 1,
                    child: Image.network(data[i]["ClassifyIcon"],width:35.0,height: 35.0,)
                ),
              ],
            ),
          ) ,
        ),
      );
    }
    return con;
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
        return _loadingWidget();
      case ConnectionState.done://请求成功
        if(snapshot.data==null){
          return _loadingWidget();
        }
        Map NewMap =snapshot.data;
        List result = NewMap["d"]["Result"]["ThemeClassification"];
        int count = ((result.length)/2).ceil();
        return SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child:Container(
                    child: Column(
                      children:_createBulid(result,0,count),
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child:Container(
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.grey[300],width: 0.5))
                    ),
                    child: Column(
                      children:_createBulid(result,count,result.length),
                    ),
                  )
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      builder: _buildFuture,
      future:  _futureBuilderFuture,
    );
  }
}
class bumen extends StatefulWidget {
  var data;
  bumen(this.data);
  @override
  _bumenState createState() => _bumenState();
}

class _bumenState extends State<bumen> {
  TextStyle fon = TextStyle(fontSize: 14.0);
  var _futureBuilderFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureBuilderFuture =  this.widget.data;
  }
  Widget _loadingWidget() {
    Widget content;
    content = Center(
      child: Container(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: SpinKitCubeGrid(
            color: Colors.orange,
            size: 50.0,
          ),
        ),
      ),
    );
    return content;
  }
  List<Widget> _createBulid(List data){
    List<Widget> con = [];
    for(var i = 0;i< data.length;i++){
      con.add(
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => hub(data[i]["ClassifyName"], id: data[i]["ClassifyId"],)),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.5))
                ),
                child: Text(data[i]["ClassifyName"],style: fon,),
                padding: const EdgeInsets.all(12.0),
              ),
            ],
          ),
        ),
      );
    }
    return con;
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
        return _loadingWidget();
      case ConnectionState.done://请求成功
        if(snapshot.data==null){
          return _loadingWidget();
        }
        Map NewMap = snapshot.data;
        List result = NewMap["d"]["Result"]["DepartmentClassification"];
        return SingleChildScrollView(
          child: Column(
            children:_createBulid(result),
          ),
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      builder: _buildFuture,
      future:  _futureBuilderFuture,
    );
  }
}
//页面获取数据
class getPageData {
  static getdata () async {
    var res = await httpManager.netFetch(hostAddres.getGerenbanshiUrl(),{"ClassifyType":"2",}, null,  null);
    Map weatherMap = json.decode(res.data.toString());
    return weatherMap;
  }
}