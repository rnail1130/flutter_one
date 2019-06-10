//跳转的中转
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabFrist/zhengwubianminfuwu/government.dart';
class hub extends StatefulWidget {
  final String name;
  final String url;
  hub(this.name,{this.url});

  @override
  _hubState createState() => _hubState();
}

class _hubState extends State<hub> {
  _hubHome(){
    switch(this.widget.name){
      case "政务查询":
       return government();
       break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              })
      ),
      body: _hubHome(),
    );
  }
}
