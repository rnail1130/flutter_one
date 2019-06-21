class OrderInfoD {
  int code;
  String msg;
  List<OrderInfoResult> result;

  OrderInfoD({this.code, this.msg, this.result});

  OrderInfoD.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    msg = json['Msg'];
    if (json['Result'] != null) {
      result = new List<OrderInfoResult>();
      json['Result'].forEach((v) {
        result.add(OrderInfoResult.fromJson(v));
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

class OrderInfoResult {
  String sType;
  double amount;
  int payStatus;
  String orderCode;
  int payManner;
  String payTime;
  String orderMakerDate;
  Null fOrderValidDate;
  Null verifyDate;
  Null marketPrice;
  Null ticketName;
  int count;
  Null productImg;
  List<Introductions> introductions;

  OrderInfoResult(
      {this.sType,
      this.amount,
      this.payStatus,
      this.orderCode,
      this.payManner,
      this.payTime,
      this.orderMakerDate,
      this.fOrderValidDate,
      this.verifyDate,
      this.marketPrice,
      this.ticketName,
      this.count,
      this.productImg,
      this.introductions});

  OrderInfoResult.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    amount = json['Amount'];
    payStatus = json['PayStatus'];
    orderCode = json['OrderCode'];
    payManner = json['PayManner'];
    payTime = json['PayTime'];
    orderMakerDate = json['OrderMakerDate'];
    fOrderValidDate = json['FOrderValidDate'];
    verifyDate = json['VerifyDate'];
    marketPrice = json['MarketPrice'];
    ticketName = json['TicketName'];
    count = json['Count'];
    productImg = json['ProductImg'];
    if (json['Introductions'] != null) {
      introductions = new List<Introductions>();
      json['Introductions'].forEach((v) {
        introductions.add(new Introductions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['Amount'] = this.amount;
    data['PayStatus'] = this.payStatus;
    data['OrderCode'] = this.orderCode;
    data['PayManner'] = this.payManner;
    data['PayTime'] = this.payTime;
    data['OrderMakerDate'] = this.orderMakerDate;
    data['FOrderValidDate'] = this.fOrderValidDate;
    data['VerifyDate'] = this.verifyDate;
    data['MarketPrice'] = this.marketPrice;
    data['TicketName'] = this.ticketName;
    data['Count'] = this.count;
    data['ProductImg'] = this.productImg;
    if (this.introductions != null) {
      data['Introductions'] =
          this.introductions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Introductions {
  String logo;
  double marketPrice;
  String ticketName;
  int count;

  Introductions({this.logo, this.marketPrice, this.ticketName, this.count});

  Introductions.fromJson(Map<String, dynamic> json) {
    logo = json['Logo'];
    marketPrice = json['MarketPrice'];
    ticketName = json['TicketName'];
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Logo'] = this.logo;
    data['MarketPrice'] = this.marketPrice;
    data['TicketName'] = this.ticketName;
    data['Count'] = this.count;
    return data;
  }
}