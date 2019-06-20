import 'package:flutter/material.dart';
import 'package:phone_yiyang/utiles/data_config.dart';

import '../hub.dart';
class governmentPerson extends StatefulWidget {
  @override
  _governmentPersonState createState() => _governmentPersonState();
}

class _governmentPersonState extends State<governmentPerson> {
  final List datas = DataConfig.middleData_list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> bilds(){
    List<Widget> con = [];
    datas.forEach((item){

      con.add(InkWell(
          onTap: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => hub(item['title'])),
            );
          },
          child:  Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 10.5,color: Colors.grey[200]))
            ),
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 30),
            child:Row(
              children: <Widget>[
                Image.asset(
                  item['img'],
                  width: 45.0,
                ),
                SizedBox(width: 40.0,),
                Text(item['title']),
              ],
            ),
          )));
    });
    return con;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: bilds()
    );
  }
}
