import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
class lostCall extends StatelessWidget {
  Widget _buildr(String string){
    return Html(
      data: string,
      defaultTextStyle: TextStyle(
          fontSize: 15.0,
          wordSpacing: 20.0,
          height: 1.3
      ),
    );
  }
  _launchURL() async {
    const url = 'tel:0737-6666666';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset("assets/images/header_bg.png"),
            Positioned(
              right: 30,
              top:50,
              child: Column(
                children: <Widget>[
                  Text('益阳居民卡',style: TextStyle(fontSize: 12,fontFamily: "alm",color: Theme.of(context).backgroundColor),),
                  SizedBox(height: 10,),
                  Text('紧急挂失',style: TextStyle(fontFamily: "alr",fontSize: 20.0,color: Theme.of(context).backgroundColor),),
                ],
              ),
            ),
          ],
        ),

        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildr(htmlData.html),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("办理居民卡账户挂失",style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),),
              ),
              _buildr(htmlData.html1),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: _launchURL,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("居民卡一键挂失",style: TextStyle(fontSize: 17.0,color: Theme.of(context).backgroundColor),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              _buildr(htmlData.html2),
              _buildr(htmlData.html3),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("办理居民卡账户挂失",style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),),
              ),
              _buildr(htmlData.html4),
            ],
          ),
        ),
      ],
    );
  }
}
class htmlData {
  static const html = """ 
<div >
                益阳居民卡兼具银行借记卡（需开通银行联合发卡业务）与居民卡账户，益阳居民卡虚拟卡则只包括，因此在办理紧急挂失时，需分别办理“银行卡账户挂失”和“居民卡账户挂失”。
            </div>
  """;
  static const html1 = """ 
<div >
                方法一：点击下方“一键挂失”按钮，提交您的个人账户信息和有效身份信息完成挂失。
            </div>
  """;
  static const html2 = """ 
<div >
                方法二：拨打居民卡挂失电话0737-6666666进行人工挂失，需提供个人有效身份信息及居民卡相关信息。
            </div>
  """;
  static const html3 = """ 
<div >
                *
                注意：联合发卡银行和居民卡公司不会通过任何途径主动与您联系向您索要您的居民卡账户信息与密码，请您提高警惕严防诈骗。请用户妥善保管居民卡。因为居民卡账户遗失造成的任何损失益阳居民卡运营服务有限公司不承担任何责任。
            </div>
  """;
  static const html4 = """ 
<div>
                办理银行卡挂失请您持有效身份证件至联合发卡银行业务柜台办理。
            </div>
  """;
}