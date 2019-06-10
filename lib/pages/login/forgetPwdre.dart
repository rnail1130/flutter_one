import 'package:flutter/material.dart';

class forgetre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('忘记密码',style: TextStyle(fontSize: 16.0, color: Colors.white),),
      ),
      body: forgetHomePage(),
    );
  }
}
class forgetHomePage extends StatefulWidget {
  @override
  _forgetHomePageState createState() => _forgetHomePageState();
}

class _forgetHomePageState extends State<forgetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              border: OutlineInputBorder(),
              hintText: '密码',
              labelText: '请输入密码',
              prefixIcon: Icon(Icons.lock_outline),
            ),
        ),
          ),
          SizedBox(height: 20.0,),
          Container(
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                border: OutlineInputBorder(),
                hintText: '重复密码',
                labelText: '再次输入密码',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: (){},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 14.0),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
