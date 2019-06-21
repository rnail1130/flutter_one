import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:phone_yiyang/model/cardBag/orderinfo_entity.dart';
import "package:phone_yiyang/pages/public.dart";

import 'package:phone_yiyang/model/cardBag/order_history_entity.dart';

ResultCurrentUser currentUser;

//订单记录
class OrderHistoryList extends StatefulWidget {
  @override
  _OrderHistoryListState createState() => _OrderHistoryListState();
}

class _OrderHistoryListState extends State<OrderHistoryList>
    with SingleTickerProviderStateMixin {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      GlobalKey<EasyRefreshState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshHeaderState> _headerKey =
      GlobalKey<RefreshHeaderState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshFooterState> _footerKey =
      GlobalKey<RefreshFooterState>(debugLabel: "getTransactionRecordsApi");
  TabController _tabController;
  final List<Tab> orderTabList = <Tab>[
    Tab(text: "我的订单"),
    Tab(text: "历史记录"),
  ];

  ///我的订单实体
  List<OrderInfoResult> orderInfoResults;
  int pagenumInfo;
  var indexOrderInfo;

  ///历史记录实体
  List<OrderHistoryDResult> orderHistoryData;
  int pagenumHistory;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: orderTabList.length);
    LocalStorage.getjson("currentUser", (data) {
      if (data != null) {
        currentUser = ResultCurrentUser.fromJson(data);
      }
    });
    indexOrderInfo = GetPageData.getIndexDataInfo();
    // pagenumInfo = 1;
    // pagenumHistory = 1;
    // GetPageData.getdataInfo(pagenumHistory, (data) {
    //   var _getInforesult = OrderInfoD.fromJson(json.decode(data)['d']);
    //   GetPageData.getdataHistory(pagenumHistory, (data) {
    //     var _getHistoryresult = OrderHistoryD.fromJson(json.decode(data)['d']);
    //     setState(() {
    //       orderInfoResults = _getInforesult.result;
    //       orderHistoryData = _getHistoryresult.result;
    //     });
    //   });
    // });

    pagenumHistory = 1;

    GetPageData.getdataHistory(pagenumHistory, (data) {
      var _getHistoryresult = OrderHistoryD.fromJson(json.decode(data)['d']);
      setState(() {
        orderHistoryData = _getHistoryresult.result;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> tabOneWidget() {
    List<Widget> con = [];
    for (var i = 0; i < orderInfoResults.length; i++) {
      con.add(
        InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                height: AppSize.up2p5,
                child: Center(
                  child: Text(orderInfoResults[i].orderMakerDate),
                ),
              ),
              Container(
                height: AppSize.up2,
                child: Center(
                  child: Text("￥99"),
                ),
              ),
              Container(
                height: AppSize.up2,
                child: Center(
                  child: Text(
                    "已取消",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "订单编号：11111111111111111111",
                  style:
                      TextStyle(color: Colors.black, fontSize: AppSize.ufp875),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "商品说明：123",
                  style:
                      TextStyle(color: Colors.black, fontSize: AppSize.ufp875),
                ),
              ),
              Divider(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "付款方式：微信",
                  style:
                      TextStyle(color: Colors.black, fontSize: AppSize.ufp875),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "下单时间：2011-11-11",
                  style:
                      TextStyle(color: Colors.black, fontSize: AppSize.ufp875),
                ),
              ),
              Divider(
                height: 1.0,
              ),
            ],
          ),
        ),
      );
    }
    return con;
  }

  Widget _createListView(BuildContext context) {
    return ListView(
      children: tabOneWidget(),
    );
  }

  _tabBarbady(tab, _orderInfoResults) {
    orderInfoResults = _orderInfoResults;
    print(orderInfoResults.length);
    if (tab.text == "我的订单") {
      if (orderInfoResults.length == null) {
        print("111111111");
        return _noData();
      } else {
        print("2222222222");
        print(orderInfoResults.length);
        return easyRefresh(
            _easyRefreshKey, _headerKey, _footerKey, _createListView(context),
            () async {
          pagenumInfo = 1;
          GetPageData.getdataInfo(pagenumInfo, (data) {
            var _getInforesult = OrderInfoD.fromJson(json.decode(data)['d']);
            setState(() {
              orderInfoResults.clear();
              orderInfoResults.addAll(_getInforesult.result);
            });
          });
        }, () async {
          pagenumInfo++;
          GetPageData.getdataInfo(pagenumInfo, (data) {
            var _getInforesult = OrderInfoD.fromJson(json.decode(data)['d']);
            setState(() {
              orderInfoResults.addAll(_getInforesult.result);
            });
          });
        }, false);
      }
    } else if (tab.text == "历史记录") {
      if (orderHistoryData.length == 0) {
        print("333333333");
        return _noData();
      } else {
        print("444444444");
        return Center(
          child: ListView.builder(
            itemCount: orderHistoryData.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Image.network(
                      orderHistoryData[index].productImg,
                      width: 60.0,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(orderHistoryData[index].ticketName),
                        Text(
                          orderHistoryData[index].verifyDate,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "面值: ￥${orderHistoryData[index].marketPrice}",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          orderHistoryData[index].status,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  //分割线'
                  Divider(
                    height: AppSize.ubp_1,
                  ),
                ],
              );
            },
          ),
        );
      }
    }
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        Map cardDetailsDataMap = json.decode(snapshot.data.toString());
        var _getInforesult = new OrderInfoD.fromJson(cardDetailsDataMap['d']);
        // var _getInforesult = OrderInfoD.fromJson(json.decode(snapshot.data.toString())['d']);

        orderInfoResults = _getInforesult.result;

        return TabBarView(
          controller: _tabController,
          children: orderTabList.map((Tab tab) {
            return Scaffold(
              body: _tabBarbady(tab, orderInfoResults),
            );
          }).toList(),
        );

      default:
        return null;
    }
  }

  Widget _noData() {
    return Container(
      padding: EdgeInsets.all(AppSize.up1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "暂无相关数据~",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "订单记录",
          style: TextStyle(fontSize: AppSize.uf1),
        ),
        bottom: TabBar(
          tabs: orderTabList,
          controller: _tabController,
          labelColor: Colors.white,
        ),
      ),
      body: FutureBuilder(
        builder: _buildFuture,
        future: indexOrderInfo, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
      ),
    );
  }
}

