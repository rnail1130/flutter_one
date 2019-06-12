import 'package:flutter/material.dart';
class editxPass extends StatefulWidget {
  @override
  _editPassState createState() => _editPassState();
}

class _editPassState extends State<editxPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone,size: 20,),
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入开通虚拟卡绑定手机号',
                labelStyle: TextStyle(fontSize: 12.0)
            ),
            autofocus: false,
          ),
          SizedBox(height: 20,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.code,size: 20,),
                contentPadding: EdgeInsets.all(10.0),
                labelText: '请输入短信验证码',
                labelStyle: TextStyle(fontSize: 12.0),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: (){},
                    child: Text('获取验证码'),
                  ),
                )
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
