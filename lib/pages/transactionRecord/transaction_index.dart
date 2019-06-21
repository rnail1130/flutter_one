import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import "package:phone_yiyang/pages/public.dart";
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class TransactionIndex extends StatefulWidget {
  String cardCode = "";
  String merCode = "";
  int type;
  TransactionIndex({this.cardCode, this.merCode, this.type});
  @override
  _TransactionIndexState createState() => _TransactionIndexState();
}

class _TransactionIndexState extends State<TransactionIndex> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      GlobalKey<EasyRefreshState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshHeaderState> _headerKey =
      GlobalKey<RefreshHeaderState>(debugLabel: "getTransactionRecordsApi");
  GlobalKey<RefreshFooterState> _footerKey =
      GlobalKey<RefreshFooterState>(debugLabel: "getTransactionRecordsApi");
  int pagenum;
  var thisData;

  @override
  void initState() {
    super.initState();
  }

  Widget _createListView(BuildContext context) {
    // if (thisData == null) {
    //   return showDiog();
    // }
    return ListView(
      children: <Widget>[
        Center(
          child: Text("aaa"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "交易查询",
          style: TextStyle(fontSize: AppSize.uf1),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.date_range,
                color: Theme.of(context).backgroundColor,
              ),
              onPressed: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate:
                            (new DateTime.now()).add(new Duration(days: -7)),
                        initialLastDate: new DateTime.now(),
                        firstDate: new DateTime(2015),
                        lastDate: new DateTime.now());
                if (picked != null && picked.length == 2) {
                  print(picked);
                }
              })
        ],
      ),
      body: easyRefresh(
          _easyRefreshKey, _headerKey, _footerKey, _createListView(context),
          () async {
        pagenum = 1;
        var params = {
          "cardCode": widget.cardCode,
          "endDate": "18210530620",
          "merCode": widget.merCode,
          "pageIndex": pagenum,
          "startDate": "MF20181106000001",
          "type": widget.type
        };
        GetTransactionData.getTransactionRecords(params, (data) {
          // var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);
          setState(() {
            // _cardBagIndexDatas.clear();
            // _cardBagIndexDatas.addAll(_getCardBag.result);
          });
        });
      }, () async {
        pagenum++;
        var params = {
          "cardCode": widget.cardCode,
          "endDate": "18210530620",
          "merCode": widget.merCode,
          "pageIndex": pagenum,
          "startDate": "MF20181106000001",
          "type": widget.type
        };
        GetTransactionData.getTransactionRecords(params, (data) {
          // var _getCardBag = CardBagIndexAllD.fromJson(json.decode(data)['d']);
          setState(() {
            // _cardBagIndexDatas.addAll(_getCardBag.result);
          });
        });
      }, true),
    );
  }
}

class GetTransactionData {
  static getTransactionRecords(params, Function callback) async {
    print(1111111111111111);
    if (params.type == 4) {
      var res = await httpManager.netFetch(
          hostAddres.getTransactionRecordsApi(), params, null, null);
      callback(res.data);
    } else {
      callback();
    }
  }
}
