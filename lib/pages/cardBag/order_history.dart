import 'dart:convert';
import 'package:flutter/material.dart';
import "package:phone_yiyang/pages/public.dart";

import 'package:phone_yiyang/model/cardBag/order_history_entity.dart';

//订单记录
class OrderHistoryList extends StatefulWidget {
  @override
  _OrderHistoryListState createState() => _OrderHistoryListState();
}

class _OrderHistoryListState extends State<OrderHistoryList>
    with SingleTickerProviderStateMixin {
  var _OrderHistoryData;
  final List<Tab> _orderOrHistory = <Tab>[
    Tab(text: "我的订单"),
    Tab(text: "历史记录"),
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _orderOrHistory.length);
    _OrderHistoryData = getPageData.getdata();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

        Map orderHistoryDataMap = json.decode(snapshot.data.toString());
        var orderHistoryData =
            new OrderHistoryD.fromJson(orderHistoryDataMap['d']);
        return TabBarView(
            controller: _tabController,
            children: _orderOrHistory.map((Tab tab) {
              if (tab.text == "我的订单") {
                print(111);
                return Center(
                  child: Text(tab.text),
                );
              } else {
                print(222);
                print(orderHistoryData.result.toString());
                if (orderHistoryData.result.length == 0) {
                  return _noData();
                } else {
                  return Center(
                    child: ListView.builder(
                      itemCount: orderHistoryData.result.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              leading: Image.network(
                                orderHistoryData.result[index].productImg,
                                width: 60.0,
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(orderHistoryData
                                      .result[index].ticketName),
                                  Text(
                                    orderHistoryData.result[index].verifyDate,
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "面值: ￥${orderHistoryData.result[index].marketPrice}",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    orderHistoryData.result[index].status,
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
            }).toList());
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
        title: Text("订单记录"),
        bottom: TabBar(
          tabs: _orderOrHistory,
          controller: _tabController,
          labelColor: Colors.white,
        ),
      ),
      body: FutureBuilder(
        builder: _buildFuture,
        future: _OrderHistoryData,
      ),
    );
  }
}

//页面获取数据
class getPageData {
  static getdata() async {
    var params = {
      "CardCode": "2014351000471158",
      "ContractPhone": "18210530620",
      "PageIndex": 1
    };
    var res = await httpManager.netFetch(
        hostAddres.getMyTicketsApi(), params, null, null);
    return res.data;
  }
}
