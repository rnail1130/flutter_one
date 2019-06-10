import 'dart:convert';

import 'business_PhoneIP.dart';

class BusinessDetailD {
  int code;
  Null msg;
  BusinessDetail result;

  BusinessDetailD({this.code, this.msg, this.result});

  BusinessDetailD.fromJson(String str, PhoneIP jsonB) {
    Map<String, dynamic> jsonA = json.decode(str)['d'];
    code = jsonA['Code'];
    msg = jsonA['Msg'];
    var jsResult = json.decode(jsonA['Result']);
    result = jsonA['Result'] != null
        ? new BusinessDetail.fromJson(jsResult, jsonB)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Msg'] = this.msg;
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}

class BusinessDetail {
  String iDCard;
  dynamic telephone;
  String email;
  dynamic balance;
  dynamic balanceTime;
  dynamic bankName;
  dynamic bankPersonName;
  String fullName;
  dynamic bindDate;
  dynamic unBindDate;
  dynamic remark;
  int status;
  dynamic name;
  String code;
  dynamic codeType;
  dynamic categoryCode;
  String businessCode;
  String operator_;
  String iP;
  BusinessDetail(
      {this.iDCard,
      this.telephone,
      this.email,
      this.balance,
      this.balanceTime,
      this.bankName,
      this.bankPersonName,
      this.fullName,
      this.bindDate,
      this.unBindDate,
      this.remark,
      this.status,
      this.name,
      this.code,
      this.codeType,
      this.categoryCode,
      this.businessCode});

  BusinessDetail.fromJson(Map<String, dynamic> json, PhoneIP jsonB) {
    iDCard = json['IDCard'] != null ? json['IDCard'] : '';
    telephone = json['Telephone'] != null ? json['Telephone'] : '';
    email = json['Email'] != null ? json['Email'] : '';
    balance = json['Balance'] != null ? json['Balance'] : '';
    balanceTime = json['BalanceTime'] != null ? json['BalanceTime'] : '';
    bankName = json['BankName'] != null ? json['BankName'] : '';
    bankPersonName =
        json['BankPersonName'] != null ? json['BankPersonName'] : '';
    fullName = json['FullName'] != null ? json['FullName'] : '';
    bindDate = json['BindDate'] != null ? json['BindDate'] : '';
    unBindDate = json['UnBindDate'] != null ? json['UnBindDate'] : '';
    remark = json['Remark'] != null ? json['Remark'] : '';
    status = json['Status'] != null ? json['Status'] : '';
    name = json['Name'] != null ? json['Name'] : '';
    code = json['Code'] != null ? json['Code'] : '';
    codeType = json['CodeType'] != null ? json['CodeType'] : '';
    categoryCode = json['CategoryCode'] != null ? json['CategoryCode'] : '';
    businessCode = json['BusinessCode'] != null ? json['BusinessCode'] : '';
    if (jsonB != null) {
      operator_ = jsonB.operator_;
      iP = jsonB.iP;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDCard'] = this.iDCard;
    data['Telephone'] = this.telephone;
    data['Email'] = this.email;
    data['Balance'] = this.balance;
    data['BalanceTime'] = this.balanceTime;
    data['BankName'] = this.bankName;
    data['BankPersonName'] = this.bankPersonName;
    data['FullName'] = this.fullName;
    data['BindDate'] = this.bindDate;
    data['UnBindDate'] = this.unBindDate;
    data['Remark'] = this.remark;
    data['Status'] = this.status;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['CodeType'] = this.codeType;
    data['CategoryCode'] = this.categoryCode;
    data['BusinessCode'] = this.businessCode;
    return data;
  }
}
