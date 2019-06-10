class OrderHistoryEntity {
	OrderHistoryD d;

	OrderHistoryEntity({this.d});

	OrderHistoryEntity.fromJson(Map<String, dynamic> json) {
		d = json['d'] != null ? new OrderHistoryD.fromJson(json['d']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.d != null) {
      data['d'] = this.d.toJson();
    }
		return data;
	}
}

class OrderHistoryD {
	dynamic msg;
	int code;
	List<OrderHistoryDResult> result;

	OrderHistoryD({this.msg, this.code, this.result});

	OrderHistoryD.fromJson(Map<String, dynamic> json) {
		msg = json['Msg'];
		code = json['Code'];
		if (json['Result'] != null) {
			result = new List<OrderHistoryDResult>();(json['Result'] as List).forEach((v) { result.add(new OrderHistoryDResult.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Msg'] = this.msg;
		data['Code'] = this.code;
		if (this.result != null) {
      data['Result'] =  this.result.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OrderHistoryDResult {
	String status;
	int payStatus;
	dynamic orderMakerDate;
	dynamic amount;
	dynamic orderCode;
	int count;
	String ticketName;
	String verifyDate;
	int type;
	dynamic merchantName;
	double marketPrice;
	String sType;
	dynamic fOrderValidDate;
	String productImg;
	dynamic payTime;
	dynamic introductions;
	int payManner;

	OrderHistoryDResult({this.status, this.payStatus, this.orderMakerDate, this.amount, this.orderCode, this.count, this.ticketName, this.verifyDate, this.type, this.merchantName, this.marketPrice, this.sType, this.fOrderValidDate, this.productImg, this.payTime, this.introductions, this.payManner});

	OrderHistoryDResult.fromJson(Map<String, dynamic> json) {
		status = json['Status'];
		payStatus = json['PayStatus'];
		orderMakerDate = json['OrderMakerDate'];
		amount = json['Amount'];
		orderCode = json['OrderCode'];
		count = json['Count'];
		ticketName = json['TicketName'];
		verifyDate = json['VerifyDate'];
		type = json['Type'];
		merchantName = json['MerchantName'];
		marketPrice = json['MarketPrice'];
		sType = json['__type'];
		fOrderValidDate = json['FOrderValidDate'];
		productImg = json['ProductImg'];
		payTime = json['PayTime'];
		introductions = json['Introductions'];
		payManner = json['PayManner'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Status'] = this.status;
		data['PayStatus'] = this.payStatus;
		data['OrderMakerDate'] = this.orderMakerDate;
		data['Amount'] = this.amount;
		data['OrderCode'] = this.orderCode;
		data['Count'] = this.count;
		data['TicketName'] = this.ticketName;
		data['VerifyDate'] = this.verifyDate;
		data['Type'] = this.type;
		data['MerchantName'] = this.merchantName;
		data['MarketPrice'] = this.marketPrice;
		data['__type'] = this.sType;
		data['FOrderValidDate'] = this.fOrderValidDate;
		data['ProductImg'] = this.productImg;
		data['PayTime'] = this.payTime;
		data['Introductions'] = this.introductions;
		data['PayManner'] = this.payManner;
		return data;
	}
}
