import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/net/api.dart';

import 'forgetHub.dart';
import 'forgetPwdre.dart';
import 'package:phone_yiyang/utiles/config.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class forgetHomePage extends StatefulWidget {
  @override
  _forgetHomePageState createState() => _forgetHomePageState();
}

class _forgetHomePageState extends State<forgetHomePage> {
  String phone,code;
  Timer _countdownTimer;
  final registerFormKey = GlobalKey<FormState>();
  bool autovalidate = false;
  int _count = config.COUNTER;
  String str = "";
  bool _isButton1Disabled = true;
  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  TextEditingController _controller = TextEditingController();
  //监听手机号码的输入
  _onchange(){
    String text = _controller.text;
    setState(() {
      phone = text;
    });
  }
  //构建组件
  Widget builds(){
    Widget con ;
    if(_isButton1Disabled){
      con = Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: _reGetCountdown,
          child: Text("获取验证码"),
        ),
      );
    }else{
      con = Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(str),
      );
    }
    return con;
  }
  //提示组件
  void tosats (String str){
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  Future _reGetCountdown() async {
    if(phone == null){
      tosats("请填写手机号码");
      return;
    }
    if (!exp.hasMatch(phone)){
      tosats("请填写正确手机号码");
      return;
    }
    var res = await httpManager.netFetch(hostAddres.getCodeUrl(),{"mobile":phone.toString().trim()}, null,  null);
    String resz = res.data.toString();
    Map datas = json.decode(resz);
    print(datas);
    if(datas['d']['Code'] == 1){
      tosats("验证码已发送，注意查收");
      _isButton1Disabled = false;
      setState(() {
        builds();
        _countdownTimer =
        new Timer.periodic(new Duration(seconds: 1), (timer) {
          setState(() {
            _count--;
            str = _count.toString()+"s";
            if(_count == 0){
              _isButton1Disabled = true;
              builds();
              _count = config.COUNTER;
              _countdownTimer.cancel();
            }
          });
        });
      });
    }else{
      tosats(datas['d']['Result']);
    }
  }
  jumop(String resz) async{
    Map datas = json.decode(resz);
    if(datas["d"]["Code"] == 0){
      tosats(datas["d"]["Msg"]);
    }else{
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => forgetHub("忘记密码",2,phone: phone,)),
      );
    }
  }
  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) async {
    await Future.delayed(Duration(milliseconds: 500), () async{
      var res = await httpManager.netFetch(hostAddres.getFindPasswordUrl(),{"mobile":phone.toString().trim(),"validateCode":code}, null,  null);
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
  String validateCode(value) {
    if (value.isEmpty) {
      return '请填写验证码';
    }
    return null;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_onchange);
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
              controller: _controller,
              autovalidate: autovalidate,
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                phone = value;
              },
              validator: validatePhone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              border: OutlineInputBorder(),
              hintText: '请输入手机号',
              labelText: '手机号码',
              prefixIcon: Icon(Icons.person),
            ),
          ),
            SizedBox(height: 20.0,),
            TextFormField(
              autovalidate: autovalidate,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                code = value;
              },
              validator: validateCode,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                border: OutlineInputBorder(),
                hintText: '请输入验证码',
                labelText: '验证码',
                prefixIcon: Icon(Icons.code),
                suffixIcon: builds(),
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
                  child: Text('下一步',style: TextStyle(color: Colors.white,fontSize: 14.0),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
