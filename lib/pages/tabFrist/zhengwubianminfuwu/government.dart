import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';


import '../hub.dart';
class government  extends StatefulWidget {
  @override
  _governmentState createState() => _governmentState();
}

class _governmentState extends State<government> {
  var _futureBuilderFuture;

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(()  {
        _futureBuilderFuture = getPageData.getdata();
      });
    });
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureBuilderFuture = getPageData.getdata();
    //页面获取数据
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
        List resr = NewMap["d"]["Result"];
        List<String> ListDatas = [];
        resr.forEach((item){
          ListDatas.add(item['MatterName']);
        });

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: ListDatas.length,
            itemBuilder: (BuildContext context,int index){

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
                    ),
                    child: Text(ListDatas[index]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                    height: 50,
                    width: 100,
                    child: OutlineButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => hub(ListDatas[index])),
                        );
                      },
                      child: Text("查询",style: TextStyle(fontSize: 12.0,color: Theme.of(context).primaryColor),),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Container(
                    height: 10.0,
                    color: Colors.grey[100],
                  ),
                ],
              );
            },
          ),
        ); /**/
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: _buildFuture,
      future:  _futureBuilderFuture,
    );
  }
}


//页面获取数据
class getPageData {
  static getdata () async {
    var res = await httpManager.netFetch(hostAddres.getGovermentUrl(),{"classifyId":"","isHot":true}, null,  null);
    Map weatherMap = json.decode(res.data.toString());
    return weatherMap;
  }
}