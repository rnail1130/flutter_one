import 'dart:convert';

class BankBranchesListD {
  List<BankBranchesList> d;

  BankBranchesListD({this.d});

  BankBranchesListD.fromJson(Map<String, dynamic> json) {
    if (json['d'] != null && json['d'] != "") {
      d = new List<BankBranchesList>();
      json['d'] = parse(json['d'].toString());
      json['d'].forEach((v) {
        d.add(new BankBranchesList.fromJson(v));
      });
    } else {
      d = null;
    }
  }
  parse(str) {
    return json.decode(str);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankBranchesList {
  var fUniqueId;
  var fMapCoordinateUniqueId;
  var fMerchantCode;
  var fDescription;
  var fTitle;
  var fName;
  var fAddress;
  var fTelephone;
  var fImagePath;

  BankBranchesList(
      {this.fUniqueId,
      this.fMapCoordinateUniqueId,
      this.fMerchantCode,
      this.fDescription,
      this.fTitle,
      this.fName,
      this.fAddress,
      this.fTelephone,
      this.fImagePath});

  BankBranchesList.fromJson(Map<String, dynamic> json) {
    fUniqueId = json['FUniqueId'];
    fMapCoordinateUniqueId = json['FMapCoordinateUniqueId'];
    fMerchantCode = json['FMerchantCode'];
    fDescription = json['FDescription'];
    fTitle = json['FTitle'];
    fName = json['FName'];
    fAddress = json['FAddress'];
    fTelephone = json['FTelephone'];
    fImagePath = json['FImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FUniqueId'] = this.fUniqueId;
    data['FMapCoordinateUniqueId'] = this.fMapCoordinateUniqueId;
    data['FMerchantCode'] = this.fMerchantCode;
    data['FDescription'] = this.fDescription;
    data['FTitle'] = this.fTitle;
    data['FName'] = this.fName;
    data['FAddress'] = this.fAddress;
    data['FTelephone'] = this.fTelephone;
    data['FImagePath'] = this.fImagePath;
    return data;
  }
}
