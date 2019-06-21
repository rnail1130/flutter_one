class CardDetailsEntity {
	CardDetailsD d;

	CardDetailsEntity({this.d});

	CardDetailsEntity.fromJson(Map<String, dynamic> json) {
		d = json['d'] != null ? new CardDetailsD.fromJson(json['d']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.d != null) {
      data['d'] = this.d.toJson();
    }
		return data;
	}
}

class CardDetailsD {
	dynamic msg;
	int code;
	CardDetailsDResult result;

	CardDetailsD({this.msg, this.code, this.result});

	CardDetailsD.fromJson(Map<String, dynamic> json) {
		msg = json['Msg'];
		code = json['Code'];
		result = json['Result'] != null ? new CardDetailsDResult.fromJson(json['Result']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Msg'] = this.msg;
		data['Code'] = this.code;
		if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
		return data;
	}
}

class CardDetailsDResult {
	int status;
	List<CardDetailsDResultMerchant> merchants;
	String instructions;
	String endDate;
	String ticketName;
	String imgUrl;
	String ticketCode;
	int limitCount;
	String startDate;
	var marketPrice;
	String sType;
	int ticketType;
	dynamic salePrice;
	String ticketDescription;
	dynamic virtualCode;

	CardDetailsDResult({this.status, this.merchants, this.instructions, this.endDate, this.ticketName, this.imgUrl, this.ticketCode, this.limitCount, this.startDate, this.marketPrice, this.sType, this.ticketType, this.salePrice, this.ticketDescription, this.virtualCode});

	CardDetailsDResult.fromJson(Map<String, dynamic> json) {
		status = json['Status'];
		if (json['Merchants'] != null) {
			merchants = new List<CardDetailsDResultMerchant>();(json['Merchants'] as List).forEach((v) { merchants.add(new CardDetailsDResultMerchant.fromJson(v)); });
		}
		instructions = json['Instructions'];
		endDate = json['EndDate'];
		ticketName = json['TicketName'];
		imgUrl = json['ImgUrl'];
		ticketCode = json['TicketCode'];
		limitCount = json['LimitCount'];
		startDate = json['StartDate'];
		marketPrice = json['MarketPrice'];
		sType = json['__type'];
		ticketType = json['TicketType'];
		salePrice = json['SalePrice'];
		ticketDescription = json['TicketDescription'];
		virtualCode = json['VirtualCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Status'] = this.status;
		if (this.merchants != null) {
      data['Merchants'] =  this.merchants.map((v) => v.toJson()).toList();
    }
		data['Instructions'] = this.instructions;
		data['EndDate'] = this.endDate;
		data['TicketName'] = this.ticketName;
		data['ImgUrl'] = this.imgUrl;
		data['TicketCode'] = this.ticketCode;
		data['LimitCount'] = this.limitCount;
		data['StartDate'] = this.startDate;
		data['MarketPrice'] = this.marketPrice;
		data['__type'] = this.sType;
		data['TicketType'] = this.ticketType;
		data['SalePrice'] = this.salePrice;
		data['TicketDescription'] = this.ticketDescription;
		data['VirtualCode'] = this.virtualCode;
		return data;
	}
}

class CardDetailsDResultMerchant {
	String merName;
	String telephone;
	String address;
	String sType;
	String merCode;

	CardDetailsDResultMerchant({this.merName, this.telephone, this.address, this.sType, this.merCode});

	CardDetailsDResultMerchant.fromJson(Map<String, dynamic> json) {
		merName = json['MerName'];
		telephone = json['Telephone'];
		address = json['Address'];
		sType = json['__type'];
		merCode = json['MerCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['MerName'] = this.merName;
		data['Telephone'] = this.telephone;
		data['Address'] = this.address;
		data['__type'] = this.sType;
		data['MerCode'] = this.merCode;
		return data;
	}
}
