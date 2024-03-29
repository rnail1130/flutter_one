import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/model/bussines/business_PhoneIP.dart';
import 'package:phone_yiyang/model/bussines/business_detail.dart';
import 'package:phone_yiyang/model/bussines/business_list.dart';
import 'package:phone_yiyang/model/bussines/businButtons.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/detail_msg.dart';
import 'package:phone_yiyang/utiles/core.dart';

var ifsign;

class TiedListDetail extends StatefulWidget {
  TiedListDetail(
      {Key key,
      @required this.ifsign,
      @required this.businessname,
      @required this.businessCode,
      @required this.status,
      this.code,
      this.detailInfo})
      : super(key: key);
  final ifsign;
  final businessname;
  final String businessCode;
  final status;
  final code;
  final ResultBusinessList detailInfo;
  _TiedListDetailState createState() => _TiedListDetailState();
}

class _TiedListDetailState extends State<TiedListDetail> {
  double doub85 = 85.0;
  double doub52p4736 = 52.4736;
  var businessDetail;
  var detailtitle;
  bool _ifbutt = true;
  BusinessButtons _bButtons;

  @override
  void initState() {
    _bButtons = BusinessButtons.fromget(widget.businessCode);
    _bButtons.butt.removeAt(0);
    ifsign = widget.ifsign;
    if (widget.status) {
      if (widget.businessCode != "1004") {
        GetPageData.getdata(currentUser.fCard, widget.code, widget.businessCode,
            (data) {
          var businessListD = BusinessDetailD.fromJson(data.toString(), null);
          setState(() {
            businessDetail = businessListD.result;
          });
        });
      } else {
        GetPageData.getPhoneIPdata(currentUser.fTelephone, (data1) {
          PhoneIP phoneIP = PhoneIP.fromJson(data1);
          GetPageData.getdata(
              currentUser.fCard, widget.code, widget.businessCode, (data) {
            var businessListD =
                BusinessDetailD.fromJson(data.toString(), phoneIP);
            setState(() {
              businessDetail = businessListD.result;
            });
          });
        });
      }
    } else {
      setState(() {
        businessDetail = widget.detailInfo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setContext(context);
    // 列表的按钮
    List<Widget> _getbutton(movies) {
      List<Widget> bus = List<Widget>();
      List<Widget> bus1 = List<Widget>();
      for (var i = 0; i < _bButtons.butt.length; i++) {
        if (i < 4)
          bus.add(Padding(
            padding:
                EdgeInsets.fromLTRB(AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
            child: Container(
              width: doub85,
              child: RaisedButton(
                padding: EdgeInsets.all(AppSize.ubp_1),
                shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                color: _bButtons.butt[i].isonclick
                    ? AppColors.themeColor
                    : AppColors.color_Tide_hui,
                child: Text(
                  _bButtons.butt[i].name,
                  style: TextStyle(
                      color: _bButtons.butt[i].isonclick
                          ? AppColors.twhite
                          : AppColors.text_Tide_hui,
                      fontSize: AppSize.ufp6875),
                ),
                onPressed: () {
                  setState(() {
                    _bButtons.butt[i].fun(context, movies, widget.status);
                  });
                },
              ),
            ),
          ));
        else
          bus1.add(Padding(
            padding:
                EdgeInsets.fromLTRB(AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
            child: Container(
              width: doub85,
              child: RaisedButton(
                padding: EdgeInsets.all(AppSize.ubp_1),
                shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                color: _bButtons.butt[i].isonclick
                    ? AppColors.themeColor
                    : AppColors.color_Tide_hui,
                child: Text(_bButtons.butt[i].name,
                    style: TextStyle(
                      color: _bButtons.butt[i].isonclick
                          ? AppColors.twhite
                          : AppColors.text_Tide_hui,
                      fontSize: AppSize.ufp6875,
                    )),
                onPressed: () {
                  setState(() {
                    _bButtons.butt[i].fun(context, movies, widget.status);
                  });
                },
              ),
            ),
          ));
      }
      return [
        Container(
            width: double.infinity,
            child: Row(
              children: bus,
            )),
        Container(
            width: double.infinity,
            child: Row(
              children: bus1,
            )),
      ];
    }

    Widget _createListView() {
      var _icon = _ifbutt
          ? Icon(Icons.expand_less, color: AppColors.test95a)
          : Icon(Icons.expand_more, color: AppColors.test95a);
      return Container(
        margin: EdgeInsets.fromLTRB(0.0, AppSize.ufp7, 0.0, AppSize.ufp6),
        decoration: new BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey[300]),
            color: AppColors.twhite),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          initiallyExpanded: true,
          onExpansionChanged: (bol) {
            setState(() {
              if (bol)
                _ifbutt = true;
              else
                _ifbutt = false;
            });
          },
          leading: Padding(
            padding:
                EdgeInsets.fromLTRB(0.0, AppSize.ufp75, 0.0, AppSize.ufp375),
            child: Image.asset(
              'assets/tideimage/Tide_${widget.businessCode}.png',
              height: doub52p4736,
              width: doub52p4736,
            ),
          ),
          title: Padding(
            padding:
                EdgeInsets.fromLTRB(0.0, AppSize.ufp75, 0.0, AppSize.ufp375),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.businessname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSize.ufp875,
                        fontWeight: FontWeight.w500)),
                Text(
                    (widget.status && businessDetail != null)
                        ? businessDetail.code
                        : '',
                    style: TextStyle(
                        color: Colors.black, fontSize: AppSize.ufp75)),
              ],
            ),
          ),
          trailing: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppSize.ufp8125, AppSize.ufp75, AppSize.ufp8125, 0.0),
                  child: Text(widget.status ? '已绑定' : '未绑定',
                      style: TextStyle(
                          fontSize: AppSize.ufp625,
                          color: widget.status
                              ? AppColors.text_Tide_87c87f
                              : AppColors.test95a))),
              _icon,
            ],
          ),
          children: _getbutton(businessDetail),
        ),
      );
    }

    Widget listTitle() {
      List<Widget> aacd = List<Widget>()..add(Divider(height: AppSize.ubp_1));
      if (widget.status && businessDetail != null) {
        if (widget.businessCode == "1001" ||
            widget.businessCode == "1002" ||
            widget.businessCode == "1003" ||
            widget.businessCode == "1004" ||
            widget.businessCode == "1005" ||
            widget.businessCode == "1021") {
          switch (widget.businessCode) {
            case "1001":
              detailtitle = Detailtitle1001.fromJson(businessDetail);
              break;
            case "1002":
              detailtitle = Detailtitle1002.fromJson(businessDetail);
              break;
            case "1003":
              detailtitle = Detailtitle1003.fromJson(businessDetail);
              break;
            case "1004":
              detailtitle = Detailtitle1004.fromJson(businessDetail);
              break;
            case "1005":
              detailtitle = Detailtitle1005.fromJson(businessDetail);
              break;
            case "1021":
              detailtitle = Detailtitle1021.fromJson(businessDetail);
              break;
          }
          final _namelist = detailtitle.tonamelist();
          final _tocodelist = detailtitle.tocodelist();
          for (var i = 0; i < _tocodelist.length; i++) {
            aacd
              ..add(Container(
                  color: AppColors.twhite,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.ufp875, 0.0, AppSize.ufp875, 0.0),
                      child: ListTile(
                        leading: null,
                        title: Text(_namelist[i]),
                        trailing: Text(
                            (_tocodelist[i] != null && _tocodelist[i] != "")
                                ? _tocodelist[i]
                                : "无"),
                      ))));
          }
        } else {
          aacd
            ..add(Container(
                color: AppColors.twhite,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        AppSize.ufp875, 0.0, AppSize.ufp875, 0.0),
                    child: ListTile(
                      leading: null,
                      title: Text("${widget.businessname}号"),
                      trailing: Text((businessDetail.code != null &&
                              businessDetail.code != "")
                          ? businessDetail.code
                          : "无"),
                    ))));
        }
      } else {
        aacd
          ..add(Container(
              color: AppColors.twhite,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppSize.ufp875, 0.0, AppSize.ufp875, 0.0),
                  child: ListTile(
                    title: Text(widget.businessname + "号"),
                    trailing: Text("********"),
                  ))));
      }

      return Column(
        children: aacd..add(Divider(height: AppSize.ubp_1)),
      );
    }

    return Scaffold(
      appBar: getheader("${widget.businessname}详情"),
      body: ListView(
        children: <Widget>[
          _createListView(),
          listTitle(),
          GetH5(businessCode: widget.businessCode, ifsgin: widget.ifsign),
        ],
      ),
    );
  }
}

