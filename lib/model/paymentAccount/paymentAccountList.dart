import 'dart:convert';

class PaymentAccountListD {
  int code;
  String msg;
  List<PaymentAccountList> result;

  PaymentAccountListD({this.code, this.msg, this.result});

  PaymentAccountListD.fromJson(str) {
    var jsonA = json.decode(str)['d'];
    code = jsonA['Code'];
    msg = jsonA['Msg'];
    if (jsonA['Result'] != null) {
      result = new List<PaymentAccountList>();
      jsonA['Result'].forEach((v) {
        result.add(new PaymentAccountList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Msg'] = this.msg;
    if (this.result != null) {
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentAccountList {
  int status;
  int accountCount;
  String name;
  String code;
  String businessCode;
  String categoryCode;

  PaymentAccountList(
      {this.status,
      this.accountCount,
      this.name,
      this.code,
      this.businessCode,
      this.categoryCode});

  PaymentAccountList.fromJson(Map<String, dynamic> jsonA) {
    status = jsonA['Status'];
    accountCount = jsonA['AccountCount'];
    name = jsonA['Name'];
    code = jsonA['Code'];
    businessCode = jsonA['BusinessCode'];
    categoryCode = jsonA['CategoryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['AccountCount'] = this.accountCount;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['BusinessCode'] = this.businessCode;
    data['CategoryCode'] = this.categoryCode;
    return data;
  }
}
