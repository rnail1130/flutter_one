import 'package:flutter/material.dart';

class TransactionRecord extends StatefulWidget {
  final titleName;
  TransactionRecord(this.titleName);

  _TransactionRecordState createState() => _TransactionRecordState();
}

class _TransactionRecordState extends State<TransactionRecord> {
  var dropdown2Value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: dropdown2Value,
        hint: const Text('全部'),
        onChanged: (String newValue) {
          setState(() {
            dropdown2Value = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
