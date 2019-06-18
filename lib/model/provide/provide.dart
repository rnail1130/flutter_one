import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:phone_yiyang/utiles/getHost.dart';
import 'package:phone_yiyang/model/user_info_entity.dart';

class UserDataModel extends Model {
  Map responData;
  String headerImg;
  String Cards;
  String userName;
  UserDataModel(){
    getUserInfo((data){
      if(data == null){
        LocalStorage.remove('currentUser');
      } else{
        getHeaderImg();
        getCard();
        getUsername();
      }
    });
  }
  //用户登陆 保存信息
  userLogin(String phone,String password) async {
    var res = await httpManager.netFetch(hostAddres.getLoginUrl(),{"mobile":phone.toString().trim(),"passWord":password.toString().trim()}, null,  null);
    responData = jsonDecode(res.data.toString());
    notifyListeners();
    //更新本地缓存的数据
    LocalStorage.set(
        'currentUser',
        responData["d"]["Result"]
    );
    LocalStorage.set(
        'username',
        phone
    );
    LocalStorage.set(
        'password',
        password
    );
  }
  getUserInfo(callback) async {
    String userInfo = await LocalStorage.get("currentUser");
    callback(userInfo);
  }
  //获取头像的数据
  getHeaderImg() async {
    getUserInfo((data){
      headerImg = jsonDecode(data)["FHeadImg"];
      notifyListeners();
    });
  }
  //获取姓名
  getUsername() async {
    getUserInfo((data){
      userName = jsonDecode(data)["FUserName"];
      notifyListeners();
    });
  }
  //获取居民卡卡号
  getCard() async {
    getUserInfo((data){
      Cards = jsonDecode(data)["FCard"];
      notifyListeners();
    });
  }
  //头像更改
  changeImage(String img) async {
    headerImg = img;
    notifyListeners();
    String phone = await LocalStorage.get("username");
    String pwd = await LocalStorage.get("password");
    userLogin(phone,pwd);
   await Future.delayed(Duration(milliseconds: 100), () {
     getHeaderImg();
    });
  }
  Map get Data => responData;
  String get hImg => headerImg;
  String get card => Cards;
  String get username => userName;



/*  String datas;
  Map userInfo ;

  String img = "http://60.247.61.162:8020/UploadFiles/HeaderImgs/temp_1554116484560.jpg";
  getUserLoginStatus() async {
    datas = await LocalStorage.get("currentUser");
    userInfo = json.decode(datas);
    notifyListeners();
  }
  //更新图片的地址
  void changeImg(String imgz){
    img = imgz;
    notifyListeners();
  }
  String get imgs => img;
  String get dataRes => datas;//所有的用户数据*/
/*  String get BankCardNo =>userInfo["BankCardNo"];
  String get ChiaName =>userInfo["ChiaName"];
  String get FCard =>userInfo["FCard"];
  String get FCreateTime =>userInfo["FCreateTime"];
  String get FEmail =>userInfo["FEmail"];
  int get FEmailValidated =>userInfo["FEmailValidated"];
  String get FExpireTime =>userInfo["FExpireTime"];
  String get FHeadImg =>userInfo["FHeadImg"];
  String get FID =>userInfo["FID"];
  String get FIsAuthenticate =>userInfo["FIsAuthenticate"];
  String get FPassword =>userInfo["FPassword"];
  String get FTelephone =>userInfo["FTelephone"];
  int get FUniqueId =>userInfo["FUniqueId"];
  String get FUserName =>userInfo["FUserName"];
  String get ICCard =>userInfo["ICCard"];
  String get VirtualTelephone =>userInfo["VirtualTelephone"];*/
  static UserDataModel of(BuildContext context) => ScopedModel.of<UserDataModel>(context);
}