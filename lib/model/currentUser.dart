import 'dart:convert';

class CurrentUserD {
  int code;
  int errorCode;
  String msg;
  ResultCurrentUser result;

  CurrentUserD({this.code, this.errorCode, this.msg, this.result});

  CurrentUserD.fromJson(String str) {
    Map<String, dynamic> jsonA = json.decode(str)['d'];
    code = jsonA['Code'];
    errorCode = jsonA['ErrorCode'];
    msg = jsonA['Msg'];
    if (jsonA['Result'] != null) {
      var jsResult = json.decode(jsonA['Result']);
      result = ResultCurrentUser.fromJson(jsResult);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['ErrorCode'] = this.errorCode;
    data['Msg'] = this.msg;
    if (this.result != null) {
      data['Result'] = this.result;
    }
    return data;
  }
}

class ResultCurrentUser {
  int authStatus;
  Null bankCardNo;
  Null chinaName;
  String fCard;
  String fCreateTime;
  String fEmail;
  int fEmailValidated;
  String fExpireTime;
  String fHeadImg;
  Null fID;
  String fPassword;
  String fTelephone;
  int fUniqueId;
  String fUserName;
  String iCCard;
  String virtualTelephone;

  ResultCurrentUser(
      {this.authStatus,
      this.bankCardNo,
      this.chinaName,
      this.fCard,
      this.fCreateTime,
      this.fEmail,
      this.fEmailValidated,
      this.fExpireTime,
      this.fHeadImg,
      this.fID,
      this.fPassword,
      this.fTelephone,
      this.fUniqueId,
      this.fUserName,
      this.iCCard,
      this.virtualTelephone});

  ResultCurrentUser.fromJson(Map<String, dynamic> jsonA) {
    authStatus = jsonA['AuthStatus'];
    bankCardNo = jsonA['BankCardNo'];
    chinaName = jsonA['ChinaName'];
    fCard = jsonA['FCard'];
    fCreateTime = jsonA['FCreateTime'];
    fEmail = jsonA['FEmail'];
    fEmailValidated = jsonA['FEmailValidated'];
    fExpireTime = jsonA['FExpireTime'];
    fHeadImg = jsonA['FHeadImg'];
    fID = jsonA['FID'];
    fPassword = jsonA['FPassword'];
    fTelephone = jsonA['FTelephone'];
    fUniqueId = jsonA['FUniqueId'];
    fUserName = jsonA['FUserName'];
    iCCard = jsonA['ICCard'];
    virtualTelephone = jsonA['VirtualTelephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuthStatus'] = this.authStatus;
    data['BankCardNo'] = this.bankCardNo;
    data['ChinaName'] = this.chinaName;
    data['FCard'] = this.fCard;
    data['FCreateTime'] = this.fCreateTime;
    data['FEmail'] = this.fEmail;
    data['FEmailValidated'] = this.fEmailValidated;
    data['FExpireTime'] = this.fExpireTime;
    data['FHeadImg'] = this.fHeadImg;
    data['FID'] = this.fID;
    data['FPassword'] = this.fPassword;
    data['FTelephone'] = this.fTelephone;
    data['FUniqueId'] = this.fUniqueId;
    data['FUserName'] = this.fUserName;
    data['ICCard'] = this.iCCard;
    data['VirtualTelephone'] = this.virtualTelephone;
    return data;
  }
}
