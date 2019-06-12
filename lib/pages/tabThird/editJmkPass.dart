import 'package:flutter/material.dart';
class editPass extends StatefulWidget {
  @override
  _editPassState createState() => _editPassState();
}

class _editPassState extends State<editPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        children: <Widget>[
          TextField(
          keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.filter_1,size: 20,),
              labelText: '请输入旧密码',
                labelStyle: TextStyle(fontSize: 12.0)
            ),
            autofocus: false,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.filter_2,size: 20),
              labelText: '请输入新密码',
                labelStyle: TextStyle(fontSize: 12.0)
            ),
            autofocus: false,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.filter_3,size: 20),
              labelText: '请再次输入新密码',
              labelStyle: TextStyle(fontSize: 12.0)
            ),
            autofocus: false,
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: RaisedButton(
              onPressed: (){},
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('修改密码',style: TextStyle(color: Theme.of(context).backgroundColor),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
