import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:phone_yiyang/model/provide/provide.dart';
import 'hubThird.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  UserDataModel userDataModel;
  Map data;
  String res;
  TextStyle font1 = TextStyle(
    fontSize: 12.0,
    color: Colors.black45
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataModel = ScopedModel.of<UserDataModel>(context);
    userDataModel.getUserLoginStatus();
    data = userDataModel.userInfo;
    print(data['FCard']);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage("http://60.247.61.162:8020/UploadFiles/HeaderImgs/temp_1554116484560.jpg",),
                ),
                Icon(Icons.chevron_right,color: Colors.black45,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('持卡人姓名'),
                Text(data['FUserName']==null ? "":data['FUserName'],style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('居民卡卡号'),
                Text('1234567896543211',style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('身份证号'),
                Text('15356418431748',style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('手机号码'),
                Text('13835369268',style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => hubThird("修改邮箱")),
            );
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('邮箱'),
                Icon(Icons.chevron_right,color: Colors.black45,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
