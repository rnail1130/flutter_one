import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_YDdetail.dart';
import 'package:phone_yiyang/pages/login/loginPage.dart';
import 'dart:convert';
import "package:phone_yiyang/pages/public.dart";
import 'package:phone_yiyang/pages/transactionRecord/transaction_index.dart';
import 'package:phone_yiyang/styles/fontSize.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/refresh.dart';

import 'package:phone_yiyang/model/currentUser.dart';
import 'package:phone_yiyang/model/cardBag/cardbagindex_all_entity.dart';

import 'package:phone_yiyang/model/cardBag/cardbagindex_moble_entity.dart';

import 'package:phone_yiyang/pages/cardBag/order_history.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_detail.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_index_sms.dart';

/**
 * 卡类型：
 * -1：代金券
 * 1：
 * 2：
 * 3：旅游卡
 */

ResultCurrentUser currentUser;

/// 票券卡包列表
class CardBagIndex extends StatefulWidget {
  @override
  _CardBagIndexState createState() => _CardBagIndexState();
}

class _CardBagIndexState extends State<CardBagIndex> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      GlobalKey<EasyRefreshState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshHeaderState> _headerKey =
      GlobalKey<RefreshHeaderState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshFooterState> _footerKey =
      GlobalKey<RefreshFooterState>(debugLabel: "getTransactionRecordsApi");
  List<CardBagIndexAllDResult> _cardBagIndexDatas;
  CardBagIndexMobleResult _cardMobleDatas;
  List<bool> _listbutt = List<bool>();
  List _list;
  bool _oneShow = false;
  int pagenum;
  var currentPanelIndex = -1; //设置-1默认全部闭合

  @override
  void initState() {
    LocalStorage.getjson("currentUser", (data) {
      if (data != null) {
        currentUser = ResultCurrentUser.fromJson(data);
      }
    });
    pagenum = 1;
    GetPageData.getdata(pagenum, (data) {
      var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);
      GetPageData.getMobleCouponInfoData(pagenum, (data) {
        CardBagIndexMobleD _getMoble =
            CardBagIndexMobleD.fromJson(json.decode(data)['d']);
        setState(() {
          _cardBagIndexDatas = _getCardBag.result;
          _cardMobleDatas = _getMoble.result;
        });
      });
    });

    super.initState();
  }

  ///格式化票券列表
  Widget _createListView(BuildContext context) {
    if (_cardBagIndexDatas == null || _cardMobleDatas == null) {
      return showDiog();
    }
    return ListView(
      children: <Widget>[_mobleCouponInfo(context), _allTickets(context)],
    );
  }

  ///居民卡移动消费券
  Widget _mobleCouponInfo(context) {
    if (currentUser == null) {
      return Container(
        decoration: new BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey[300]),
            color: AppColors.twhite),
        margin: EdgeInsets.only(top: AppSize.ufp7),
        child: ListTile(
          leading: Padding(
            padding:
                EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
            child: Image.asset(
              'assets/images/tourismCard_0.png',
              height: AppSize.up3,
              width: AppSize.up3,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("居民卡移动消费券",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.ufp875,
                      fontWeight: FontWeight.w500)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Text("您还未登录，无法使用此业务。",
                    style: TextStyle(
                        color: Colors.black, fontSize: AppSize.ufp75)),
              ),
            ],
          ),
        ),
      );
    } else {
      var _icon = _oneShow
          ? Icon(Icons.expand_less, color: AppColors.test95a)
          : Icon(Icons.expand_more, color: AppColors.test95a);
      return Container(
        decoration: new BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey[300]),
            color: AppColors.twhite),
        margin: EdgeInsets.only(top: AppSize.ufp7),
        child: ExpansionTile(
          onExpansionChanged: (bol) {
            setState(() {
              if (bol)
                _oneShow = true;
              else
                _oneShow = false;
            });
          },
          backgroundColor: Colors.white,
          leading: Padding(
            padding:
                EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
            child: Image.asset(
              'assets/images/tourismCard_0.png',
              height: AppSize.up3,
              width: AppSize.up3,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("居民卡移动消费券",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.ufp875,
                      fontWeight: FontWeight.w500)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Text("移动消费券有效期为${_cardMobleDatas.validDays}个自然日",
                    style: TextStyle(
                        color: Colors.black, fontSize: AppSize.ufp75)),
              ),
              Text("移动消费券余额：${_cardMobleDatas.balance}点",
                  style:
                      TextStyle(color: Colors.black, fontSize: AppSize.ufp75)),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(AppSize.ufp8125, AppSize.ufp375,
                    AppSize.ufp8125, AppSize.uf1),
                child: Text(
                  '',
                ),
              ),
              Expanded(
                child: _icon,
              ),
            ],
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return CardYDDetailsList(
                              balance: _cardMobleDatas.balance,
                              validDays: _cardMobleDatas.validDays,
                              fTelephone: currentUser.fTelephone.toString(),
                              fCard: currentUser.fCard.toString());
                        }),
                      );
                    },
                    child: Text(
                      "详情",
                      style: TextStyle(
                          color: AppColors.twhite, fontSize: AppSize.ufp6875),
                    ),
                    textColor: Colors.white,
                    color: AppColors.themeColor,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return TransactionIndex(
                            cardCode: currentUser.fCard.toString(),
                            type: 4,
                          );
                        }),
                      );
                    },
                    child: Text(
                      "消费记录",
                      style: TextStyle(
                          color: AppColors.twhite, fontSize: AppSize.ufp6875),
                    ),
                    textColor: Colors.white,
                    color: AppColors.themeColor,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                  child: RaisedButton(
                    onPressed: () {
                      showDialog<Null>(
                        context: context,
                        builder: (BuildContext context) {
                          print(context);
                          return SmsContent();
                        },
                      ).then((val) {
                        print(val);
                      });
                    },
                    child: Text(
                      "一键兑换",
                      style: TextStyle(
                          color: AppColors.twhite, fontSize: AppSize.ufp6875),
                    ),
                    textColor: Colors.white,
                    color: AppColors.themeColor,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  ///其他票券列表
  Widget _allTickets(context) {
    List _thisList = List();
    for (var i = 0; i < _cardBagIndexDatas.length; i++) {
      _thisList.add(i);
    }
    return Column(
      children: _thisList.map((index) {
        CardBagIndexAllDResult _cardBagIndexData = _cardBagIndexDatas[index];
        if (_listbutt.length <= index) {
          _listbutt.add(false);
        }
        var _icon = _listbutt[index]
            ? Icon(Icons.expand_less, color: AppColors.test95a)
            : Icon(Icons.expand_more, color: AppColors.test95a);
        return Container(
          decoration: new BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey[300]),
              color: AppColors.twhite),
          margin: EdgeInsets.only(top: AppSize.ufp7),
          child: ExpansionTile(
            onExpansionChanged: (bol) {
              setState(() {
                if (bol)
                  _listbutt[index] = true;
                else
                  _listbutt[index] = false;
              });
            },
            backgroundColor: Colors.white,
            leading: Padding(
              padding:
                  EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
              child: Image.network(
                _cardBagIndexData.imgUrl,
                height: AppSize.up3,
                width: AppSize.up3,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_cardBagIndexData.ticketName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.ufp875,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: _subTicketType(_cardBagIndexData),
                ),
                _priceTicketType(_cardBagIndexData),
              ],
            ),
            trailing: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(AppSize.ufp8125, AppSize.ufp375,
                      AppSize.ufp8125, AppSize.uf1),
                  child: Text(
                    _cardBagIndexData.ticketType == 1 ? '可领取' : '可购买',
                    style: TextStyle(
                        fontSize: AppSize.ufp75,
                        color: _cardBagIndexData.status > 0
                            ? AppColors.text_Tide_87c87f
                            : AppColors.test95a),
                  ),
                ),
                Expanded(
                  child: _icon,
                ),
              ],
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CardDetailsList(
                              currentUser.fCard.toString(),
                              currentUser.fTelephone.toString(),
                              _cardBagIndexData.ticketCode,
                              _cardBagIndexData.ticketType);
                        }));
                      },
                      child: Text(
                        "详情",
                        style: TextStyle(
                            color: AppColors.twhite, fontSize: AppSize.ufp6875),
                      ),
                      textColor: Colors.white,
                      color: AppColors.themeColor,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: _cardBagIndexData.ticketType == 3, //这里控制
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                      child: RaisedButton(
                        onPressed: () {
                          if (currentUser == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "购买",
                          style: TextStyle(
                              color: AppColors.twhite,
                              fontSize: AppSize.ufp6875),
                        ),
                        textColor: Colors.white,
                        color: AppColors.themeColor,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: _cardBagIndexData.ticketType != 3, //这里控制
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                      child: RaisedButton(
                        onPressed: () {
                          if (currentUser == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "购买旅游卡",
                          style: TextStyle(
                              color: AppColors.twhite,
                              fontSize: AppSize.ufp6875),
                        ),
                        textColor: Colors.white,
                        color: AppColors.themeColor,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  ///副标题
  _subTicketType(that) {
    if (that.ticketType == 1) {
      return Text("111",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    } else if (that.ticketType == 2) {
      return Text("有效截止日期：${that.endDate}",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    } else if (that.ticketType == 3) {
      return Text("旅游卡",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    } else if (that.ticketType == -1) {
      return Text("代金券",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    }
  }

  ///售价面值
  Widget _priceTicketType(that) {
    if (that.ticketType == 1) {
      return Text("移动消费券余额：-130点",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    } else if (that.ticketType == 2) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text("售价：",
            style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75)),
        Text("￥${that.salePrice}",
            style: TextStyle(color: Colors.red, fontSize: AppSize.ufp75)),
        SizedBox(
          width: AppSize.up1,
        ),
        Text(" 面值：￥${that.marketPrice}",
            style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75)),
      ]);
    } else if (that.ticketType == 3) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text("售价：",
            style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75)),
        Text("￥${that.salePrice}",
            style: TextStyle(color: Colors.red, fontSize: AppSize.ufp75))
      ]);
    } else {
      return Text("移动消费券余额：-30点",
          style: TextStyle(color: Colors.black, fontSize: AppSize.ufp75));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "票券卡包",
            style: TextStyle(fontSize: AppSize.uf1),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return OrderHistoryList();
                  }));
                },
                child: Text(
                  "订单/记录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppSize.ufp8125,
                  ),
                )),
          ],
        ),
        body: easyRefresh(_easyRefreshKey, _headerKey, _footerKey,_createListView(context), () async {
          pagenum = 1;
          GetPageData.getdata(pagenum, (data) {
            var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);
            setState(() {
              _cardBagIndexDatas.clear();
              _cardBagIndexDatas.addAll(_getCardBag.result);
            });
          });
        }, () async {
          pagenum++;
          GetPageData.getdata(pagenum, (data) {
            var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);
            setState(() {
              _cardBagIndexDatas.addAll(_getCardBag.result);
            });
          });
        }, false));
  }
}

class GetPageData {
  static getdata(int _pagenum, Function callback) async {
    var _CardCode = '';
    var _ContractPhone = '';
    if (currentUser != null) {
      _CardCode = currentUser.fCard.toString();
      _ContractPhone = currentUser.fTelephone.toString();
    }
    var res = await httpManager.netFetch(
        hostAddres.getAllTicketsApi(),
        {
          'CardCode': _CardCode,
          'ContractPhone': _ContractPhone,
          'PageIndex': _pagenum
        },
        null,
        null);
    callback(res.data);
  }

  static getMobleCouponInfoData(int _pagenum, Function callback) async {
    var _CardCode = '';
    var _ContractPhone = '';
    if (currentUser != null) {
      _CardCode = currentUser.fCard.toString();
      _ContractPhone = currentUser.fTelephone.toString();
    }
    var res = await httpManager.netFetch(
        hostAddres.getMobleCouponInfoApi(),
        {
          'cardCode': _CardCode,
          'phoneNo': _ContractPhone,
        },
        null,
        null);
    callback(res.data);
  }
}
