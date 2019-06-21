import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class userinfo extends StatefulWidget {
  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  var fontStyle = TextStyle(
      fontSize: 10.0,
      color: Colors.black
  );

  String name;
  String phone;
  String idCard;
  String xiniCard;
  String cardNo = "000000000";
  void getCode (){
    LocalStorage.getstring("currentUser", (data) async {
      var Cards = jsonDecode(data)["FCard"];
      var res = await httpManager.netFetch(hostAddres.getxiniinfourl(),{"useCardCode":Cards}, null,  null);
      Map NewMap = json.decode(res.data.toString());
      print(NewMap);
      setState(() {
        name = NewMap["d"]["Result"]["Name"];
        phone = NewMap["d"]["Result"]["ContactPhone"];
        idCard = NewMap["d"]["Result"]["CredentialNo"];
        xiniCard = NewMap["d"]["Result"]["VirtualCardCode"];
        cardNo = NewMap["d"]["Result"]["CardCode"];
      });
      // return NewMap;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCode();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height*0.3,
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 0.0),
                  height: MediaQuery.of(context).size.height*0.23,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/img/myCard.png'),
                      centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                  ),
                ),
                Positioned(
                  top:65.0,
                  left: MediaQuery.of(context).size.width*0.2,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('姓　　名：',style: fontStyle,),
                          Text(name == null ? "":name,style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('居民卡号：',style: fontStyle,),
                          Text(cardNo.substring(0,4)+"*******"+cardNo.substring(cardNo.length-4),style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 10.0,
          color: Colors.grey[200],
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                dense: true,
                title: Text("姓名："),
                trailing: Text(name==null?"":name,style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              ),
              ListTile(
                dense: true,
                title: Text("手机号："),
                trailing: Text(phone==null?"":phone,style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              ),
              ListTile(
                dense: true,
                title: Text("身份证号："),
                trailing: Text(idCard == null? "":idCard,style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              ),
              ListTile(
                dense: true,
                title: Text("虚拟卡号："),
                trailing: Text(xiniCard == null ?"":xiniCard,style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              ),
              ListTile(
                dense: true,
                title: Text("居民卡号："),
                trailing: Text(cardNo ==null ?"":cardNo,style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
