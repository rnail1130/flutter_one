import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import '../../styles/colors.dart';
import '../../styles/fontSize.dart';
import '../../utiles/net/api.dart';
import '../../utiles/refresh.dart';
import '../../utiles/getHost.dart';
import '../../utiles/LocalStorage.dart';
import '../../model/currentUser.dart';
import '../../pages/cardBag/order_history.dart';
import '../../pages/cardBag/cardBag_detail.dart';
import '../../pages/cardBag/cardBag_index_sms.dart';
import '../../model/cardBag/card_bag_index_all_entity.dart';

ResultCurrentUser currentUser;

/// 票券卡包列表
class CardBagIndex extends StatefulWidget {
  @override
  _CardBagIndexState createState() => _CardBagIndexState();
}

class _CardBagIndexState extends State<CardBagIndex> {
  List<CardBagIndexAllDResult> _cardBagIndexDatas =
      List<CardBagIndexAllDResult>();
  List<bool> _listbutt = List<bool>();
  List _list;
  int pagenum;
  var currentPanelIndex = -1; //设置-1默认全部闭合

  @override
  void initState() {
//    _cardBagIndexDatas = _getdata();
    GetPageData.getlogin((data) {
      CurrentUserD currentUserD = CurrentUserD.fromJson(data.toString());
      currentUser = currentUserD.result;
      print(currentUser);
      LocalStorage.set("currentUser", json.encode(currentUser));
      pagenum = 1;
      GetPageData.getdata(pagenum, (data) {
        var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);

        setState(() {
          _cardBagIndexDatas.clear();
          _cardBagIndexDatas.addAll(_getCardBag.result);
        });
      });
    });
    super.initState();
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none: //还没有开始网络请求

      case ConnectionState.active: //正在链接

      case ConnectionState.waiting: //等待阶段
        return Center(
          child: Text("加载中..."),
        );
      case ConnectionState.done: //请求成功
        var cardBagIndexDataMap = json.decode(snapshot.data);
        var cardBagIndexData =
            new CardBagIndexAllD.fromJson(cardBagIndexDataMap['d']);
        _list = List();
        for (int i = 0; i < cardBagIndexData.result.length; i++) {
          _list.add(i);
        }

        return SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                currentPanelIndex =
                    (currentPanelIndex != panelIndex ? panelIndex : -1);
              });
            },
            children: _list.map((index) {
              if (index == 0) {
                return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "居民卡移动消费券",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10.0, 0, 10.0),
                                    child: Text("移动消费券有效期为90个自然日"),
                                  ),
                                  Text("移动消费券余额：-330点")
                                ],
                              ),
                              leading: Image.network(
                                cardBagIndexData.result[index].imgUrl,
                                width: 60.0,
                              )));
                    },
                    body: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return CardDetailsList();
                                }));
                              },
                              child: Text("详情"),
                              textColor: Colors.white,
                              color: AppColors.themeColor,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          SizedBox(width: 20.0),
                          RaisedButton(
                              onPressed: () {},
                              child: Text("消费记录"),
                              textColor: Colors.white,
                              color: AppColors.themeColor,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          SizedBox(width: 20.0),
                          RaisedButton(
                              onPressed: () {
                                showDialog<Null>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SmsContent();
                                  },
                                ).then((val) {
                                  print(val);
                                });
                              },
                              child: Text("一键兑换"),
                              textColor: Colors.white,
                              color: AppColors.themeColor,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ],
                      ),
                    ),
                    isExpanded: currentPanelIndex == index);
              } else {
                return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    cardBagIndexData.result[index].ticketName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Text(
                                    "可领取",
                                    style: new TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10.0, 0, 10.0),
                                    child: Text("有效截至日期: 2019-5-23"),
                                  ),
                                  Text(
                                      "面值: ￥${cardBagIndexData.result[index].marketPrice}")
                                ],
                              ),
                              leading: Image.network(
                                cardBagIndexData.result[index].imgUrl,
                                width: 60.0,
                              )));
                    },
                    body: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return CardDetailsList();
                                }));
                              },
                              child: Text("详情"),
                              textColor: Colors.white,
                              color: AppColors.themeColor,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          SizedBox(width: 20.0),
                          RaisedButton(
                              onPressed: () {},
                              child: Text("购买"),
                              textColor: Colors.white,
                              color: AppColors.themeColor,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ],
                      ),
                    ),
                    isExpanded: currentPanelIndex == index);
              }
            }).toList(),
          ),
        );
      default:
        return null;
    }
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
      itemCount:
          _cardBagIndexDatas.length > 0 ? (_cardBagIndexDatas.length * 2) : 0,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider(height: 0.0);
        }
        index = index ~/ 2;
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
                height: 60.0,
                width: 60.0,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_cardBagIndexData.ticketName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSize.ufp875,
                        fontWeight: FontWeight.w500)),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Text("移动消费券有效期为90个自然日",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: AppSize.ufp875,
                          fontWeight: FontWeight.w500)),
                ),
                Text("移动消费券余额：-330点",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSize.ufp875,
                        fontWeight: FontWeight.w500))
              ],
            ),
            trailing: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        AppSize.ufp8125, AppSize.ufp75, AppSize.ufp8125, 0.0),
                    child: Text(_cardBagIndexData.status > 0 ? '已绑定' : '未绑定',
                        style: TextStyle(
                            fontSize: AppSize.ufp625,
                            color: _cardBagIndexData.status > 0
                                ? AppColors.text_Tide_87c87f
                                : AppColors.test95a))),
                _icon,
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CardDetailsList();
                            }));
                          },
                          child: Text("详情"),
                          textColor: Colors.white,
                          color: AppColors.themeColor,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                      child: RaisedButton(
                          onPressed: () {},
                          child: Text("购买"),
                          textColor: Colors.white,
                          color: AppColors.themeColor,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))))),
                  Offstage(
                    offstage: index == 1, //这里控制
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                      child: RaisedButton(
                          onPressed: () {
                            showDialog<Null>(
                              context: context,
                              builder: (BuildContext context) {
                                return SmsContent();
                              },
                            ).then((val) {
                              print(val);
                            });
                          },
                          child: Text("一键兑换"),
                          textColor: Colors.white,
                          color: AppColors.themeColor,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("票券卡包"),
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
                    fontSize: 16.0,
                  ),
                )),
          ],
        ),
        body: easyRefresh(_createListView(context), () async {
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
  static getlogin(Function callback) async {
    var res = await httpManager.netFetch(hostAddres.getNewLogin(),
        {"mobile": "18210530620", "passWord": "abc123"}, null, null);
    callback(res.data);
  }

  static getdata(int _pagenum, Function callback) async {
    print(_pagenum);
    var _CardCode = '2014351000471158';
    var _ContractPhone = '"18210530620"';
    if (currentUser != null) {
      _CardCode = currentUser.fCard.toString();
      _ContractPhone = currentUser.fCard.toString();
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
}
