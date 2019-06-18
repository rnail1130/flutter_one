import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phone_yiyang/model/provide/provide.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:scoped_model/scoped_model.dart';

import '../index.dart';
import 'forgetHub.dart';
import 'forgetPwd.dart';
import 'registered.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/config.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class login extends StatelessWidget {
  FocusNode blankNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => BottomNav()),
        );
      },
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => BottomNav()),
                          (Route<dynamic> rout) => false);
/*                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => BottomNav()),
                  );*/
                }),
            actions: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Center(
                      child: Text('忘记密码'),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => forgetHub("忘记密码",1)),
                    );
                  },
                ),
              ),
            ],
          ),
          body: loginHomePage(),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class loginHomePage extends StatefulWidget {
  @override
  _loginHomePageState createState() => _loginHomePageState();
}

class _loginHomePageState extends State<loginHomePage> {
  TextStyle title = TextStyle(fontSize: 30.0, color: Colors.white);
  final registerFormKey = GlobalKey<FormState>();
  String phone, password;
  bool autovalidate = false;
  UserDataModel userDataModel;

  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

  jumop(Map resz) async{
    if(resz["d"]["Code"] == 0){
      Fluttertoast.showToast(
          msg: "用户名或密码错误",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "登陆成功！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
      await Future.delayed(Duration(seconds: 1), () {
//        ScopedModel.of<UserDataModel>(context).getUserLoginStatus();
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(
                builder: (context) => BottomNav()),
                (Route<dynamic> rout) => false);
      });
    }
  }

  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) async {
    userDataModel = ScopedModel.of<UserDataModel>(context);
    userDataModel.userLogin(phone, password);
    await Future.delayed(Duration(milliseconds: 1500), () async{
      func();
      jumop(userDataModel.Data);
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
      _openAlretDialog();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatePhone(value) {
    if (value.isEmpty) {
      return '请填写手机号';
    }
    if (!exp.hasMatch(value)){
      return "请填写正确手机号码";
    }
    return null;
  }
  String validatePassword(value) {
    if (value.isEmpty) {
      return '请填写密码';
    }

    return null;
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: registerFormKey,
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '登录',
              style: title,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '手机号',
              style: TextStyle(color: Colors.white),
            ),
            Container(
              child: TextFormField(
                autovalidate: autovalidate,
                keyboardType: TextInputType.phone,
                initialValue: config.ACCOUNT ? '18210530620':" ",
                cursorColor: Colors.white,
                onSaved: (value) {
                  phone = value;
                },
                validator: validatePhone,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  errorStyle: TextStyle(color: Colors.orangeAccent),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  helperText: '',
                  labelText: '',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Container(
                    margin: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
                    width: 40.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: Text(
                        '+86',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '登录密码',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              child: TextFormField(
                autovalidate: autovalidate,
                obscureText: true,
                initialValue: config.ACCOUNT ? 'abc123':" ",
                onSaved: (value) {
                  password = value;
                },
                validator: validatePassword,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  errorStyle: TextStyle(color: Colors.orangeAccent),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  helperText: '',
                  labelText: '',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => registered()),
                    );
                  },
                  child: Text(
                    "立即注册",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ),
                ),
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: submitRegisterForm,))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
