import 'package:flutter/material.dart';

class find extends StatelessWidget {
  final String helpText;
  find(this.helpText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.credit_card),
              labelText: this.helpText,
//              helperText: '只能填写数字',
            ),
            autofocus: false,
           ),
          SizedBox(height: 30.0,),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: RaisedButton(
              onPressed: (){},
              color: Theme.of(context).primaryColor,
              child: Text('查   询',style: TextStyle(color: Theme.of(context).backgroundColor),),
            ),
          ), 
        ],
      ),
    );
  }
}
