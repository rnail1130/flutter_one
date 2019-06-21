import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/material.dart';
class shuifei extends StatefulWidget {
  @override
  _shuifeiState createState() => _shuifeiState();
}

class _shuifeiState extends State<shuifei> {
  AMapController _controller;
  MyLocationStyle _myLocationStyle = MyLocationStyle();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: AMapView(
        onAMapViewCreated: (controller){
          controller.showMyLocation(true);
          controller.setZoomLevel(17);
          print(controller.getCenterLatlng);
        },
        amapOptions: AMapOptions(
          mapType: 1
        ),
      ),
    );
  }
}
