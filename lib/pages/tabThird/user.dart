import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_yiyang/model/provide/provide.dart';
import 'package:phone_yiyang/utiles/Dialogs.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'hubThird.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_yiyang/utiles/config.dart';


class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  String url;
  String name;
  String card;
  String idcard;
  String phone;
  String img;
  File imageFile;
  UserDataModel userDataModel;
  TextStyle font1 = TextStyle(
    fontSize: 12.0,
    color: Colors.black45
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataModel =  ScopedModel.of<UserDataModel>(context);
   // userDataModel.getHeaderImg();
    _getData();
  }
  _getData() async {
    String phze = await LocalStorage.get("currentUser");
    Map prit = jsonDecode(phze);
    setState(() {
      phone = prit["FTelephone"];
      name = prit["FUserName"];
      card = prit["FCard"];
      idcard = prit["FID"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: _imgPick,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage:NetworkImage(userDataModel.headerImg)
                ),
                Icon(Icons.chevron_right,color: Colors.black45,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('持卡人姓名'),
                Text(name ==null?"":name,style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('居民卡卡号'),
                Text(card==null?"":card,style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('身份证号'),
                Text(idcard==null?"":idcard,style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('手机号码'),
                Text(phone==null?"":phone,style: font1,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => hubThird("修改邮箱")),
            );
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('邮箱'),
                Icon(Icons.chevron_right,color: Colors.black45,),
              ],
            ),
          ),
        ),
      ],
    );
  }
  _imgPick(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  leading: Image.asset("assets/images/carme.png"),
                  title: new Text("相机"),
                  onTap: () async {
                    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
                    Navigator.pop(context);
                    _openAlretDialog();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  leading: Image.asset("assets/images/xiangce.png"),
                  title: new Text("相册"),
                  onTap: () async {
                    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
                    Navigator.pop(context);
                    _openAlretDialog();
                  },
                ),
              ),
            ],
          );
        }
    );
  }
  _openAlretDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return new NetLoadingDialog(
            dismissDialog:_upLoadImage,
            outsideDismiss: false,
          );
        });
  }
    _upLoadImage(Function func) async {
      String path = imageFile.path;

      var name = path.substring(path.lastIndexOf("/") + 1, path.length);
      var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);

      FormData formData = new FormData.from({
        "file": new UploadFileInfo(new File(path), name,
            contentType: ContentType.parse("image/$suffix"))
      });

      Dio dio = new Dio();
      var respone = await dio.post<String>(config.API_VER+"/UploadImg.aspx?userCode="+card, data: formData);
      setState(() {
        img = respone.data;
        userDataModel.changeImage(img);
      });
      func();
      if(respone.statusCode == 500){
        Fluttertoast.showToast(
            msg: "网络连接错误，请检查网络",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      if (respone.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "图片上传成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }

}
