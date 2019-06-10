import 'package:flutter/material.dart';
import 'ApiPage.dart';
import 'WebPage.dart';
class Deatile extends StatefulWidget {
  String url;
  String name;
  int id;
  Deatile(this.name,{this.url,this.id});
  @override
  _DeatileState createState() => _DeatileState(this.name,url: this.url,id: this.id);
}

class _DeatileState extends State<Deatile> {
  String url;
  String name;
  int id;
  _DeatileState(this.name,{this.url,this.id});

  //判断可选参数url是否存在
  Widget _widgetPage(){
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    setState(() {
      if(this.id == null){
        content = WebHome(this.url,this.name);//内嵌网页
      }else{
        content = ApiHome(this.id,this.name);
      }
    });
    return content;
  }
  @override
  Widget build(BuildContext context) {
    return _widgetPage();
  }

}


