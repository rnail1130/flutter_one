import 'package:flutter/material.dart';
class government  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context,int index){
        return new Text("text $index");
       },
    );
  }
}
