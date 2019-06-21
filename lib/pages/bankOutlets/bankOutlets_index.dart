import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:phone_yiyang/model/findbankBranchesList.dart';
import 'package:phone_yiyang/pages/bankOutlets/bankOutlets_detail.dart';
import 'package:phone_yiyang/pages/public.dart';
import 'package:phone_yiyang/utiles/refresh.dart';
import 'package:flutter/material.dart';

class BankOutlets extends StatefulWidget {
  BankOutlets({Key key}) : super(key: key);

  _BankOutletsState createState() => _BankOutletsState();
}

class _BankOutletsState extends State<BankOutlets> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      GlobalKey<EasyRefreshState>(debugLabel: "getfindBankBranchesList");
  GlobalKey<RefreshHeaderState> _headerKey =
      GlobalKey<RefreshHeaderState>(debugLabel: "getfindBankBranchesList");
  GlobalKey<RefreshFooterState> _footerKey =
      GlobalKey<RefreshFooterState>(debugLabel: "getfindBankBranchesList");
  int pageIndex = 1;
  var serchstr = "";
  var imgurl = "";
  List<BankBranchesList> bankBranchesList;

  @override
  void initState() {
    GetPageData.getimg((data1) {
      var dat = json.decode(data1);
      setState(() {
        imgurl = dat["d"].toString();
      });
    });
  }

  Widget buildTextField() {
    // theme设置局部主题
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey),
      child: new TextField(
        cursorColor: Colors.grey, // 光标颜色
        // 默认设置
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            icon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "搜索",
            hintStyle: new TextStyle(
                fontSize: AppSize.ufp9, color: Color.fromARGB(50, 0, 0, 0))),
        style: new TextStyle(fontSize: AppSize.ufp9, color: Colors.black),
        onChanged: (str) {
          serchstr = str;
        },
        onSubmitted: (str) {
          print(str);
          serchstr = str;
          _easyRefreshKey.currentState.callRefresh();
        },
      ),
    );
  }

  Widget getListView(context) {
    List<Widget> listTile = [Center(child: Text("暂无数据"))];
    if (bankBranchesList != null) {
      listTile = List<Widget>();
      bankBranchesList.forEach((v) {
        listTile.add(DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: ListTile(
              leading: Image.network(v.fImagePath.toString()),
              title: Text(
                "${v.fName}",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: AppSize.uf1,
                ),
              ),
              subtitle: Text(
                "${v.fAddress}",
                style: TextStyle(
                  fontSize: AppSize.ufp875,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BankOutlets_detail(id: v.fUniqueId)));
              }),
        ));
        listTile.add(Divider(
          height: 1,
        ));
      });
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: listTile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getheader("服务网点"),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(AppSize.upp5),
            // 修饰搜索框, 白色背景与圆角
            decoration: new BoxDecoration(
              border: Border.all(color: AppColors.b_gra),
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.0),
            child: buildTextField(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: imgurl != "" ? Image.network(imgurl) : Text("数据加载中..."),
          ),
          Expanded(
            child: easyRefresh(
                _easyRefreshKey, _headerKey, _footerKey, getListView(context),
                () async {
              pageIndex = 1;
              GetPageData.getdata(pageIndex, serchstr, (data) {
                var dta = json.decode(data.toString());
                var bankBranchesListD = BankBranchesListD.fromJson(dta);
                setState(() {
                  bankBranchesList = bankBranchesListD.d;
                });
              });
            }, () async {
              pageIndex++;
              GetPageData.getdata(pageIndex, serchstr, (data) {
                var dta = json.decode(data);
                var bankBranchesListD = BankBranchesListD.fromJson(dta);
                setState(() {
                  bankBranchesList.addAll(bankBranchesListD.d);
                });
              });
            }, true),
          ),
        ],
      ),
    );
  }
}

class GetPageData {
  static getdata(int pagenum, search, Function callback) async {
    print(hostAddres.getfindBankBranchesList());
    var res = await httpManager.netFetch(hostAddres.getfindBankBranchesList(),
        {'PageIndex': pagenum, 'search': search}, null, null);
    callback(res.data);
  }

  static getimg(Function callback) async {
    var res = await httpManager.netFetch(
        hostAddres.getZJKBankImage(), {}, null, null);
    callback(res.data);
  }
}
