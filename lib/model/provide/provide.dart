import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:phone_yiyang/utiles/getHost.dart';
import 'package:phone_yiyang/model/user_info_entity.dart';

class UserDataModel extends Model {
  String datas;
  Map userInfo ;

  getUserLoginStatus() async {
    datas = await LocalStorage.get("currentUser");
    userInfo = json.decode(datas);
    notifyListeners();
  }

  String get dataRes => datas;//所有的用户数据
  String get BankCardNo =>userInfo["BankCardNo"];
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
  String get VirtualTelephone =>userInfo["VirtualTelephone"];
  static UserDataModel of(BuildContext context) => ScopedModel.of<UserDataModel>(context);
}