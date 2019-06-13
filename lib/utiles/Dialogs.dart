import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/**
 *     showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
    return new NetLoadingDialog(
    requestCallBack: _register(),//此为异步方法
    outsideDismiss: false,
    );
    });
 */
// ignore: must_be_immutable
class NetLoadingDialog extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;
  Future<dynamic> requestCallBack;

  NetLoadingDialog(
      {Key key,
        this.loadingText = "loading...",
        this.outsideDismiss = true,
        this.dismissCallback,
        this.requestCallBack})
      : super(key: key);

  @override
  State<NetLoadingDialog> createState() => _LoadingDialog();
}

class _LoadingDialog extends State<NetLoadingDialog> {
  _dismissDialog() {
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.requestCallBack != null) {
      widget.requestCallBack.then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.outsideDismiss ? _dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child:new Center(
          child: SpinKitCubeGrid(
            color: Colors.orange,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}