class GetPageData {
  static getdata(cardCode, accountNo, typeCode, Function callback) async {
    var res = await httpManager.netFetch(
        hostAddres.getBusinessDetail(),
        {
          "cardCode": cardCode, // currentUser.FCard,
          "accountNo": accountNo, // widget.Code,
          "typeCode": typeCode // parseInt(widget.businessCode)
        },
        null,
        null);
    callback(res.data);
  }

  static getPhoneIPdata(numb, Function callback) async {
    var res = await httpManager.netFetch(
        hostAddres.getBusinessPhoneIP(), {"num": numb}, null, null);
    callback(res.data);
  }
}

class Detailtitle1001 {
  var code;
  var fullName;
  var iDCard;
  var telephone;
  var email;
  Detailtitle1001(
      {this.code, this.fullName, this.iDCard, this.telephone, this.email});
  Detailtitle1001.fromJson(BusinessDetail jsonk) {
    code = jsonk.code;
    fullName = jsonk.fullName;
    iDCard = jsonk.iDCard;
    telephone = jsonk.telephone;
    email = jsonk.email;
  }
  List tonamelist() {
    List _list = List();
    _list..add("居民卡号")..add("姓名")..add("身份证号")..add("绑卡手机号")..add("邮箱");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(code)..add(fullName)..add(iDCard)..add(telephone)..add(email);
    return _list;
  }
}

