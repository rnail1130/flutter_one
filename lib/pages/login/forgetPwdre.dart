import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/net/api.dart';

import 'loginPage.dart';
import 'package:phone_yiyang/utiles/getHost.dart';
class forgetHomePagere extends StatefulWidget {
  final String phone;
  forgetHomePagere(this.phone);
  @override
  _forgetHomePageState createState() => _forgetHomePageState();
}

class _forgetHomePageState extends State<forgetHomePagere> {
  final registerFormKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String pass,pass1;
  String validatePass(value) {
    if (value.isEmpty) {
      return '请输入密码';
    }
    return null;
  }
  String validatePass1(value) {
    if (value.isEmpty) {
      return '请再次输入密码';
    }
    return null;
  }
  jumop(String resz) async{
    Map datas = json.decode(resz);
    if(datas["d"]["Code"] == 0){
      Fluttertoast.showToast(
          msg: "修改失败！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "修改成功！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (context) => login()),
              (Route<dynamic> rout) => false);
    });
  }
  _disMissCallBack(Function func) async {
    await Future.delayed(Duration(milliseconds: 1500), () async{
      var res = await httpManager.netFetch(hostAddres.getEditPasswordUrl(),{"mobile":this.widget.phone.toString().trim(),"password":pass.toString().trim()}, null,  null);
      String resz = res.data.toString();
      func();
      return jumop(resz);
    });

  }
  _openAlretDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return new NetLoadingDialog(
            dismissDialog: _disMissCallBack,
            outsideDismiss: false,
          );
        });
  }
  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      if(pass != pass1){
        Fluttertoast.showToast(
            msg: "两次密码输入不一致",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }
      _openAlretDialog();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              obscureText: true,
              autovalidate: autovalidate,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                pass = value;
              },
              validator: validatePass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              border: OutlineInputBorder(),
              hintText: '密码',
              labelText: '请输入密码',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
            SizedBox(height: 20.0,),
            TextFormField(
              obscureText: true,
              autovalidate: autovalidate,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                pass1 = value;
              },
              validator: validatePass1,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                border: OutlineInputBorder(),
                hintText: '重复密码',
                labelText: '再次输入密码',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: submitRegisterForm,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 14.0),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
