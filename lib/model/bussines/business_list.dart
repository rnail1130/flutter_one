import 'dart:convert';

class BusinessListD {
  int code;
  Null msg;
  List<ResultBusinessList> result;

  BusinessListD({this.code, this.msg, this.result});

  BusinessListD.fromJson(String str) {
    Map<String, dynamic> jsonA = json.decode(str)['d'];
    code = jsonA['Code'];
    msg = jsonA['Msg'];
    if (jsonA['Result'] != null) {
      result = new List<ResultBusinessList>();
      jsonA['Result'].forEach((v) {
        result.add(new ResultBusinessList.fromJson(v));
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

class ResultBusinessList {
  String sType;
  int status;
  String name;
  String code;
  Null codeType;
  Null categoryCode;
  String businessCode;

  ResultBusinessList(
      {
      this.sType,
      this.status,
      this.name,
      this.code,
      this.codeType,
      this.categoryCode,
      this.businessCode});

  ResultBusinessList.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    status = json['Status'];
    name = json['Name'];
    code = json['Code'];
    codeType = json['CodeType'];
    categoryCode = json['CategoryCode'];
    businessCode = json['BusinessCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['Status'] = this.status;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['CodeType'] = this.codeType;
    data['CategoryCode'] = this.categoryCode;
    data['BusinessCode'] = this.businessCode;
    return data;
  }
}
