class UserInfoEntity {
	UserInfoD d;

	UserInfoEntity({this.d});

	UserInfoEntity.fromJson(Map<String, dynamic> json) {
		d = json['d'] != null ? new UserInfoD.fromJson(json['d']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.d != null) {
      data['d'] = this.d.toJson();
    }
		return data;
	}
}

class UserInfoD {
	String msg;
	String sType;
	int errorCode;
	int code;
	String result;

	UserInfoD({this.msg, this.sType, this.errorCode, this.code, this.result});

	UserInfoD.fromJson(Map<String, dynamic> json) {
		msg = json['Msg'];
		sType = json['__type'];
		errorCode = json['ErrorCode'];
		code = json['Code'];
		result = json['Result'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Msg'] = this.msg;
		data['__type'] = this.sType;
		data['ErrorCode'] = this.errorCode;
		data['Code'] = this.code;
		data['Result'] = this.result;
		return data;
	}
}
