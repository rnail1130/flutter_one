class LandscapeindexD {
  int code;
  Null msg;
  List<LandscapeindexResult> result;

  LandscapeindexD({this.code, this.msg, this.result});

  LandscapeindexD.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    msg = json['Msg'];
    if (json['Result'] != null) {
      result = new List<LandscapeindexResult>();
      json['Result'].forEach((v) {
        result.add(new LandscapeindexResult.fromJson(v));
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

class LandscapeindexResult {
  String sType;
  int id;
  String title;
  String cite;
  String dateTime;
  String imageUrl;

  LandscapeindexResult(
      {this.sType,
      this.id,
      this.title,
      this.cite,
      this.dateTime,
      this.imageUrl});

  LandscapeindexResult.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    id = json['Id'];
    title = json['Title'];
    cite = json['Cite'];
    dateTime = json['DateTime'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['Id'] = this.id;
    data['Title'] = this.title;
    data['Cite'] = this.cite;
    data['DateTime'] = this.dateTime;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}