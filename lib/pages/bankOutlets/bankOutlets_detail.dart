import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/public.dart';


class BankOutlets_detail extends StatelessWidget {
  const BankOutlets_detail({Key key, this.id}) : super(key: key);
  final id;
  @override

  @override
  Widget build(BuildContext context) {
    EdgeInsets edgeInsets = EdgeInsets.fromLTRB(
        AppSize.upp5, AppSize.upp375, AppSize.upp5, AppSize.upp375);
    EdgeInsets edgeInset =
        EdgeInsets.fromLTRB(AppSize.upp5, 0.0, AppSize.upp5, AppSize.upp375);
    print("fUniqueId ====== " + id);
    return Scaffold(
      appBar: getheader("服务网点详情"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GaodeMap(),
          Container(
            color: AppColors.bc_blu4,
            padding: edgeInsets,
            margin: edgeInsets,
            child: Text("银行网点信息",
                style:
                    TextStyle(color: Colors.white, fontSize: AppSize.ufp875)),
          ),
          Padding(
            padding: edgeInsets,
            child: Text("网点名称：益阳农商银行(朝阳分理处)",
                style: TextStyle(
                    color: AppColors.sc_text_warn, fontSize: AppSize.ufp875)),
          ),
          Divider(height: 1),
          Padding(
            padding: edgeInsets,
            child:
                Text("地　　址：金山路38号", style: TextStyle(fontSize: AppSize.ufp875)),
          ),
          Divider(height: 1),
          Padding(
            padding: edgeInsets,
            child: Text("联系方式：0737-6185235",
                style: TextStyle(fontSize: AppSize.ufp875)),
          ),
          Divider(height: 1),
          Container(
            color: AppColors.bc_blu4,
            padding: edgeInsets,
            margin: edgeInsets,
            child: Text("网点详情",
                style:
                    TextStyle(color: Colors.white, fontSize: AppSize.ufp875)),
          ),
          Padding(
            padding: edgeInset,
            child: Text("益阳农商银行(朝阳分理处)",
                style: TextStyle(fontSize: AppSize.ufp875)),
          ),
        ],
      ),
    );
  }
}

class GaodeMap extends StatefulWidget {
  GaodeMap({Key key}) : super(key: key);

  _GaodeMapState createState() => _GaodeMapState();
}

class _GaodeMapState extends State<GaodeMap> {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
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
