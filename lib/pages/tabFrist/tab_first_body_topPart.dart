import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/TiedCardAccount/TiedList.dart';
import 'package:phone_yiyang/pages/paymentAccount/paymentIndex.dart';
import 'package:phone_yiyang/utiles/data_config.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/pages/cardBag/cardBag_index.dart';

class TopPart extends StatelessWidget {
  //遍历追加组价
  List<Widget> getList() {
    List<Widget> content = [];
    DataConfig.topPart.forEach((k, v) {
      content.add(ExpandedList(v));
    });
    return content;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      color: null,
      decoration:
          BoxDecoration(border: Border(bottom: AppContent.BorderSideStyle)),
      //height: AppContent.ContainerHight,
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 30,
          runSpacing: 14.0, // gap between lines
          children: getList()),
    );
  }
}

class ExpandedList extends StatelessWidget {
  final List data;
  ExpandedList(this.data);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            this.data[1],
            width: AppContent.topimagesWidth,
          ),
          SizedBox(
            height: AppContent.topTextImage,
          ),
          Text(
            this.data[0],
            style: AppContent.topText,
          )
        ],
      ),
      onTap: () {
        if (this.data[0] == "绑卡账户") {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return TiedList();
          }));
        }
        if (this.data[0] == "缴费账户") {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return PaymentIndex();
          }));
        }
        if (this.data[0] == "会员账户") {}
        if (this.data[0] == "票券卡包") {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardBagIndex();
          }));
        }
      },
    );
  }
}
