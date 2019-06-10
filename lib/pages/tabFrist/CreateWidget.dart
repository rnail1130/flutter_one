import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/common/ComList.dart';
import 'package:phone_yiyang/pages/common/DeatilPage.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';

import 'hub.dart';

class CreateWidget extends StatefulWidget {
  Map data;
  List data_list;
  CreateWidget(this.data,{this.data_list});
  @override
  _CreateWidgetState createState() => _CreateWidgetState(this.data,data_list: this.data_list);
}

class _CreateWidgetState extends State<CreateWidget> {
  Map data;
  List data_list;
  _CreateWidgetState(this.data,{this.data_list});
  List<Map<String,String>> _listData;
  //跳转更多
  void jumpMoreList(String more,String color,String name) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) =>ComPage(color,name,this.data_list)),
    );
  }
  //点击事件
  void jumpPage(String name, String isJump , String url, String isCheck) async{
    //点击之前判断是否登陆
    if(isCheck == "true"){
      LocalStorage.getstring('username', (data){
        if(data == null){
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => login()),
          );
          return;
        }else{
          if(isJump == "true"){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => Deatile(name,url: url,)),
            );
          }else{
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) =>hub(name,url: url)),
            );
          }
        }
      });
    }else{
      if(isJump == "true"){
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => Deatile(name,url: url,)),
        );
      }else{
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) =>hub(name,url: url)),
        );
      }
    }
  }
  Color color (){
    if(data["color"] == "red"){
      return Colors.red;
    }
    if(data["color"] == "green"){
      return Colors.green;
    }
    if(data["color"] == "blue"){
      return Colors.blue;
    }
    if(data["color"] == "yellow"){
      return Colors.yellow;
    }
    if(data["color"] == "black"){
      return Colors.black;
    }
    if(data["color"] == "orange"){
      return Colors.orange;
    }
  }
  //头部更多过滤

  List<Widget> isShowMore(){
    List<Widget> cons = [];
    String more = this.data["more"];
    if(more ==null || more.isEmpty ){
      cons.add(Text(""));
    }else{
      cons.add(InkWell(
        child: Text('更多',style: AppContent.mMore,),
        onTap: (){
          jumpMoreList(this.data["more"],this.data["color"],this.data["title"]);
        },
      ));
      cons.add( Icon(Icons.chevron_right,color: Colors.grey,));
    }
    return cons;
  }
  List<Widget> createWidget (){
    List <Widget> content = [];
    content.add(Container(
      height: AppContent.mHight,
      padding: AppContent.mpaddings,
      decoration: BoxDecoration(
          border: Border(top:AppContent.mBorderSideStyle ,bottom: AppContent.mBorderSideStyle)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                height: AppContent.mContainerHight,
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: color(),width:AppContent.mWidth)),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width:AppContent.topTextImage,),
                    Text(
                        this.data["title"] ,
                        style: AppContent.mtopText
                    ),
                  ],
                )
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: isShowMore(),
            ),
          ),
        ],
      ),
    ));//追加头部
    //内容部分的产生
    int row = (_listData.length/2).ceil();

    for(var i=1; i <= row; i++){
      content.add(Container(
        height: AppContent.mpHight,
        decoration: BoxDecoration(
            border: Border(bottom: AppContent.mBorderSideStyle)
        ),
        child: Row(
          children: tg(i),
        ),
      ));
    }
    return content;
  }
  List<Widget> tg (int num){
    List<Widget> con = [];
    List<Map<String,String>> yuw =[];
    if((_listData.length).isOdd){
      List<Map<String,String>> yuw1 =[
        {
          "data_title":"",
          "sub_title":"",
          "src":"assets/images/tm.png",
          "url":"",//可以跳转的话给链接，否则给类名，并且isjump为false
          "isjump":"false",
        },
      ];
      _listData.forEach((Map v){
        yuw.add(v);
      });
      yuw.addAll(yuw1);
    }else{
      yuw = _listData;
    }
    int start = (num - 1)*2;
    int end = num * 2;
    var lre=List();
    lre = yuw.getRange(start, end).toList();
    lre.forEach((Map){
      con.add(Expanded(
        flex: 1,
        child: InkWell(
          onTap: (){
            jumpPage(Map['data_title'],Map['isjump'],Map['url'],Map['ischeck']);
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.red,
                border: Border(right: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          Map['data_title']
                      ),
                      SizedBox(height: AppContent.mpzHight,),
                      Text(
                          Map['sub_title'],
                          style: AppContent.mpzSub
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          Map['src'],
                          width: AppContent.mpzImgWidth,
                          height: 35.0,
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ));
    });
    return con;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listData = this.data['data'];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: createWidget()
    );
  }
}



