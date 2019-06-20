import 'package:flutter/material.dart';
import 'package:phone_yiyang/model/provide/provide.dart';
import 'package:phone_yiyang/pages/tabThird/hubThird.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/data_config.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scoped_model/scoped_model.dart';

import 'index.dart';

class thirdTab extends StatelessWidget {

  List<List<String>> userList = DataConfig.userList;

  var titleStyle = TextStyle(fontSize: 16.0,color: Colors.white);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: Center(
            child: ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: userList.length,
            ),
          )),
    );
  }
  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    final UserDataModel  userDataModel =  ScopedModel.of<UserDataModel>(context);
    userDataModel.getHeaderImg();
    userDataModel.getCard();
    userDataModel.getUsername();
    return <Widget>[
      SliverAppBar(
        centerTitle: true,    //标题居中
        expandedHeight: 180.0,  //展开高度200
        floating: false,  //不随着滑动隐藏标题
        pinned: true,    //固定在顶部
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.white,), onPressed: (){
            Alert(
              context: context,
              type: AlertType.info,
              style: AlertStyle(
                animationType: AnimationType.grow
              ),
              title: "提示",
              desc: "確定要退出嗎？",
              buttons: [
                DialogButton(
                  child: Text(
                    "取消",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(116, 116, 191, 1.0),
                    Color.fromRGBO(52, 138, 199, 1.0)
                  ]),
                ),
                DialogButton(
                  child: Text(
                    "确定",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return new NetLoadingDialog(
                            dismissDialog: (Function func)async{
                              await Future.delayed(Duration(milliseconds: 1500), () async{
                                func();
                                LocalStorage.remove('currentUser');
                                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>BottomNav() ), (Route<dynamic> rout)=>false);
                              });
                            },
                            outsideDismiss: false,
                          );
                        });
                  },
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(116, 116, 191, 1.0),
                    Color.fromRGBO(52, 138, 199, 1.0)
                  ]),
                )
              ],
            ).show();

          })
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(userDataModel.username == null ?"abc21312":userDataModel.username,style: titleStyle,),
          background:Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.themeColorLight,Theme.of(context).primaryColor],
                    begin: Alignment.topLeft
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(userDataModel.headerImg == null?"http://60.247.61.162:8019/Upload/Images/ModelImages/Img-20190419173341.jpg":userDataModel.headerImg,),
                ),
                SizedBox(height: 25.0,),
                Text(userDataModel.card.substring(0,4)+"*******"+userDataModel.card.substring(userDataModel.card.length-4),style: TextStyle(color: Colors.white,fontSize: 16.0),),
              ],
            ),
          ),
        ),
      )
    ];
  }

  Widget _itemBuilder(BuildContext context, int index) {
   // if (index.isEven) return new Divider();

    return ListTile(
      dense: true,
      leading: Image.asset(userList[index][1],width: 25.0,),
      title: Text(userList[index][0],style: TextStyle(fontSize: 14.0,fontFamily: "alr"),),
      trailing: Icon(Icons.chevron_right),
      onTap: (){
        if(userList[index][0] == "云闪付绑卡" || userList[index][0] == "实名认证"){
          Alert(
            context: context,
            type: AlertType.warning,
            style: AlertStyle(
                animationType: AnimationType.grow
            ),
            title: "提示",
            desc: "该功能尚未完全开放",
            buttons: [
              DialogButton(
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(116, 116, 191, 1.0),
                  Color.fromRGBO(52, 138, 199, 1.0)
                ]),
              )
            ],
          ).show();
        }else{
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => hubThird(userList[index][0])),
          );
        }
      },
    );
  }
}

