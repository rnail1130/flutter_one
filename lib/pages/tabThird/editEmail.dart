import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class editEmail extends StatefulWidget {
  @override
  _editEmailState createState() => _editEmailState();
}

class _editEmailState extends State<editEmail> {
  final registerFormKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String email;
  String name;
  RegExp exp = RegExp(
      r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$');

  String validateEmail(value) {
    if (value.isEmpty) {
      return '请填写邮箱';
    }
    if (!exp.hasMatch(value)){
      return "请填写正确邮箱";
    }
  }
  jumop(String resz) async{
    Map datas = json.decode(resz);
    if(datas["d"]["Code"] == 0){
      Fluttertoast.showToast(
          msg: "发送失败，请确认邮箱是否正确！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else if(datas["d"]["Code"] == 1){
      Fluttertoast.showToast(
          msg: "该邮箱已绑定其他账号！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "邮箱修改成功！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.white,
          fontSize: 16.0
      );
      await Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }
  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) async {

    await Future.delayed(Duration(milliseconds: 1500), () async{
      var res = await httpManager.netFetch(hostAddres.getUpEmialUrl(),{"Email":email.toString().trim(),"UserName":name.toString().trim()}, null,  null);
      String resz = res.data.toString();
      func();
      jumop(resz);
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
    _getData();
  }
  _getData() async {
    String phze = await LocalStorage.get("currentUser");
    Map prit = jsonDecode(phze);
    setState(() {
      name = prit["FUserName"];
    });
  }
    @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidate: autovalidate,
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                border: OutlineInputBorder(),
                hintText: '请输入邮箱',
                labelText: '邮箱',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: submitRegisterForm,
                color: Theme.of(context).primaryColor,
                child: Text('确  定',style: TextStyle(color: Theme.of(context).backgroundColor),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
