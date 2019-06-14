//跳转的中转
import 'package:flutter/material.dart';

import 'forgetPwd.dart';
import 'forgetPwdre.dart';

class forgetHub extends StatefulWidget {
  final String name;
  final String url;
  final int status;
  final String phone;

  forgetHub(this.name,this.status,{this.url,this.phone});

  @override
  _hubState createState() => _hubState();
}

class _hubState extends State<forgetHub> {
  FocusNode blankNode = FocusNode();
  _hubHome(){
    switch(this.widget.status){
      case 1:
        return forgetHomePage();
        break;
      case 2:
        return forgetHomePagere(this.widget.phone);
        break;
    }
  }
  _buildScaffold(){
    switch(this.widget.name){
      default:
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(blankNode);
          },
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
                title: Text(
                  this.widget.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, color: Colors.white,fontFamily: "alm"),
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
          ),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }
}