//页面获取数据
class GetPageData {
  static getdataHistory(int pagenumHistory, Function callback) async {
    var cardCode = '';
    var contractPhone = '';
    if (currentUser != null) {
      cardCode = currentUser.fCard.toString();
      contractPhone = currentUser.fTelephone.toString();
    }
    var params = {
      "CardCode": cardCode,
      "ContractPhone": contractPhone,
      "PageIndex": pagenumHistory
    };
    var res = await httpManager.netFetch(
        hostAddres.getMyTicketsApi(), params, null, null);
    callback(res.data);
  }

  static getIndexDataInfo() async {
    var cardCode = '';
    var contractPhone = '';
    if (currentUser != null) {
      cardCode = currentUser.fCard.toString();
      contractPhone = currentUser.fTelephone.toString();
    }
    var res = await httpManager.netFetch(
        hostAddres.getMyOrderInfoApi(),
        {'CardCode': cardCode, 'ContractPhone': contractPhone, 'PageIndex': 1},
        null,
        null);
    return res.data;
  }

  static getdataInfo(int pagenumInfo, Function callback) async {
    var cardCode = '';
    var contractPhone = '';
    if (currentUser != null) {
      cardCode = currentUser.fCard.toString();
      contractPhone = currentUser.fTelephone.toString();
    }
    var res = await httpManager.netFetch(
        hostAddres.getMyOrderInfoApi(),
        {
          'CardCode': cardCode,
          'ContractPhone': contractPhone,
          'PageIndex': pagenumInfo
        },
        null,
        null);
    callback(res.data);
  }
}
