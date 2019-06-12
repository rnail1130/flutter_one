import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabFrist/tab_first_body.dart';

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

class HeaderTitle extends StatelessWidget {
  final TextStyle font1 = TextStyle(fontSize: 30.0,color: Color(0xFF0076CB));
  final TextStyle font2 = TextStyle(fontSize: 15.0,color: Color(0xFF0076CB));
  final TextStyle font3 = TextStyle(color:Color(0xFF0076CB) );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/img/index_pic47.png',width: 130.0,),
          Row(
            children: <Widget>[
              Text('阵雨',style: font1,),
              SizedBox(width: 5.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("25°C - 15°C",style:font2,),
                  Text("空气质量：50",style: font2,)
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
}

