//int i = 0;
//
//class CardBagIndexAllEntity {
//  CardBagIndexAllD d;
//
//  CardBagIndexAllEntity({this.d});
//
//  CardBagIndexAllEntity.fromJson(Map<String, dynamic> json) {
//    d = json['d'] != null ? new CardBagIndexAllD.fromJson(json['d']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.d != null) {
//      data['d'] = this.d.toJson();
//    }
//    return data;
//  }
//}
//
class CardBagIndexAllD {
  dynamic msg;
  int code;
  List<CardBagIndexAllDResult> result;

  CardBagIndexAllD({this.msg, this.code, this.result});

  CardBagIndexAllD.fromJson(Map<String, dynamic> json) {
    msg = json['Msg'];
    code = json['Code'];
    if (json['Result'] != null) {
      result = new List<CardBagIndexAllDResult>();
      (json['Result'] as List).forEach((v) {
        result.add(new CardBagIndexAllDResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msg'] = this.msg;
    data['Code'] = this.code;
    if (this.result != null) {
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardBagIndexAllDResult {
  int status;
  double marketPrice;
  String sType;
  String instructions;
  int ticketType;
  double salePrice;
  String endDate;
  String ticketName;
  String imgUrl;
  String virtualCode;
  String ticketCode;

  CardBagIndexAllDResult(
      {this.status,
      this.marketPrice,
      this.sType,
      this.instructions,
      this.ticketType,
      this.salePrice,
      this.endDate,
      this.ticketName,
      this.imgUrl,
      this.virtualCode,
      this.ticketCode});

  CardBagIndexAllDResult.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    marketPrice = double.parse(json['MarketPrice'].toString());
    sType = json['__type'];
    instructions = json['Instructions'];
    ticketType = json['TicketType'];
    salePrice = json['SalePrice'] != null ? 0 : json['SalePrice'];
    endDate = json['EndDate'];
    ticketName = json['TicketName'];
    imgUrl = json['ImgUrl'];
    virtualCode = json['VirtualCode'];
    ticketCode = json['TicketCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['MarketPrice'] = this.marketPrice;
    data['__type'] = this.sType;
    data['Instructions'] = this.instructions;
    data['TicketType'] = this.ticketType;
    data['SalePrice'] = this.salePrice;
    data['EndDate'] = this.endDate;
    data['TicketName'] = this.ticketName;
    data['ImgUrl'] = this.imgUrl;
    data['VirtualCode'] = this.virtualCode;
    data['TicketCode'] = this.ticketCode;
    return data;
  }
}
