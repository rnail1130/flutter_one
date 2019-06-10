import 'package:flutter/material.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';

import '../index.dart';
import 'forgetPwd.dart';

class registered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
class loginHomePage extends StatefulWidget {
  @override
  _loginHomePageState createState() => _loginHomePageState();
}

class _loginHomePageState extends State<loginHomePage> {
  TextStyle title = TextStyle(fontSize: 30.0,color:Colors.white);
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: <Widget>[
          Text('注册',style:title ,),
          SizedBox(height: 20.0,),
          Text('手机号',style: TextStyle(color: Colors.white),),
          Container(
            child: TextField(
              keyboardType: TextInputType.phone,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white,fontSize: 20.0,),
              decoration: InputDecoration(
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
          SizedBox(height: 20.0,),
          Text('验证码',style: TextStyle(color: Colors.white),),
          Container(
            height: 50.0,
            child: TextField(
              obscureText: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white,fontSize: 20.0,),
              decoration: InputDecoration(
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
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('发送验证码',style: TextStyle(color: Colors.white),),
                    borderSide:new BorderSide(color:Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Text('登录密码',style: TextStyle(color: Colors.white),),
          Container(
            height: 50.0,
            child: TextField(
              obscureText: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white,fontSize: 20.0,),
              decoration: InputDecoration(

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
                  child: IconButton(icon: Icon(Icons.keyboard_arrow_right,size: 30.0,color: Theme.of(context).primaryColor,), onPressed: (){
/*                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => registered()),
                    );*/
                    LocalStorage.set('username', 'zhangxuefeng');
                    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>BottomNav() ), (Route<dynamic> rout)=>false);
                  })
              )
            ],
          ),
        ],
      ),
    );
  }
}
