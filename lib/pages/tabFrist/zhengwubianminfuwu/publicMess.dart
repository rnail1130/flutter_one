import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:phone_yiyang/model/landscape/landscapeindex_entity.dart';
import 'package:phone_yiyang/pages/common/DeatilPage.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/refresh.dart';

class publicMessage extends StatefulWidget {
  final landscapeName;
  publicMessage(this.landscapeName);
  _LandscapeIndexState createState() => _LandscapeIndexState();
}

class _LandscapeIndexState extends State<publicMessage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
  GlobalKey<EasyRefreshState>(debugLabel: "getLandScapeListApi");
  GlobalKey<RefreshHeaderState> _headerKey =
  GlobalKey<RefreshHeaderState>(debugLabel: "getLandScapeListApi");
  GlobalKey<RefreshFooterState> _footerKey =
  GlobalKey<RefreshFooterState>(debugLabel: "getLandScapeListApi");
  List<LandscapeindexResult> _LandscapeIndexResult;
  int pagenum;

  @override
  void initState() {
    super.initState();
    pagenum = 1;
    GetPageData.getLandScapeListData(pagenum, (data) {
      var _getResult = LandscapeindexD.fromJson(json.decode(data)['d']);
      setState(() {
        _LandscapeIndexResult = _getResult.result;
      });
    });
  }

  ///格式化票券列表
  Widget _createListView(BuildContext context) {
    if (_LandscapeIndexResult == null) {
      return showDiog();
    }
    return ListView.builder(
      itemCount: _LandscapeIndexResult.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Deatile(
                      widget.landscapeName,
                      id: _LandscapeIndexResult[index].id,
                      url: hostAddres.getDeatilUrl(),
                    )));
              },
              child: Padding(
                padding: EdgeInsets.all(AppSize.upp375),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(_LandscapeIndexResult[index].imageUrl,
                        width: 100.0, height: 70.0, fit: BoxFit.cover),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            AppSize.upp375, 0, AppSize.upp375, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _LandscapeIndexResult[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, AppSize.upp375, 0, AppSize.upp375),
                              child: Text(
                                "来源：${_LandscapeIndexResult[index].cite}",
                                style: TextStyle(
                                    fontSize: AppSize.ufp75,
                                    color: Colors.grey),
                              ),
                            ),
                            Text(
                              _LandscapeIndexResult[index].dateTime,
                              style: TextStyle(
                                  fontSize: AppSize.ufp75, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1.0,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: easyRefresh(
          _easyRefreshKey, _headerKey, _footerKey, _createListView(context),
              () async {
            pagenum = 1;
            GetPageData.getLandScapeListData(pagenum,  (data) {
              var _getResult = LandscapeindexD.fromJson(json.decode(data)['d']);
              setState(() {
                _LandscapeIndexResult = _getResult.result;
              });
            });
          }, () async {
        pagenum++;
        GetPageData.getLandScapeListData(pagenum,  (data) {
          var _getResult = LandscapeindexD.fromJson(json.decode(data)['d']);
          setState(() {
            _LandscapeIndexResult.addAll(_getResult.result);
          });
        });
      }, false),
    );
  }
}

class GetPageData {
  static getLandScapeListData(
      int _pagenum,  Function callback) async {
    var res = await httpManager.netFetch(
        hostAddres.getMessPubUrl(),
        {
          'pageIndex': _pagenum,
        },
        null,
        null);
    callback(res.data);
  }
}
