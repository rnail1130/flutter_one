class CardBagIndexMobleD {
  int code;
  Null msg;
  CardBagIndexMobleResult result;

  CardBagIndexMobleD({this.code, this.msg, this.result});

  CardBagIndexMobleD.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    msg = json['Msg'];
    result =
        json['Result'] != null ? new CardBagIndexMobleResult.fromJson(json['Result']) : null;
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

class CardBagIndexMobleResult {
  String sType;
  int validDays;
  double balance;

  CardBagIndexMobleResult({this.sType, this.validDays, this.balance});

  CardBagIndexMobleResult.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    validDays = json['ValidDays'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['ValidDays'] = this.validDays;
    data['Balance'] = this.balance;
    return data;
  }
}