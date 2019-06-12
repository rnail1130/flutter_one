import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/refresh.dart';
import 'package:phone_yiyang/model/bussines/business_list.dart';
import 'package:phone_yiyang/model/bussines/businButtons.dart';

ResultCurrentUser currentUser;

class TiedList extends StatefulWidget {
  TiedList({Key key}) : super(key: key);

  _TiedListState createState() => _TiedListState();
}

class _TiedListState extends State<TiedList> {
  double doub52p4736 = 52.4736;
  double doub85 = 85.0;
  int pagenum;
  List<ResultBusinessList> tidelist = [];
  List<bool> _listbutt = List<bool>();
  List notbang = [
    "居民卡账户",
    "身份证账户",
    "银行卡账户",
    "手机账户",
    "电子钱包账户",
    "移动和包账户",
    "居民卡VIP账户",
    "公积金账户",
    "医疗保险账户"
  ];
  // 列表
  Widget _createListView(BuildContext context) {
    return ListView.builder(
      itemCount: tidelist.length > 0 ? (tidelist.length * 2) : 0,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider(height: 0.0);
        }
        index = index ~/ 2;
        ResultBusinessList movies = tidelist[index];
        if (_listbutt.length <= index) _listbutt.add(false);

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
              child: Image.asset(
                'assets/tideimage/Tide_${movies.businessCode}.png',
                height: doub52p4736,
                width: doub52p4736,
              ),
            ),
            title: Padding(
              padding:
                  EdgeInsets.only(top: AppSize.ufp75, bottom: AppSize.ufp375),
              child: Text(movies.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.ufp875,
                      fontWeight: FontWeight.w500)),
            ),
            trailing: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        AppSize.ufp8125, AppSize.ufp75, AppSize.ufp8125, 0.0),
                    child: Text(movies.status > 0 ? '已绑定' : '未绑定',
                        style: TextStyle(
                            fontSize: AppSize.ufp625,
                            color: movies.status > 0
                                ? AppColors.text_Tide_87c87f
                                : AppColors.test95a))),
                _icon,
              ],
            ),
            children: _getbutton(movies),
          ),
        );
      },
    );
  }

  // 列表的按钮
  List<Widget> _getbutton(ResultBusinessList movies) {
    final _bButtons = BusinessButtons.fromget(movies.businessCode);
    List<Widget> bus = List<Widget>();
    List<Widget> bus1 = List<Widget>();
    if (!notbang.contains(movies.name)) {
      if (movies.status > 0) {
        _bButtons.butt.removeAt(1);
      } else {
        _bButtons.butt.removeAt(2);
      }
    }
    for (var i = 0; i < _bButtons.butt.length; i++) {
      if (i < 4)
        bus.add(Padding(
          padding: EdgeInsets.fromLTRB(AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
          child: Container(
            width: doub85,
            child: RaisedButton(
              padding: EdgeInsets.all(1),
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
                  _bButtons.butt[i].fun(context, movies, currentUser != null);
                });
              },
            ),
          ),
        ));
      else
        bus1.add(Padding(
          padding: EdgeInsets.fromLTRB(AppSize.ufp45, 0.0, AppSize.ufp45, 0.0),
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
                  _bButtons.butt[i].fun();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('绑卡账户'),
        ),
      ),
      body: easyRefresh(_createListView(context), () async {
        LocalStorage.getjson("currentUser", (data) {
          currentUser = ResultCurrentUser.fromJson(data);
          pagenum = 1;
          GetPageData.getdata(pagenum, (data) {
            var businessListD = BusinessListD.fromJson(data.toString());
            setState(() {
              tidelist.clear();
              tidelist.addAll(businessListD.result);
            });
          });
        });
      }, () async {
        pagenum++;
        GetPageData.getdata(pagenum, (data) {
          var businessListD = BusinessListD.fromJson(data.toString());
          setState(() {
            tidelist.addAll(businessListD.result);
          });
        });
      }, true),
    );
  }

  @override
  void initState() {
  }
}

class GetPageData {
  static getdata(int pagenum, Function callback) async {
    var cardNo = '';
    if (currentUser != null) {
      cardNo = currentUser.fCard.toString();
    }
    var res = await httpManager.netFetch(hostAddres.getBusinessList(),
        {'cardNo': cardNo, 'pageIndex': pagenum, 'status': ''}, null, null);
    callback(res.data);
  }
}
