import 'package:flutter/material.dart';

class editEmail extends StatefulWidget {
  @override
  _editEmailState createState() => _editEmailState();
}

class _editEmailState extends State<editEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                border: OutlineInputBorder(),
                hintText: '请输入邮箱',
                labelText: '邮箱',
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: (){},
              color: Theme.of(context).primaryColor,
              child: Text('确  定',style: TextStyle(color: Theme.of(context).backgroundColor),),
            ),
          ),
        ],
      ),
    );
  }
}
