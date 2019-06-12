import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
class userUse extends StatelessWidget {
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
                  Text('使用说明',style: TextStyle(fontFamily: "alr",fontSize: 20.0,color: Theme.of(context).backgroundColor),),
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
              _buildr(htmlData.html1),
              Text('如何办理居民卡？',style: TextStyle(fontSize: 16.0,color: Colors.blueAccent,fontWeight: FontWeight.w900),),
              SizedBox(height: 20.0,),
              _buildr(htmlData.html2),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){},
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("点击查看我的居民卡",style: TextStyle(fontSize: 17.0,color: Theme.of(context).backgroundColor),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              _buildr(htmlData.html3),
              Text('居民卡紧急挂失',style: TextStyle(fontSize: 16.0,color: Colors.blueAccent,fontWeight: FontWeight.w900),),
              SizedBox(height: 20.0,),
              _buildr(htmlData.html4),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("办理居民卡账户挂失",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html5),
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
              SizedBox(height: 20.0,),
              _buildr(htmlData.html6),
              _buildr(htmlData.html7),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("办理银行卡账户挂失",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html8),
              Text('居民卡功能简介',style: TextStyle(fontSize: 16.0,color: Colors.blueAccent,fontWeight: FontWeight.w900),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("一公里便民服务网点",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html9),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("智慧益阳APP",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html10),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("具有金融支付和多种定制支付应用",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html11),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("脱离手机使用任何第三方支付",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html12),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("居民卡账户开放性整合能力",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html13),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("移动积分可以当钱花",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html14),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("到哪消费都能攒积分",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html15),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("卡内存放各种票证",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html16),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("居民卡刷门禁记考勤",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html17),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("享专属银行增值服务和理财收益",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
              ),
              _buildr(htmlData.html18),
            ],
          ),
        ),
      ],
    );
  }
}
class htmlData{
  static const html = """ 
  <div class="">
                居民卡平台是助力政府服务百姓的智慧民生综合服务平台，平台具有与其它系统、账户互联互通的开放化特性。使用益阳居民卡用户可以办理政务、公共生活缴费、查询消费流水、管理商户会员卡、管理电子票券、查看附近商家、居民卡VIP会员认证、获取优惠促销、查看地方实事资讯等。
            </div>
  """;
  static const html1 = """ 
<div class="">
                以下内容为居民卡完整版使用说明，全面、详细地介绍了居民卡及其办理、使用的方法，带您全面认识居民卡。
            </div>
  """;
  static const html2 = """ 
<div class="">
                您在注册智慧益阳APP时已开通了益阳居民卡虚拟卡，使用居民卡虚拟卡可以在居民卡授权的“一公里便民服务网点”商户处，借助商户终端设备及应用，进行政务办理、公交充值、卡表类缴费充值、电子票券核销等业务、服务的办理。目前，益阳居民卡虚拟卡除提供如微信支付、支付宝、和包支付、银闪付等常见的支付方式外，还为卡用户提供居民卡专属的居民卡转账（需银行联合发卡支持）、商户点卡、商户积分、移动积分等专属特色支付。
            </div>
  """;
  static const html3 = """ 
<div class="">
                益阳居民卡暂未与当地银行开通联合发卡业务合作，暂时无法办理益阳居民卡实体卡。
            </div>
  """;
  static const html4 = """ 
<div class="">
                益阳居民卡兼具银行借记卡（需开通银行联合发卡业务）与居民卡账户，益阳居民卡虚拟卡则只包括，因此在办理紧急挂失时，需分别办理“银行卡账户挂失”和“居民卡账户挂失”。
            </div>
  """;
  static const html5 = """ 
<div class="">
                方法一：点击下方“居民卡一键挂失”按钮，提交您的个人账户信息和有效身份信息完成挂失。
            </div>
  """;
  static const html6 = """ 
<div class="">
                方法二：拨打居民卡挂失电话0737-6666666进行人工挂失，需提供个人有效身份信息及居民卡相关信息。
            </div>
  """;
  static const html7 = """ 
<div class="">
                *
                注意：联合发卡银行和居民卡公司不会通过任何途径主动与您联系向您索要您的居民卡账户信息与密码，请您提高警惕严防诈骗。请用户妥善保管居民卡。因为居民卡账户遗失造成的任何损失益阳居民卡运营服务有限公司不承担任何责任。
            </div>
  """;
  static const html8 = """ 
<div class="">
                办理银行卡挂失请您持有效身份证件至联合发卡银行业务柜台办理。
            </div>
  """;
  static const html9 = """ <div class="">
                为了更好地为地方居民卡用户提供便捷、实惠的民生服务体验，居民卡公司通过签约合作的方式将传统商户打造为您身边的“一公里便民服务网点”。为居民卡用户提供了如政务服务办理、卡表类现金充值缴费、非卡表类公共生活缴费、公交卡充值、电子票务销售、移动积分线下消费等丰富的居民卡民生服务。
            </div>
  """;
  static const html10 = """ 
  <div class="">
                智慧益阳APP作为地方政府的展示门户和智慧民生服务终端，根据政府主导加入各类政务办理、公共生活缴费、查询消费流水、管理商户会员卡、管理电子票券、查看附近商家、居民卡VIP会员认证、获取优惠促销、查看地方实事资讯等服务，切实为地方百姓提供智慧、便捷、实惠的民生综合服务。
            </div>
  """;
  static const html11 = """ 
<div class="">
                居民卡支持多种特色支付方式：居民卡转账、居民卡票券支付、中国移动积分线下支付、中国移动和包支付、商户点卡支付、商户积分兑换。居民卡用户通过联合发卡合作银行可以办理居民卡实体卡，实体卡具备传统银行借记/贷记卡的金融支付功能。
            </div>
  """;
  static const html12 = """ 
<div class="">
                居民卡平台系统能和任何第三方支付系统与账户互联互通，用户可在脱离手机的情况下使用居民卡在POS机上完成第三方支付应用的刷卡消费。如已开通的和包支付。
            </div>
  """;
  static const html13 = """ 
<div class="">
                居民卡账户能够绑定政务、缴费、第三方支付、银行卡、商业和机构会员等应用账户。同时，可以兼容整合任何一卡通应用场景，政府发放居民卡的核心目的之一就是让老百姓们方便，随身就带一张卡，能办所有的事。
            </div>
  """;
  static const html14 = """ 
<div class="">
                居民卡为中国移动用户在卡上开通了移动积分线下支付功能，让您的移动积分可在任何支持居民卡消费的商户处平价购买任何产品，移动积分不再只是兑换话费和换高价指定产品了。在任何居民卡平台建设城市移动积分就等同于“人民币”！
            </div>
  """;
  static const html15 = """ 
<div class="">
                使用居民卡支付在不同商户消费都能获得该消费商户赠送的积分，不同商户的消费积分分开累计和使用，消费积分时需遵照各商户制定的商户积分消费兑换规则，请通过智慧益阳APP及时了解您的积分情况。
            </div>
  """;
  static const html16 = """ 
<div class="">
                居民卡上可以集成上百种各类票证，例如可替代门票在闸机上直接刷居民卡入场，支持如景点门票、场馆门票、演出门票和电影票等各类票务应用，还可满足如大型游乐场、滑雪场内的设备租赁、储物柜使用、参与各娱乐项目的通票通卡。平台将会根据地方政府主导，持续在居民卡内整合各类经营场所的票证，减少老百姓排队买票的时间，让持卡人一卡在手畅行无阻。
            </div>
  """;
  static const html17 = """ 
<div class="">
                居民卡作为实名制卡具备身份验证功能，可以为社区、公司和机关单位提供安全、可靠、便捷和多元化的居民卡门禁设备与系统解决方案。您可以在已授权的居民卡门禁系统中直接使用居民卡开门开锁，减少随身携带多张门禁卡的不便。居民卡门禁系统在公司应用环境中还能完成考勤记录、多门禁权限授权等功能。
            </div>
  """;
  static const html18 = """ 
<div class="">
                居民卡实体卡是居民卡公司与地方联合发卡合作银行共同推出的金融属性的实名制联名卡。最为政府主导发行的便民惠民卡种，联合发卡合作银行会为卡用户提供更加实惠的专属权益。如活期存款利率更高，用居民卡购买理财产品收益率更高，免除居民卡用户的跨行转账手续费、消费短信提醒服务费、小额账户管理费、制卡工本费和卡年费等。
            </div>
  """;
}