import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class editPass extends StatefulWidget {
  @override
  _editPassState createState() => _editPassState();
}

class _editPassState extends State<editPass> {
  final registerFormKey = GlobalKey<FormState>();
  String password, password1,password2,checkPwd;
  bool autovalidate = false;
  String phone;

  String validatePassword(value) {
    if (value.isEmpty) {
      return '请填写旧密码';
    }
    if(value != checkPwd){
      return '旧密码错误';
    }
  }
  String validatePassword1(value) {
    if (value.isEmpty) {
      return '请填写新密码';
    }
  }
  String validatePassword2(value) {
    if (value.isEmpty) {
      return '请再次输入新密码';
    }
  }
  jumop(String resz) async{
    Map datas = json.decode(resz);
    if(datas["d"]["Code"] == 0){
      Fluttertoast.showToast(
          msg: "修改失败",
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
      await Future.delayed(Duration(seconds: 1), () {

        LocalStorage.set(
            'username',
            phone
        );
        LocalStorage.set(
            'password',
            password1
        );
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(
                builder: (context) => login()),
                (Route<dynamic> rout) => false);
      });
    }
  }
  _disMissCallBack(Function func) async {
    await Future.delayed(Duration(milliseconds: 1500), () async{
      var res = await httpManager.netFetch(hostAddres.getUpPasswordUrl(),{"mobile":phone.toString().trim(),"password":password1.toString().trim()}, null,  null);
      String resz = res.data.toString();
      func();
      jumop(resz);

      // jumop(ScopedModel.of<UserDataModel>(context,rebuildOnChange: true).datas);
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPhone();
  }
   _setPhone() async {
    String phze = await LocalStorage.get("currentUser");
    String pwd  = await  LocalStorage.get("password");
    setState(() {
      phone = json.decode(phze)['FTelephone'];
      checkPwd = pwd;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            TextFormField(
              obscureText:true,
            autovalidate: autovalidate,
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.filter_1,size: 20,),
                labelText: '请输入旧密码',
                  labelStyle: TextStyle(fontSize: 12.0)
              ),
              autofocus: false,
            ),
            TextFormField(
              obscureText:true,
              autovalidate: autovalidate,
              onSaved: (value) {
                password1 = value;
              },
              validator: validatePassword1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.filter_2,size: 20),
                labelText: '请输入新密码',
                  labelStyle: TextStyle(fontSize: 12.0)
              ),
              autofocus: false,
            ),
            TextFormField(
              obscureText:true,
              autovalidate: autovalidate,
              onSaved: (value) {
                password2 = value;
              },
              validator: validatePassword2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.filter_3,size: 20),
                labelText: '请再次输入新密码',
                labelStyle: TextStyle(fontSize: 12.0)
              ),
              autofocus: false,
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: RaisedButton(
                onPressed: submitRegisterForm,
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('修改密码',style: TextStyle(color: Theme.of(context).backgroundColor),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

