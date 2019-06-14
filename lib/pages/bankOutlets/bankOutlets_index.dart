import 'package:phone_yiyang/pages/public.dart';
import 'package:flutter/material.dart';

class BankOutlets extends StatefulWidget {
  BankOutlets({Key key}) : super(key: key);

  _BankOutletsState createState() => _BankOutletsState();
}

class _BankOutletsState extends State<BankOutlets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("服务网点"),
      ),
      body: Container(
        color: Colors.black45,
        child: Column(
          children: <Widget>[
            Container(
              height: 30.0,
              color: Colors.red,
            ),
            ],
        ),
      ),
    );
  }
}