class Detailtitle1002 {
  var code;
  var fullName;
  Detailtitle1002({this.code, this.fullName});
  Detailtitle1002.fromJson(BusinessDetail jsonk) {
    code = jsonk.code;
    fullName = jsonk.fullName;
  }
  List tonamelist() {
    List _list = List();
    _list..add("身份证号")..add("姓名");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(code)..add(fullName);
    return _list;
  }
}

class Detailtitle1003 {
  var code;
  var bankName;
  var bankPersonName;
  Detailtitle1003({this.code, this.bankName, this.bankPersonName});
  Detailtitle1003.fromJson(BusinessDetail jsonk) {
    code = jsonk.code;
    bankName = jsonk.bankName;
    bankPersonName = jsonk.bankPersonName;
  }
  List tonamelist() {
    List _list = List();
    _list..add("银行卡号")..add("银行")..add("姓名");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(code)..add(bankName)..add(bankPersonName);
    return _list;
  }
}

class Detailtitle1004 {
  var code;
  var operator_;
  var iP;
  Detailtitle1004({this.code, this.operator_, this.iP});
  Detailtitle1004.fromJson(BusinessDetail jsonk) {
    code = jsonk.code;
    operator_ = jsonk.operator_;
    iP = jsonk.iP;
  }
  List tonamelist() {
    List _list = List();
    _list..add("手机号码")..add("运营商")..add("IP");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(code)..add(operator_)..add(iP);
    return _list;
  }
}

class Detailtitle1005 {
  var code;
  var balance;
  var balanceTime;
  Detailtitle1005({this.code, this.balance, this.balanceTime});
  Detailtitle1005.fromJson(BusinessDetail jsonk) {
    code = jsonk.code;
    balance = jsonk.balance;
    balanceTime = jsonk.balanceTime;
  }
  List tonamelist() {
    List _list = List();
    _list..add("城市钱包账号")..add("账户余额")..add("余额更新时间");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(code)..add(balance)..add(balanceTime);
    return _list;
  }
}

class Detailtitle1021 {
  var cardNo;
  var account;
  var effectiveDate;
  var expireDate;
  Detailtitle1021(
      {this.cardNo, this.account, this.effectiveDate, this.expireDate});
  Detailtitle1021.fromJson(jsonk) {
    cardNo = jsonk.cardNo;
    account = jsonk.account;
    effectiveDate = jsonk.effectiveDate;
    expireDate = jsonk.expireDate;
  }
  List tonamelist() {
    List _list = List();
    _list..add("居民卡号")..add("姓名")..add("身份证号")..add("绑卡手机号")..add("邮箱");
    return _list;
  }

  List tocodelist() {
    List _list = List();
    _list..add(cardNo)..add(account)..add(effectiveDate)..add(expireDate);
    return _list;
  }
}
