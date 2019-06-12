import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class checkDeil extends StatelessWidget {
  final String name;
  checkDeil(this.name);
  List<String> title = ['全部',"城市钱包","商户点卡","商户积分","移动消费券"];
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
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: Text(
              this.name,
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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.date_range,color: Theme.of(context).backgroundColor,), onPressed: () async {
              final List<DateTime> picked = await DateRagePicker.showDatePicker(
                  context: context,
                  initialFirstDate: (new DateTime.now()).add(new Duration(days: -7)),
                  initialLastDate: new DateTime.now(),
                  firstDate: new DateTime(2015),
                  lastDate: new DateTime.now()
              );
              if (picked != null && picked.length == 2) {
                print(picked);
              }
            })
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: creatBuild()
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/nodatas.png",width: 60.0,),
                  SizedBox(height: 5,),
                  Text("暂无数据",style: TextStyle(fontSize: 14,fontFamily: "alr",color: Colors.grey),),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/nodatas.png",width: 60.0,),
                  SizedBox(height: 5,),
                  Text("暂无数据",style: TextStyle(fontSize: 14,fontFamily: "alr",color: Colors.grey),),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/nodatas.png",width: 60.0,),
                  SizedBox(height: 5,),
                  Text("暂无数据",style: TextStyle(fontSize: 14,fontFamily: "alr",color: Colors.grey),),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/nodatas.png",width: 60.0,),
                  SizedBox(height: 5,),
                  Text("暂无数据",style: TextStyle(fontSize: 14,fontFamily: "alr",color: Colors.grey),),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/nodatas.png",width: 60.0,),
                  SizedBox(height: 5,),
                  Text("暂无数据",style: TextStyle(fontSize: 14,fontFamily: "alr",color: Colors.grey),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
