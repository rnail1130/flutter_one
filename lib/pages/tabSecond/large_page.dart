import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'dart:math' as math;
import 'package:qr_flutter/qr_flutter.dart';

class LargePage extends StatelessWidget {
  String code;
  int type;
  LargePage(this.code,this.type);
  Widget largerCode (){
    Widget content;
    if(this.type == 0){
      content =  BarCodeImage(
        data: this.code,   // Code string. (required)
        codeType: BarCodeType.Code128,  // Code type (required)
        lineWidth: 1.6,                // width for a single black/white bar (default: 2.0)
        barHeight: 120.0,               // height for the entire widget (default: 100.0)
        hasText: true,                 // Render with text label or not (default: false)
        onError: (error) {             // Error handler
          print('error = $error');
        },
      );
    }else{
      content = QrImage(
        data: this.code,
        size: 240.0,
      );
    }
    return content;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Scaffold(
            body: Transform.rotate(
                angle: math.pi/2,
                child: Center(
                    child: largerCode()
                )
            )
        )
    );
  }
}
