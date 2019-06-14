import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';

import '../index.dart';
import 'forgetPwd.dart';
import 'package:phone_yiyang/utiles/config.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class registered extends StatelessWidget {
  FocusNode blankNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                Navigator.pop(context);
              }),
          actions: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                child:Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child:Center(child:  Text('取消'),),
                ),
                onTap: (){
                    Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: loginHomePage(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
class loginHomePage extends StatefulWidget {
  @override
  _loginHomePageState createState() => _loginHomePageState();
}

class _loginHomePageState extends State<loginHomePage> {
  FocusNode blankNode = FocusNode();
  TextStyle title = TextStyle(fontSize: 30.0,color:Colors.white);
  bool check = true;
  final registerFormKey = GlobalKey<FormState>();
  String phone, password,code;
  bool autovalidate = false;
  Timer _countdownTimer;
  int _count = config.COUNTER;
  String str = "";
  bool _isButton1Disabled = true;
  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  TextEditingController _controller = TextEditingController();

  //构建组件
  Widget builds(){
    Widget con ;
    if(_isButton1Disabled){
      con = OutlineButton(
        onPressed: _reGetCountdown,
        child: Text("发送验证码",style: TextStyle(color: Colors.white),),
        borderSide:new BorderSide(color:Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    }else{
      con = Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(str,style:TextStyle(color: Theme.of(context).backgroundColor),),
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

  //表单验证
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
  String validatePassword(value) {
    if (value.isEmpty) {
      return '请填写密码';
    }
    return null;
  }


  //获取验证吗

   _reGetCountdown() async {
     FocusScope.of(context).requestFocus(blankNode);
    if(phone == null){
      tosats("请填写手机号码");
      return;
    }
     if (!exp.hasMatch(phone)){
       tosats("请填写正确手机号码");
       return;
     }
    await Future.delayed(Duration(milliseconds: 0), () async{
      var res = await httpManager.netFetch(hostAddres.getNewCodeUrl(),{"mobile":phone.toString().trim(),"type":2}, null,  null);
      String resz = res.data.toString();
      Map datas = json.decode(resz);
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
      }
    });
  }
  //监听手机号码的输入
  _onchange(){
    String text = _controller.text;
    setState(() {
      phone = text;
    });
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
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: <Widget>[
            Text('注册',style:title ,),
            SizedBox(height: 20.0,),
            Text('手机号',style: TextStyle(color: Colors.white),),
            Container(
              child: TextFormField(
                controller: _controller,
                autovalidate: autovalidate,
                onSaved: (value) {
                  phone = value;
                },
                validator: validatePhone,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white,fontSize: 20.0,),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  errorStyle: TextStyle(color: Colors.orangeAccent),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  helperText: "",
                  labelText: '',
                  focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  prefixIcon: Container(
                    margin: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
                    width: 40.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    child: Center(child: Text('+86',style: TextStyle(color: Theme.of(context).primaryColor),),),
                  ),
                ),
              ),
            ),
//            SizedBox(height: 20.0,),
            Text('验证码',style: TextStyle(color: Colors.white),),
            TextFormField(
              autovalidate: autovalidate,
              onSaved: (value) {
                code = value;
              },
              validator: validateCode,
              keyboardType:TextInputType.number ,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white,fontSize: 20.0,),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  errorStyle: TextStyle(color: Colors.orangeAccent),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                  helperText: "",
                labelText: '',
                focusedBorder:UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: builds(),
                )
              ),
            ),
//            SizedBox(height: 20.0,),
            Text('登录密码',style: TextStyle(color: Colors.white),),
            TextFormField(
              autovalidate: autovalidate,
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              obscureText: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white,fontSize: 20.0,),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                errorStyle: TextStyle(color: Colors.orangeAccent),
                errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                helperText: "",

                labelText: '',
                focusedBorder:UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15.0),
                      color: Colors.white,
                      child:  Checkbox(
                        value: this.check,
                        useTapTarget: false,
                        activeColor: this.check ? Colors.white :Colors.deepOrange,
                        checkColor: Theme.of(context).primaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (bool val) {
                          // val 是布尔值
                          this.setState(() {
                            this.check = !this.check;
                          });
                        },
                      ),
                    ),
                    Text("同意居民卡管理办法",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                  ],
                ),

                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: IconButton(icon: Icon(Icons.keyboard_arrow_right,size: 30.0,color: Theme.of(context).primaryColor,), onPressed: submitRegisterForm)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  //提交
  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      if(!check){
        tosats("请同意居民卡管理办法");
        return;
      }
      _openAlretDialog();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }
  //加载层
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
  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) async {
    var option = {
    "cardCode":"",
    "credentialNo":"",
    "mobile":phone.toString().trim(),
    "passWord":password.toString().trim(),
    "username":"",
    "validateCode" : code.toString().trim(),
    };
    await Future.delayed(Duration(milliseconds: 1500), () async{
      var res = await httpManager.netFetch(hostAddres.getRegistUrl(),option, null,  null);
      String resz = res.data.toString();
      func();
      Map datas = json.decode(resz);
      if(datas["d"]["Code"] == 0){
        tosats(datas["d"]["Msg"]);
      }else{
        tosats("注册成功");
        await Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      }
    });
  }
}
