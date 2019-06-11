import 'package:flutter/material.dart';

import '../hub.dart';
class government  extends StatefulWidget {
  @override
  _governmentState createState() => _governmentState();
}

class _governmentState extends State<government> {
  List<String> ListDatas = datas.list;
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('refresh1');
    });
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: ListDatas.length,
        itemBuilder: (BuildContext context,int index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
                ),
                child: Text(ListDatas[index]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                height: 50,
                width: 100,
                child: OutlineButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => hub(ListDatas[index])),
                    );
                  },
                  child: Text("查询",style: TextStyle(fontSize: 12.0,color: Theme.of(context).primaryColor),),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              Container(
                height: 10.0,
                color: Colors.grey[100],
              ),
            ],
          );
        },
      ),
    );
  }
}
class datas{
  static const list = [
    '不动产登记查询','单位医保参保查询','个人医保参保查询','个人公积金查询','单位失业查询','个人失业查询','单位工伤查询','个人工伤查询'
  ];
}