import 'package:flutter/material.dart';
import 'dart:convert';
import '../../styles/fontSize.dart';
import '../../utiles/net/api.dart';
import '../../utiles/getHost.dart';
import '../../model/cardBag/card_details_entity.dart';

//订单记录
class CardDetailsList extends StatefulWidget {
  @override
  _CardDetailsListState createState() => _CardDetailsListState();
}

class _CardDetailsListState extends State<CardDetailsList> {
  var _CardDetailsData;

  @override
  void initState() {
    _CardDetailsData = getPageData.getdata();
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
        Map cardDetailsDataMap = json.decode(snapshot.data.toString());
        var cardDetailsData =  new CardDetailsD.fromJson(cardDetailsDataMap['d']);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    cardDetailsData.result.imgUrl,
                    width: 60.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cardDetailsData.result.ticketName),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                            child: Text("截止日期：${cardDetailsData.result.endDate}"),
                          ),
                          Text("面值: ￥${cardDetailsData.result.marketPrice}"),
                        ],
                      ),
                    ),
                  ),
                  Text("可用"),
                ],
              ),
            ),

            //分割线'
            Divider(
              height: AppSize.ubp_1,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 0, 5.0),
              child: RaisedButton(
                  onPressed: () {
//                  Navigator.of(context)
//                      .push(MaterialPageRoute(builder: (BuildContext context) {
//                    return CardDetailsList();
//                  }));
                  },
                  child: Text("使用"),
                  textColor: Colors.white,
                  color: Colors.orange,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
            ),

            Divider(
              height: AppSize.ubp_1,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("购买须知"),
                  Divider(
                    height: 10.0,
                  ),
                  Text(cardDetailsData.result.instructions),
                ],
              ),
            ),

            Divider(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("使用商家"),
                  Divider(
                    height: AppSize.ubp_1,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: cardDetailsData.result.merchants.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cardDetailsData.result.merchants[index].merName),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add_location,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                              Text(
                                cardDetailsData.result.merchants[index].address,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            Text(
                              cardDetailsData.result.merchants[index].telephone,
                              style: TextStyle(fontSize: 14.0),
                            )
                          ],
                        ),
                        Divider(
                          height: 10.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单记录"),
      ),
      body: FutureBuilder(
        builder: _buildFuture,
        future: _CardDetailsData,
      ),
    );
  }
}

//页面获取数据
class getPageData {
  static getdata() async {
    var params = {
      "cardCode": "2014351000471158",
      "contractPhone": "18210530620",
      "ticketCode": "MF20181106000001",
      "ticketType": 1
    };
    var res = await httpManager.netFetch(
        hostAddres.getTicketDetailInfoApi(), params, null, null);
    return res.data;
  }
}
