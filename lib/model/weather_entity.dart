class WeatherEntity {
	WeatherD d;

	WeatherEntity({this.d});

	WeatherEntity.fromJson(Map<String, dynamic> json) {
		d = json['d'] != null ? new WeatherD.fromJson(json['d']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.d != null) {
      data['d'] = this.d.toJson();
    }
		return data;
	}
}

class WeatherD {
	String date;
	String high;
	String city;
	String low;
	String sType;
	String aqi;
	String type;

	WeatherD({this.date, this.high, this.city, this.low, this.sType, this.aqi, this.type});

	WeatherD.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		high = json['high'];
		city = json['city'];
		low = json['low'];
		sType = json['__type'];
		aqi = json['aqi'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['high'] = this.high;
		data['city'] = this.city;
		data['low'] = this.low;
		data['__type'] = this.sType;
		data['aqi'] = this.aqi;
		data['type'] = this.type;
		return data;
	}
}
