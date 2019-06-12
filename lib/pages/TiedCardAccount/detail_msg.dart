import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:phone_yiyang/styles/fontSize.dart';
import 'package:phone_yiyang/utiles/core.dart';
import 'package:phone_yiyang/utiles/plug.dart';
import 'dart:io';

TextStyle abstyle = TextStyle(
    fontSize: AppSize.ufp875,
    color: AppColors.themeColor,
    fontWeight: FontWeight.bold,
    height: 1.3);
TextStyle astyle = TextStyle(
    fontSize: AppSize.ufp875, color: AppColors.themeColor, height: 1.3);
TextStyle bstyle = TextStyle(
    fontSize: AppSize.ufp875, fontWeight: FontWeight.bold, height: 1.3);
TextStyle tstyle = TextStyle(fontSize: AppSize.ufp875, height: 1.3);
TextStyle rstyle =
    TextStyle(color: AppColors.twhite, fontSize: AppSize.uf1p0625);
double mt20 = 20.0;

class H5Config {
  final String text;
  final String abtr;
  Function fun;
  H5Config(this.abtr, this.fun, this.text);
}

class GetH5 extends StatefulWidget {
  GetH5({Key key, this.businessCode, this.ifsgin}) : super(key: key);
  final businessCode;
  final ifsgin;
  _GetH5State createState() => _GetH5State();
}

class _GetH5State extends State<GetH5> {
  List<Widget> html5 = List<Widget>();
  List<String> weikaitong = ["居民卡一键挂失", "办理个人公积金查询", "办理个人医保查询", "办理企业医保查询"];
  List<String> bologin = ["点击查看我的居民卡", "查看移动积分消费明细", "购买居民卡VIP用户"];
  getFun(String msg) {
    if (weikaitong.contains(msg)) {
      alertMsg(null, null, "此功能暂未开通",null);
      return;
    } else if (bologin.contains(msg) && !widget.ifsgin) {
      alertMsg(null, null, "请登录",null);
      return;
    }
    switch (msg) {
      case "点击查看我的居民卡":
        alertMsg(null, null, "暂未添加",null);
        return;
      case "一键查询移动积分余额":
        openlaunchUrl("sms:10086?body=JF");
        return;
      case "一键兑换移动消费券":
        alertMsg(null, null, "暂未添加",null);
        return;
      case "查看移动积分消费明细":
        alertMsg(null, null, "暂未添加",null);
        return;
      case "启动和包支付APP":
        openAppurl("cmpay://", "com.cmcc.hebao",
            "https://p.10086.cn/info/wap/sjqb/cpb/jsym/index.html");
        return;
      case "和包支付免密签约授权":
        openlaunchUrl(
            "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=2&BACK_FLG=6");
        return;
      case "和包账户支付密码重置":
        openlaunchUrl(
            "https://p.10086.cn/ptw/msg_login.xhtml?FLOW_PATH=1&BACK_FLG=6");
        return;
      case "访问和包支付官网":
        openlaunchUrl("https://www.cmpay.com");
        return;
      case "安装和飞信APP":
        openlaunchUrl("http://feixin.10086.cn");
        return;
      case "购买居民卡VIP用户":
        alertMsg(null, null, "暂未添加",null);
        return;
      // case "一键查询移动积分余额":
      // case "一键兑换移动消费券":
    }
  }

  List<Widget> getHTML5() {
    List<H5Config> data;

    switch (widget.businessCode) {
      case '1001': // 居民卡账户
        data = [
          H5Config("text", null,
              "您的益阳居民卡账户。用户使用居民卡账户在本APP中实现与地方政务民生账户、公共缴费账户、商业会员账户、第三方服务进行绑定。同时，可以将居民卡实体卡与虚拟卡进行绑定，绑定后卡账户余额和交易记录将完全同步。"),
          H5Config("ab", null, "如何办理居民卡？"),
          H5Config("text", null,
              "您在注册智慧益阳APP时已开通了益阳居民卡虚拟卡，使用居民卡虚拟卡可以在居民卡授权的“一公里便民服务网点”商户处，借助商户终端设备及应用，进行政务办理、公交充值、卡表类缴费充值、电子票券核销等业务、服务的办理。目前，益阳居民卡虚拟卡除提供如微信支付、支付宝、和包支付、银闪付等常见的支付方式外，还为卡用户提供居民卡专属的居民卡转账（需银行联合发卡支持）、商户点卡、商户积分、移动积分等专属特色支付。"),
          H5Config("r", null, "点击查看我的居民卡"),
          H5Config("text", null, " 益阳居民卡暂未与当地银行开通联合发卡业务合作，暂时无法办理益阳居民卡实体卡。"),
          H5Config("ab", null, "居民卡紧急挂失"),
          H5Config("text", null,
              "益阳居民卡兼具银行借记卡（需开通银行联合发卡业务）与居民卡账户，益阳居民卡虚拟卡则只包括，因此在办理紧急挂失时，需分别办理“银行卡账户挂失”和“居民卡账户挂失”。"),
          H5Config("b", null, "办理居民卡账户挂失"),
          H5Config("text", null, "方法一：点击下方“居民卡一键挂失”按钮，提交您的个人账户信息和有效身份信息完成挂失。"),
          H5Config("r", null, "居民卡一键挂失"),
          H5Config("text", null,
              "方法二：拨打居民卡挂失电话0737-6666666进行人工挂失，需提供个人有效身份信息及居民卡相关信息。"),
          H5Config("text", null,
              "* 注意：联合发卡银行和居民卡公司不会通过任何途径主动与您联系向您索要您的居民卡账户信息与密码，请您提高警惕严防诈骗。请用户妥善保管居民卡。因为居民卡账户遗失造成的任何损失益阳居民卡运营服务有限公司不承担任何责任。"),
          H5Config("b", null, "办理银行卡账户挂失"),
          H5Config("text", null, "办理银行卡挂失请您持有效身份证件至联合发卡银行业务柜台办理。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1002': // 身份证账户
        data = [
          H5Config("ab", null, "身份证账户"),
          H5Config("text", null,
              "绑定您的身份证账户，办理居民卡时已绑定。账户绑定后，在办理居民卡业务和使用政务民生服务时，用户无需手动进行身份证账户认证，通过居民卡和居民卡虚拟卡认证功能直接办理、使用身份证相关业务。"),
          H5Config("b", null, "如何挂失/补办身份证"),
          H5Config("text", null, "方法一：本地办理"),
          H5Config("text", null,
              "申领人带本人的居民户口簿，到户口所在地派出所申请补领第二代居民身份证。经工作人员审核无误后，采集人像和指纹信息。填写《居民身份证申领登记表》。缴纳证件工本费，每证40元，在发放居民身份证登记表上签字并留下联系电话。公安机关应当在公民提交《居民身份证申领登记表》之日起60日内发放居民身份证；交通不便的地区，办理时间可以适当延长，但延长时间不得超过30日。"),
          H5Config("text", null, "方法二：异地办理"),
          H5Config("text", null,
              "办理身份证的人，必须在周一到周五去公安分局办证大厅或者所居住的派出所户政室进行办理。上午8:00-12:00，下午14:00-18:00是办理时间。办理人也登陆所在地市公安局户政网上预约平台或拨打114电话，进行预约办理。预约后，在规定时间内，持预约受理编号、本人一寸照片、以及身份证明，户籍证明、工作或学籍证明、暂住证、学生证等资料的原件及复印件前往公安局办证大厅或派出所户政室进行办理。资料审核完毕以后，7个工作日内领取身份证。"),
          H5Config("text", null, "特别提示"),
          H5Config("text", null,
              "1. 公民因居民身份证被抢、被盗或丢失，应主动到案发地公安机关报案，并持《居民户口簿》到户口所在地公安派出所报告情况，申请补领居民身份证，发证机关应做好相应的记载。"),
          H5Config("text", null,
              "2. 公民因各种原因，不能到户口所在地派出所补办居民身份证，可委托亲人持《居民户口簿》、委托书、居民身份证复印件到户口所在地派出所补办第二代居民身份证。异地办理申请人需要准备好自己的相片、以及身份证明，户籍证明；学生的话要准备好学生证，学校的学籍证明；有工作的人需要单位出具证明、暂住证等资料的原件以及复印件。"),
          H5Config("text", null, "3. 公民在申请补领居民身份证期间，急需使用居民身份证的，可以申请领取临时居民身份证。"),
          H5Config("text", null, "4. 详询请咨询当地派出所。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1003': // 银行账户
        data = [
          H5Config("ab", null, "银行卡账户"),
          H5Config("text", null,
              "绑定您的居民卡银行卡金融支付账户，在联合发卡合作银行办理居民卡时已绑定本账户。目前益阳居民卡公司暂未与地方银行进行联合发卡合作。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1004': // 手机账户
        data = [
          H5Config("text", null, "APP注册时已默认绑定您的个人手机号账户，同时为您开通了居民卡虚拟卡。"),
          H5Config("text", null,
              "中国移动五源计划商业管理平台为地方移动用户提供了“移动积分消费”服务，用户使用移动手机号内的移动积分兑换居民卡移动消费券（以下简称“移动消费券”），使用移动消费券在居民卡签约商户处平价购买/换购商品，在五源计划落地城市移动积分可以兑换为移动消费券后，在居民卡签约商户处换购商品。"),
          H5Config("ab", null, "“移动积分消费”仅需三步"),
          H5Config("b", null, "第一步：移动积分余额查询"),
          H5Config("text", null,
              "移动用户通过点击下方“一键查询移动积分余额”按钮或编辑短信“JF”发送到10086查询移动积分余额。"),
          H5Config("r", null, "一键查询移动积分余额"),
          H5Config("b", null, "第二步：一键兑换移动消费券"),
          H5Config("img", null, "assets/img/TiedCardAccount/sms_duihuan.jpg"),
          H5Config("text", null,
              "移动用户使用移动积分根据上表兑换方法兑换移动消费券。点击“一键兑换移动消费券”按钮，或编辑短信发送到10658999兑换相应档位的移动消费券。"),
          H5Config("r", null, "一键兑换移动消费券"),
          H5Config("b", null, "第三步：移动消费券换购商品"),
          H5Config("text", null,
              "请在智慧益阳APP“签约商户”页面内查看支持“移动积分消费”的商户。根据商户制定的换购规则在商户终端上完成消费。"),
          H5Config("r", null, "查看移动积分消费明细"),
          H5Config("b", null, "温馨提示："),
          H5Config("text", null,
              "1. “移动积分消费”服务支持在所有五源计划落地建设省份的移动用户的移动消费券兑换，支持在居民卡签约商户APP、POS终端、积分兑换APP上进行消费券换购商品。"),
          H5Config("text", null, "2. 兑换成功后，概不退换。移动消费券可一次性消费，也可以累计消费。"),
          H5Config("text", null, "3. 居民卡移动消费券可以与其它支付方式混合使用，移动消费券使用部分不开具发票。"),
          H5Config("text", null, "4. 居民卡移动消费券一经兑换不退不换，不可兑换现金。"),
          H5Config("text", null, "5. 移动消费券自兑换之日起有效期90个自然日，过期作废。"),
          H5Config("text", null, "6. 请由本人完成居民卡消费券的兑换和消费操作。"),
          H5Config("b", null, "声明："),
          H5Config("text", null,
              "移动积分消费解释权归中国移动和益阳居民卡运营服务有限公司所有。如有问题请致电：010-86462811居民卡客服电话进行咨询"),
          H5Config("text", null, ""),
        ];
        break;
      case '1005':
        data = [];
        break;
      case '1006': // 移动和包账户
        data = [
          H5Config("text", null,
              "用户在联合发卡合作银行居民卡办理居民卡时，已将居民卡开通绑定和包支付账户。虚拟卡需完成和包支付账户开通绑定才能使用和包支付业务。"),
          H5Config("r", null, "启动和包支付APP"),
          H5Config("r", null, "和包支付免密签约授权"),
          H5Config("r", null, "和包账户支付密码重置"),
          H5Config("a", null, "一、移动和包支付APP介绍"),
          H5Config("text", null,
              "中国移动和包（原名“手机支付”、“手机钱包”）是中国移动面向个人和企业客户提供的一项领先的综合性移动支付业务，让客户享受到方便快捷、丰富多彩、安全时尚的线上、线下支付体验。中国移动和包（NFC）业务是将用户日常生活中使用的各种卡片应用（如银行卡、公交卡、校园/企业一卡通、会员卡等）装载在具有NFC功能的手机中，让用户随时随地刷手机消费，实现手机变钱包的功能。在有和包（NFC）业务合作标识的现场合作商家进行消费时，用户只需持NFC手机靠近对应业务受理终端刷一刷即可轻松实现消费。"),
          H5Config("b", null, "和包支付，为靠谱买单"),
          H5Config("b", null, "和包出行"),
          H5Config("text", null, "地铁、火车票、挂号问诊，您的便捷出行神器"),
          H5Config("b", null, "和包社交"),
          H5Config("text", null, "和包名片、和包果园、和包发红包，您的靠谱社交平台"),
          H5Config("b", null, "和包交费"),
          H5Config("text", null, "水电费、社保缴费、党费，您的生活服务管家"),
          H5Config("b", null, "和包商城"),
          H5Config("text", null, "线上、线下购物，您的购物消费平台"),
          H5Config("b", null, "和包通信"),
          H5Config("text", null, "号码付、充话费、转账，您的通信支付助手"),
          H5Config("b", null, "和包金服"),
          H5Config("text", null, "和聚宝、和包贷，您的金融理财专家"),
          H5Config("r", null, "访问和包支付官网"),
          H5Config("a", null, "二、移动和包支付APP使用"),
          H5Config("text", null, "1. 请注册和包支付账户并登录。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb02.png"),
          H5Config("text", null, "2. 完成注册后，点击银行卡图标。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb03.png"),
          H5Config("text", null, "3. 选择点击添加银行卡。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb04.png"),
          H5Config("text", null, "4. 填写银行卡信息后点击下一步。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb05.png"),
          H5Config("text", null, "5. 输入短信验证码。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb06.png"),
          H5Config("text", null, "6. 银行卡绑定成功后，会立即收到短信通知。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb07.png"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb08.png"),
          H5Config("text", null, "7. 完成绑定，即可在智慧益阳APP中进行消费使用。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb09.png"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ydhb10.png"),
          H5Config("text", null, ""),
        ];
        break;
      case '1007': // 公交卡账户
        data = [
          H5Config("ab", null, "公交卡账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与当地公交公司开通公交卡业务合作。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1008': // 社保卡账户
        data = [
          H5Config("ab", null, "社保卡账户"),
          H5Config("text", null,
              "益阳居民卡用户可以在APP和“一公里便民服务网点”商户处的商户终端，办理社保相关业务，目前支持个人和企业医保查询业务。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_sbk.jpg"),
          H5Config("a", null, "如何办理社保卡？"),
          H5Config("b", null, "方法一：企业办理"),
          H5Config("text", null,
              "一般进入企业或单位，都会给每位员工办理社保，如果单位给你缴纳了社保，单位会为你一并办理社保卡，当然，个人去银行办理也可以。在此分本地和异地2种。像大学毕业生，进入一家单位，有的档案和户口都一并迁移过来；有的是档案迁过来了，户口还在自己的家里；还有的是2个都未迁过来。"),
          H5Config("text", null,
              "本地户口的只需要身份证，户口不在本地的，就近去一家照相馆，可以出具相片回执单，只要说是办理社保就可以了，15元/份，当即取加5元，不急的话，没必要，第二天再取回。"),
          H5Config("b", null, "方法二：个人办理"),
          H5Config("text", null,
              "1. 去当地社保局办理本地人需要购买社保的，可以直接去当地的地税局购买，个人挂靠单位办理社保，是以人力资源公司的名义去购买。个人与人力资源代理公司签订代理合同，提交相关资料，缴纳社保费与服务费。（社保费：由企业缴纳部分、个人缴纳部分组成），个人挂靠单位购买，总的社保费都是由个人支付。代理公司就按月为个人缴纳社保。个人可以上社保局网（或者地税网）查询自己购买的社保明细，并在次月领取社保卡（以前是）。需要挂靠单位购买社保的人群：自由职业者，创业者，灵活就业者，暂时失业或者短期工作者。"),
          H5Config("text", null,
              "以个人名义挂靠到人力资源公司购买社保的，主要也是为了享受：养老保险、生育保险、医疗保险。工伤与失业保险也是享受不到的（工伤与失业保险都是单位为员工承担费用的，但个人只是挂靠人力资源公司购买，是不存在劳动关系的，代理公司无法证明个人是出现工伤，或者是非本人意愿失业）。"),
          H5Config("text", null,
              "任何人的失业险都是要在：非本人意愿下失业，如企业倒闭，企业裁员，合同到期企业不续签等。工伤险也是在正常单位上班状态，因工负伤，才可以享受到工伤险的待遇。"),
          H5Config("text", null,
              "2. 网上办理目前也有部分地区为了使市民在办理社保过程中享受到更方便的服务，推出网络办理个人社保业务，个人开通网上社保业务前，本人必须持身份证到地税部门申领自己的网上开通密码，之后即可随时开通办理。再遇到社保办理方面的具体问题时，就可通过上网搞定，再也不用劳苦奔波到地税部门办理。即使是开具社保证明，也可网上办理，而且政府各个部门还可以通过地税部门的网上社保证明查询系统，确认该社保证明的真伪。通过网络办理社保缴费时，个人在网上获取扣费一卡通用户号后，还应到银行办理银行卡的扣费委托手续。"),
          H5Config("a", null, "如何激活社保卡？"),
          H5Config("b", null, "方法一：对应银行营业网点激活"),
          H5Config("text", null, "社保卡具有银行卡的功能，发卡的右上角都能找到对应的银行。"),
          H5Config("b", null, "方法二：在医保的定点医院使用社保卡"),
          H5Config("text", null, "在指定医院付款使用时自动激活。"),
          H5Config("b", null, "方法三：社保部门窗口激活"),
          H5Config("text", null, "社保卡都是从社保部发出去的，到当地社保所，请社保部窗口工作人员帮助激活即可。"),
          H5Config("b", null, "方法四：电话激活"),
          H5Config("text", null, "拨打官方电话：12333，转人工服务可以帮你解决各种社会保障、劳动关系等各种问题。"),
          H5Config("a", null, "如何查询个人社保缴费情况？"),
          H5Config("b", null, "方法一：社保中心查询"),
          H5Config("text", null, "如果对自己的社保帐号不清楚，可以携带身份证到各区社会保险经办机构业务办理大厅查询。"),
          H5Config("b", null, "方法二：上网查询"),
          H5Config("text", null,
              "登陆所在城市的劳动保障网或社会保险业务网站，点击“个人社保信息查询”窗口，输入本人身份证和密码（密码是你的社保证编号或者身份证出生年月），即可查询本人参保信息。"),
          H5Config("b", null, "方法三：电话咨询"),
          H5Config("text", null, "拨打劳动保障综合服务电话“12333”进行政策咨询和信息查询。"),
          H5Config("a", null, "如何挂失社保卡？"),
          H5Config("b", null, "方法一："),
          H5Config("text", null, "拨打电话“12333”，然后通过语音提示或者人工服务进行社保卡挂失。"),
          H5Config("b", null, "方法二："),
          H5Config("text", null, "登陆社保卡的官方网站，通过网站提示在线办理社保卡挂失手续。"),
          H5Config("b", null, "方法三："),
          H5Config("text", null, "在人社部门大厅的自助设备上面进行社保卡挂失，使用自助设备一般要通过刷身份证进行登陆。"),
          H5Config("b", null, "方法四："),
          H5Config(
              "text", null, "携带本人有效身份证件（一般是二代身份证）直接去社保卡服务中心或者其他指定地点办理书面的挂失手续。"),
          H5Config("b", null, "方法五："),
          H5Config("text", null, "已开通银行账户功能的社保卡，要携带本人的有效身份证件去银行的营业网点办理挂失。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "同时具备城市一卡通功能的社保卡，要通过开通功能的专门渠道进行挂失手续的办理。"),
          H5Config("a", null, "如何补办社保卡？"),
          H5Config("text", null,
              "携带本人有效身份证件去社保卡归属地的相关服务网点办理社保卡补办手续，填写相关表单，并缴纳一些费用，一般一周后可以带着本人身份证件去领取新卡。有些地区补办社保卡可以通过相关的合作银行进行办理，具体可以携带本人有效身份证件去相关的营业网点咨询。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "1. 社保卡临时挂失后，要及时地去办理书面挂失手续。"),
          H5Config("text", null, "2. 各个地方的办理流程可能有差异，具体可以先通过电话12333进行咨询。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1009': // 残疾人证
        data = [
          H5Config("ab", null, "残疾人证"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与残疾人联合会开通业务合作。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_cjz.jpg"),
          H5Config("a", null, "如何申请残疾人证？"),
          H5Config("b", null, "残疾人证办理程序："),
          H5Config("text", null, "1. 户口所在地的县、市、区级残联领取《残疾人证申请表》和《残疾评定表》；"),
          H5Config("text", null, "2. 身份证或户口本复印件一张；"),
          H5Config("text", null, "3. 两寸彩色相片2－6张（多带不碍事，各地标准不一）；"),
          H5Config("text", null, "4. 残疾类型等级证明。目前分为六类四级："),
          H5Config("text", null, "六类：1视力；2听力；3言语；4肢体；5智力；6精神；7多重（两类及以上）"),
          H5Config("text", null, "四级：1~4级，1~2级为重度残疾。"),
          H5Config("b", null, "注意："),
          H5Config("text", null,
              "1. 目前政策针对肢体、视力、精神、智力四类，一、二级的重度残疾人提供生活补助金，每人每月在50左右（各地经济不同，标准也不一样）。"),
          H5Config("text", null,
              "2. 残疾很明显的可以直接到残联进行评级（像肢体类）审核办理，不明显的必须到指定医院、指定医生进行评级签名并盖章。"),
          H5Config("a", null, "如何挂失/补办残疾人证？"),
          H5Config("text", null, "1. 残疾人提出书面申请写明丢失原因、时间、地点，提出原证作废申请补办残疾人证。"),
          H5Config("text", null, "2. 申请人填写残疾人证挂失声明社区在公告栏内将残疾人证挂失声明张贴10日，挂失寻找。"),
          H5Config("text", null,
              "3. 挂失声明期满后仍然未找到的，申请人填写残疾人证作废声明，社区将残疾人证作废声明报街道残联，街道残联报区残联，区残联在网站刊登公告，声明原残疾人证作废。"),
          H5Config("text", null,
              "4. 刊登公告三个月后，没有接到投诉者方可申请补领。残疾人到社区申请补办残疾人证，除免到医院体检外，其他手续按新办证流程审批。"),
          H5Config("b", null, "注意："),
          H5Config("text", null,
              "书面申请、残疾人证挂失声明、公示期满后，到社区申请补办残疾人证。除免到医院体检外，其他手续按新办证流程审批。书面申请、残疾人证挂失声明、残疾人证作废声明残疾人证作废声明同时附在申请表中。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1010': // 工会卡账户
        data = [
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与当地工会开通工会卡业务合作。"),
          H5Config("text", null, " "),
          H5Config("ab", null, "具有居民卡功能的工会卡"),
          H5Config("text", null, " "),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_ghk2.png"),
          H5Config("text", null,
              "益阳居民卡是经益阳市政府批准，益阳市电子政务办牵头，由益阳居民卡公司、中国移动和包、联合发卡合作银行共同推出的集金融、商业、生活等众多用途的综合服务账户。居民卡分为银行联合合作发卡和智慧益阳APP虚拟卡两种账户载体。无论是实体卡还是虚拟卡都可以与地方工会卡账户绑定、功能互通，并可为地方工会定制工会联名居民卡。与益阳居民卡绑定后工会卡将具备："),
          H5Config(
              "text", null, "1. 益阳工会卡可具备益阳居民卡的全部功能；同时使用智慧益阳APP可以办理查询市总工会相关业务。"),
          H5Config("text", null, "2. 使用益阳居民卡卡号；具有益阳居民卡统一标识，联名发布实体卡和虚拟卡。"),
          H5Config(
              "text", null, "3. 请使用居民卡卡号登录智慧益阳APP，可通过智慧益阳APP查询各类用卡信息、使用各类卡功能。"),
          H5Config("text", null, ""),
          H5Config("text", null, ""),
        ];
        break;
      case '1011': // 行驶证账号
        data = [
          H5Config("ab", null, "行驶证账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与当地车管所开通行驶证业务合作。"),
          H5Config("a", null, "如何办理车辆行驶证？"),
          H5Config(
              "text", null, "在领取牌照的同一车管所办理,需携带的文件包括行驶证待办凭证、养路费缴纳凭证、安委会登记备案资料。"),
          H5Config("a", null, "如何挂失/补办车辆行驶证？"),
          H5Config("text", null,
              "机动车行驶证丢失或者损毁的，向登记地车辆管理所申请补领、换领。申请时，机动车所有人应当填写请表并提交身份证明。车辆管理所应当自受理之日起一日内补发、换发行驶证。填写申请表，交验机动车，并提交以下证明、凭证："),
          H5Config("text", null, "1. 机动车所有人的身份证明;"),
          H5Config("text", null, "2. 购车发票等机动车来历证明;"),
          H5Config("text", null, "3. 机动车整车出厂合格证明或者进口机动车进口凭证;"),
          H5Config("text", null, "4. 车辆购置税完税证明或者免税凭证;"),
          H5Config("text", null, "5. 机动车交通事故责任强制保险凭证;"),
          H5Config("text", null, "6. 法律、行政法规规定应当在机动车注册登记时提交的其他证明、凭证。"),
          H5Config("text", null,
              "不属于经海关进口的机动车和国务院机动车产品主管部门规定免予安全技术检验的机动车，还应当提交机动车安全技术检验合格证明。"),
          H5Config("text", null,
              "车辆管理所应当自受理申请之日起二日内，确认机动车，核对车辆识别代号拓印膜，审查提交的证明、凭证，核发机动车登记证书、号牌、行驶证和检验合格标志。"),
          H5Config("b", null, "补办行驶证需要的手续："),
          H5Config("text", null,
              "机动车所有人的身份证明; 补领行车证车辆照片一张; 同时申请补二面牌照由所辖区或丢失地派出所出具丢失证明。"),
          H5Config("b", null, "补领机动车行驶证办理程序："),
          H5Config("text", null,
              "领取并填写《补领、换领机动车牌证申请表》; 丢失一面牌照的，需将另一面牌照交车管部门; 在业务窗口办理补领手续，并领取受理凭证; 到收费岗交费后，领取行车证或临时牌照; 补领牌照的15日后，凭临时牌照和受理凭证到牌照发放处领取号牌。"),
          H5Config("b", null, "补办行驶证如何收费："),
          H5Config("text", null,
              "补行驶证都是工本费15元（属行政事业性收费，全国统一）；但需要自带车辆照片；准备最后一次年检的收费收据和车辆登记证。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1012': // 驾驶证账号
        data = [
          H5Config("ab", null, "驾驶证账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与当地车管所开通驾驶证业务合作。"),
          H5Config("a", null, "如何申请驾驶证？"),
          H5Config(
              "text", null, "1. 申请人提交《机动车驾驶证申请表》、身份证原件和复印件、驾驶体检证明、白底彩照8张。"),
          H5Config("text", null, "2. 认真学习、练车，参加完科目一、科目二、科目三的考试。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "1. 各地初次办理机动车驾驶证程序可能不尽一致，经验仅供参考。"),
          H5Config("text", null, "2. 建议你在参加驾驶员培训报名时，就要注意听教练讲解，不明白的地方询问清楚。"),
          H5Config("text", null, "3. 考试费用请具体咨询地方驾驶员培训学校。"),
          H5Config("a", null, "如何挂失/补办驾驶证？"),
          H5Config("text", null,
              "应及时的去当地车辆管理所向工作人员说明，并且领取一张申请补办驾驶证的表格。补办费用10元，一般3个工作日即可领取新证。"),
          H5Config("b", null, "注意："),
          H5Config("text", null,
              "1. 车管所补办驾驶证需要携带的证明：当事人身份证及其复印件、申请补办表格（车管所领取）、驾驶证所有人彩色一寸照两张。"),
          H5Config("text", null, "2. 在驾照补办期间，是不可以驾驶机动车的。"),
          H5Config("text", null, "3. 目前部分地区已经实现网上补办驾驶证，具体情况请咨询当地车辆管理所。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1013': // 支付宝账户
        data = [
          H5Config("ab", null, "支付宝账户"),
          H5Config("text", null, "目前益阳居民卡暂未与支付宝开通业务合作。"),
          H5Config("a", null, "支付宝主要功能"),
          H5Config("text", null, "1. 支持余额宝，理财收益随时查看；"),
          H5Config("text", null, "2. 支持各种场景关系，群聊群付更方便；"),
          H5Config("text", null, "3. 提供本地生活服务，买单打折尽享优惠；"),
          H5Config("text", null, "4. 为子女父母建立亲情账户；"),
          H5Config("text", null, "5. 随时随地查询淘宝账单、账户余额、物流信息；"),
          H5Config("text", null, "6. 免费异地跨行转账，信用卡还款、充值、缴水电煤气费；"),
          H5Config("text", null, "7. 还信用卡、付款、缴费、充话费、卡券信息智能提醒；"),
          H5Config(
              "text", null, "8. 行走捐，支持接入iPhone健康数据，可与好友一起健康行走及互动，还可以参与公益。"),
          H5Config("a", null, "如何注册支付宝账户？"),
          H5Config("text", null,
              "首先，打开支付宝的官方网站，注意不要打开钓鱼网站哦，要仔细的查看下再打开。然后设置账户名输入验证码，账户名一般是你的邮箱或者你的手机号，注册完点击下一步。点击立即查收邮件，进入邮箱登录界面。输入注册的邮箱账号和密码，点击进入。登录到邮箱中后可以查收邮件，看到一封支付宝的邮件，点击邮件中的完成注册网址，这就成功开通了支付宝。"),
          H5Config("a", null, "如何挂失支付宝账户？"),
          H5Config("text", null, "手机丢失或怀疑支付宝账号被盗，为防止风险发生，可以申请挂失支付宝账户。"),
          H5Config("b", null, "方法一：通过自己的手机支付宝挂失"),
          H5Config("text", null,
              "打开手机支付宝，点击右下角“我的”，然后点击右上角“设置”。进入“设置”页面后，点击“安全中心”选项进入“安全中心”页面后，点击左下角“挂失账号”会进入“快速挂失”页面。在“快速挂失”页面点击“立即挂失”即可完成挂失。"),
          H5Config("b", null, "方法二：借助他人的手机申请挂失"),
          H5Config("text", null,
              "打开他人手机支付宝，此时若别人支付宝处于登录状态，需要先退出登录。方法是在“设置”页面的底部找到并点击“退出登录”。再次点击“退出登录”即可进入初始登录页面。在初始登录页面点击底部的“更多”。然后点击“遇到问题”，再点击“快速挂失”。在“快速挂失”页面输入要挂失的账号，点击“立即挂失”，即可完成挂失。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "1. 当您挂失支付宝账户后，任何人无法操作您的账户，资金不能进出，挂失需谨慎！"),
          H5Config("text", null, "2. 本经验所用的手机支付宝为Android 10.0.20版。"),
          H5Config("text", null, "3. 苹果iOS手机的支付宝app操作大同小异。"),
          H5Config("a", null, "支付宝账户如何绑定银行卡？"),
          H5Config("text", null, "打开手机支付宝，进行登陆，进入支付宝主页之后，选择点击右下方的“我的”。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb01.png"),
          H5Config("text", null,
              "进入我的账户信息页面之后，点击中间的银行卡。注意这里“我的银行卡”下方的小数字是“1”，这说明现在这个支付宝账号下所绑定的银行卡只有一张。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb02.png"),
          H5Config("text", null,
              "进入到“我的银行卡”页面之后，可以看到现在已绑定的银行卡只有一张建设银行的储蓄卡。现在让我们点击右上角的“+”。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb03.png"),
          H5Config(
              "text", null, "然后就打开了“添加银行卡”页面，在这个页面输入你想绑定的银行卡号以及该银行卡的主人的名字。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb04.png"),
          H5Config("text", null,
              "输入无误之后点击下一步，就来到了填写银行卡信息的页面，一般来说该银行卡属于哪个银行会被自动识别出来，因此这一项不需要你亲自填写。你只需写上这张银行卡在银行的预留手机号即可。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb05.png"),
          H5Config("text", null,
              "输入无误之后点击下一步，这时你就来到了填写校验码的页面，同时系统会在1分钟之内给你的手机发送一条短信验证码，如果你在1分钟之内收到了验证码，就把它填入空白处。如果1分钟之内没收到，可以选择重新发送验证码。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb06.png"),
          H5Config("text", null, "输入正确的验证码之后，系统就会通知你添加银行卡成功。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb07.png"),
          H5Config("text", null, "这个时候返回银行卡页面可以看到除了一开始的建设银行卡之外又多了一张工商银行卡。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb08.png"),
          H5Config("text", null,
              "退回到账户信息页面，也可以看到“我的银行卡”下方的数字已经由“1”变成了“2”，说明已经成功绑定了新的银行卡。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_zfb09.png"),
          H5Config("text", null, ""),
        ];
        break;
      case '1014': // 微信支付账户
        data = [
          H5Config("ab", null, "微信账户"),
          H5Config("text", null, "目前益阳居民卡暂未与微信开通业务合作。"),
          H5Config("a", null, "如何注册微信？"),
          H5Config("text", null,
              "在登录页面点击【更多选项】，然后在弹出的窗口点击【注册】。输入手机号码，再点击【注册】。阅读隐私文件，然后点击【同意】，在【安全校验】页面点击【开始】，然后拖动拼图完成验证。注册成功之后可以点击【好】同步手机通讯录进入主页，也可以点击选择【了解更多】。"),
          H5Config("a", null, "如何绑定银行？"),
          H5Config("text", null,
              "首先打开微信软件，然后进入到【我】选项，就可以看到【我的银行卡】。然后进入到【我的银行卡】选项后，点击【添加银行】，填写支付密码和银行卡的持卡人姓名和卡号等信息，填写完成后点击【下一步】再次填写手机号码并再次点击【下一步】，最后需要绑定的一行卡需要短信确认，银行卡绑定的手机会收到一条验证码，填写好验证码后可以点击【下一步】，即可完成银行卡添加。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "微信可以添加多张银行卡。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1015': // 学历绑定
        data = [
          H5Config("ab", null, "学历账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与中国高等教育学生信息网开通业务合作。"),
          H5Config("a", null, "如何在网上查询学历？"),
          H5Config("text", null,
              "打开http://www.chsi.com.cn ，中国高等教育学生信息网(学信网)。点击“学籍学历查询”。点击“零散查询”，然后在新页面中填写“证书编号”，“姓名”，“查询码”，“验证码”。查询码需要付费获得，查询一个学历证书需要花费2元钱。可以选择网上支付或手机短信获取。点击“查询”，就可以看到查询证书的结果啦。"),
          H5Config("b", null, "注意："),
          H5Config("text", null,
              "1. 获取学历没有捷径，高等教育学历注册上网需要通过严格的资格审核和严密的工作程序，努力学习才是正道。"),
          H5Config("text", null, "2. 本方法仅供个人查询使用。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1016': // 咪咕娱乐账户
        data = [
          H5Config("ab", null, "咪咕账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与咪咕文化科技有限公司开通业务合作。"),
          H5Config("a", null, "咪咕介绍"),
          H5Config("text", null,
              "咪咕文化科技有限公司（简称“咪咕公司”）是中国移动面向移动互联网领域设立的，负责数字内容领域产品提供、运营、服务的一体化专业子公司，是中国移动旗下音乐、视频、阅读、游戏、动漫数字业务板块的唯一运营实体，下设咪咕音乐、咪咕视讯、咪咕数媒、咪咕互娱、咪咕动漫五个子公司。目前, 咪咕公司已成为国内领先的全场景品牌沉浸平台，汇聚超过2000万+首歌曲、460万条视频、1200+路音视频直播、50万+册书刊、3万+款游戏、47万集动漫画。面向未来，咪咕公司将大力探索“互联网+数字内容”运营创新，将内容孵化与渠道合作结合，着力开展跨领域IP运营，积极打造新媒体融合、数字内容聚合、版权交易、内容创业创新四大平台，致力于为用户带来文娱生活方式的改变。"),
          H5Config("a", null, "咪咕帐号的用途"),
          H5Config("text", null,
              "咪咕帐号是咪咕文化科技有限公司推出的帐号系统。使用咪咕帐号可畅行所有咪咕业务，包括咪咕音乐、咪咕视频、咪咕阅读、咪咕游戏、咪咕圈圈等。"),
          H5Config("a", null, "设置咪咕帐号的密码"),
          H5Config("text", null,
              "注册或升级咪咕帐号过程中您可以设置您的咪咕帐号密码。设置咪咕帐号密码后，原各业务的原密码失效，请使用咪咕帐号密码登录各业务。"),
          H5Config("a", null, "任何手机号码都可注册咪咕帐号"),
          H5Config("text", null, "咪咕帐号支持移动，联通，电信手机号码注册（需要能正常接收短信）。"),
          H5Config("a", null, "咪咕帐号可登录使用任何咪咕业务"),
          H5Config("text", null,
              "当您注册了咪咕帐号以后，原来在各业务的用户名密码自动作废。您只需记住咪咕帐号，即可登录咪咕各业务及服务。"),
          H5Config("a", null, "手机挂失操作"),
          H5Config("text", null,
              "您可以拨打10086转人工服务或者前往移动营业厅进行挂失操作。手机挂失后，您只能使用用户名（手机号码、邮箱）和密码的方式登录，咪咕帐号首页中的更换手机号码，使用手机重置密码等功能暂停使用。"),
          H5Config("a", null, "更改登录手机号"),
          H5Config(
              "text", null, "您可以在帐号页面更改登录的手机号码，更改前需要验证您的身份，您可以使用短信验证码这种验证方式。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1017': // 和飞信账户
        data = [
          H5Config("ab", null, "和飞信账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与和飞信账户开通业务合作。"),
          H5Config("a", null, "和飞信介绍"),
          H5Config("text", null,
              "和飞信是一款由中移互联网公司打造的基础通信服务软件及企业办公解决方案应用。和飞信升级“通话、消息、联系人”通信体验，实现在个人通信和企业办公间切换。一方面是面向个人的全新通信升级，另一方面是面向企业的办公及通信解决方案。"),
          H5Config("a", null, "如何注册和飞信？"),
          H5Config("text", null, "方法一："),
          H5Config("text", null, "短信办理：开通发送KTFX到10086或者发送KTFX到12520即可。"),
          H5Config("text", null, "方法二："),
          H5Config("text", null, "手机登录飞信官网，下载手机客户端，然后注册激活就可以使用。"),
          H5Config("b", null, "和飞信下载方式"),
          H5Config("text", null, "方法一："),
          H5Config("text", null, "在手机应用商店搜索和飞信进行下载安装，或点击下方按钮安装和飞信APP。"),
          H5Config("r", null, "安装和飞信APP"),
          H5Config("text", null, "方法二："),
          H5Config("text", null, "在PC端搜索下载安装和飞信。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1018': // 139邮箱账户
        data = [
          H5Config("ab", null, "139邮箱账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与139邮箱账户开通业务合作。"),
          H5Config("a", null, "139邮箱介绍"),
          H5Config("text", null,
              "139邮箱是为客户提供的新一代电子邮箱服务，在具备常规互联网基础邮件服务功能的同时，充分发挥和利用手机的移动性，让用户可以方便直接地通过短信、彩信或者手机上网等方式，随时随地收、看、发、转邮件。"),
          H5Config("text", null,
              "139邮箱打造移动体验最佳的电子邮箱。手机号码就是邮箱帐号，方便易记，也可设置别名帐号保护隐私；新邮件到达时通过多种方式提醒到手机，不错过任何重要邮件；每月话费账单准时投递到139邮箱内，让用户明明白白消费；下载安装PushEmail客户端后，可以随时随地在手机上收发和管理邮件，同时支持查看多种格式的附件！"),
          H5Config("a", null, "如何注册139邮箱账户？"),
          H5Config("b", null, "方法一：电脑方式（注册139邮箱的同时获得和通行证）"),
          H5Config("text", null,
              "1. 通过电脑登录139邮箱首页http://mail.10086.cn，点击登陆页面“注册”，弹出注册弹窗浮层；"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_139yx01.png"),
          H5Config("text", null,
              "2. 填写手机号。在注册弹窗浮层输入手机号码，点击“获取验证码”则会弹出图片验证码输入框，在图片验证码框输入下方展示的验证码，再次点击“获取验证码”并回填，然后勾选“我同意中国移动和通行证服务协议”（系统默认勾选，去掉勾选情况下需要重新勾选），点击“下一步”；"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_139yx02.png"),
          H5Config("text", null,
              "3. 设置密码。输入8-16位字符密码，并确认输入，点击“下一步”，完成注册完成注册后，页面会显示帐号信息（和通行证号、手机号码），可使用和通行证号及手机号码登录139邮箱。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_139yx03.png"),
          H5Config("b", null, "方法二：手机方式（开通139邮箱的同时获得和通行证）"),
          H5Config("text", null, "1. 手机登录mail.10086.cn，在邮箱登录页面点击“注册账号”"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_139yx04.png"),
          H5Config("text", null, "2. 进入和通行证用户管理中心的注册页面设置："),
          H5Config("text", null, "1）输入手机号；"),
          H5Config("text", null, "2）点击“获取验证码”则会弹出图片验证码输入框，在图片验证码框输入下方展示的验证码；"),
          H5Config("text", null, "3）再次点击“获取验证码”并回填；"),
          H5Config("text", null, "4）输入密码；"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_139yx05.png"),
          H5Config("text", null, "3. “同意服务协议并注册”，完成注册。"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "联通、电信客户也可以注册139邮箱，注册方式如下："),
          H5Config("text", null,
              "1. 电脑登录http://mail.10086.cn，点击登录页面“注册”，进入和通行证用户管理中心："),
          H5Config("text", null,
              "2. 填写手机号。在注册弹窗浮层输入手机号码，点击“获取验证码”则会弹出图片验证码输入框，在图片验证码框输入下方展示的验证码，再次点击“获取验证码”并回填，然后勾选“我同意中国移动和通行证服务协议”（系统默认勾选，去掉勾选情况下需要重新勾选），点击“下一步”； "),
          H5Config("text", null, "3. 设置密码。输入8-16位字符密码，并确认输入，点击“下一步”，完成注册。 "),
          H5Config("text", null, ""),
        ];
        break;
      case '1019': // 党员账户
        data = [
          H5Config("ab", null, "党费账户"),
          H5Config("text", null, "目前在益阳地区，益阳居民卡暂未与益阳市党委开通业务合作。"),
          H5Config("img", null, "assets/img/TiedCardAccount/tied_dy01.png"),
          H5Config("text", null,
              "中国共产党党员，简称中共党员、共产党员或党员，分为中国共产党正式党员和中国共产党预备（候补）党员，是指按照《中国共产党章程》规定的入党条件和程序被批准加入中国共产党的工人、农民、军人、知识分子和其他社会阶层的先进分子。截至2017年12月31日，中国共产党党员总数为8956.4万名。年满十八岁的中国工人、农民、军人、知识分子和其他社会阶层的先进分子，承认党的纲领和章程，愿意参加党的一个组织并在其中积极工作、执行党的决议和按期交纳党费的，可以申请加入中国共产党。"),
          H5Config("a", null, "党员性质"),
          H5Config("text", null, "中国共产党党员是中国工人阶级的有共产主义觉悟的先锋战士。"),
          H5Config("text", null, "中国共产党党员必须全心全意为人民服务，不惜牺牲个人的一切，为实现共产主义奋斗终身。"),
          H5Config("text", null,
              "中国共产党党员永远是劳动人民的普通一员。除了法律和政策规定范围内的个人利益和工作职权以外，所有共产党员都不得谋求任何私利和特权。"),
          H5Config("a", null, "入党程序"),
          H5Config("text", null, "发展党员，必须把政治标准放在首位，经过党的支部，坚持个别吸收的原则。"),
          H5Config("text", null,
              "申请入党的人，要填写入党志愿书，要有两名正式党员作介绍人，要经过支部大会通过和上级党组织批准，并且经过预备期的考察，才能成为正式党员。介绍人要认真了解申请人的思想、品质、经历和工作表现，向他解释党的纲领和党的章程，说明党员的条件、义务和权利，并向党组织作出负责的报告。"),
          H5Config("text", null,
              "党的支部委员会对申请入党的人，要注意征求党内外有关群众的意见，进行严格的审查，认为合格后再提交支部大会讨论。"),
          H5Config("text", null,
              "上级党组织在批准申请人入党以前，要派人同他谈话，作进一步的了解，并帮助他提高对党的认识。在特殊情况下，党的中央和省、自治区、直辖市委员会可以直接接收党员。	"),
          H5Config("b", null, "申请材料"),
          H5Config("text", null, "1. 入党申请书"),
          H5Config("text", null, "2. 入党积极分子培养考察登记表"),
          H5Config("text", null, "3. 团支部推优入党的推荐书"),
          H5Config("text", null, "4. 群众评议材料"),
          H5Config("text", null, "5. 党校结业证书复印件"),
          H5Config("text", null, "6. 思想汇报（至少5份）"),
          H5Config("text", null, "7. 父母证明材料"),
          H5Config("text", null, "8. 个人自传"),
          H5Config("text", null, "9. 党内民主评议的材料"),
          H5Config("text", null, "10. 入党志愿书"),
          H5Config("b", null, "转正材料"),
          H5Config("text", null, "1. 半年鉴定表"),
          H5Config("text", null, "2. 转正申请书"),
          H5Config("text", null, "3. 自我鉴定（预备党员对自己在预备期内个人思想、学习、工作等方面的自我评价）"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "以上材料须用黑色墨水或蓝黑色墨水书写，不得打印。"),
          H5Config("a", null, "注意事项"),
          H5Config("b", null, "入党申请书"),
          H5Config("text", null, "入党申请书的内容主要包括四点："),
          H5Config("text", null, "1. 对党的认识"),
          H5Config("text", null, "2. 个人申请入党的动机、目的"),
          H5Config("text", null, "3. 对自我的现有认识"),
          H5Config("text", null, "4. 表决心，即为向党组织靠拢个人的打算"),
          H5Config("b", null, "注意："),
          H5Config("text", null, "1. 入党申请书须用黑色墨水或蓝黑色墨水手写"),
          H5Config("text", null, "2. 第一次写入党申请书要表明个人身份，最好附上个人简历"),
          H5Config("b", null, "思想汇报"),
          H5Config("text", null,
              "思想汇报是对个人某一段时间内思想、学习、工作、生活情况的总结。入党积极分子可以结合自身经历谈对党的认识；也可以结合当前国际形势、当前政治热点问题，运用一定的政治理论阐述个人的观点；也可以谈个人学习政治理论和有关文件的心得体会。思想汇报须是个人思想观点的反映，切忌照搬报刊文章。注意：思想汇报须用黑色墨水或蓝黑色墨水手写。"),
          H5Config("b", null, "培养考察登记表"),
          H5Config("text", null, "填写注意事项："),
          H5Config("text", null, "1. 列为培养对象的时间与入党的时间之间应有一年左右的间隔。"),
          H5Config("text", null, "2. 培养考察情况是半年左右的时间考察一次，因此，两次考察日期间隔一般为六个月左右。"),
          H5Config("text", null,
              "3. 培养考察情况要能客观真实地反映出培养对象的情况。联系人应尽可能的写清楚其表现情况，在填写时主要从优点和缺点两部分来谈。第二次的考察情况应该能反映出培养对象针对存在的个人不足已有所改正，或在原有的基础上有所进步。"),
          H5Config("text", null, "4. 联系人一般为两个，一般情况下联系人就是入党介绍人。"),
          H5Config("text", null, "5. 拟发展意见填写时，首先对培养对象作全面的评价，然后再给出党支部拟发展的意见。"),
          H5Config("b", null, "入党志愿书"),
          H5Config("text", null, "1. 入党志愿书的内容包括："),
          H5Config("text", null, "1）对党的认识。"),
          H5Config("text", null,
              "2）入党的目的、决心、打算 入党志愿书填写时注意：无需加抬头，直接写“我志愿加入中国共产党”这句话，独立成段，入党宣誓的誓言可随其后，也可以放在文尾。文尾不用签名，另有签名栏。"),
          H5Config("text", null, "2. 入党介绍人意见 介绍人意见应全面真实，介绍人签名、日期须填写清楚。"),
          H5Config("text", null,
              "3. 支部大会的决议 首先对预备党员作全面评价，最后写明支部大会的表决意见。在填写表决意见时，应写明：“应到党员多少人、实到多少人，其中正式党员多少人，经举手表决多少人同意该同志加入中国共产党。"),
          H5Config("text", null,
              "4. 谈话意见 开始应表明：“受新闻学院党总支指派，与某某同学谈话，谈话情况如下” 谈话内容可以分问题填写，也可以综述谈话内容，内容须是针对谈话，而不是个人平时表现的概述。"),
          H5Config("b", null, "个人自传内容"),
          H5Config("text", null, "1. 个人介绍。格式为“自传人：某某，性别，出生年月，籍贯，家庭出身，本人成分。”"),
          H5Config("text", null,
              "2. 个人经历。其中须包括个人思想发展状况，在大事件中个人政治立场。 预备党员的发展工作 发展党员是党支部的一项经常性的重要工作，是基层党组织的基本任务之一，在高等学校做好学生党员的发展工作，对于加强党的建设有着重要的意义。党支部要严格按照“坚持标准，保证质量，改善结构，慎重发展”的方针，有计划、有步骤地做好学生党员的发展工作。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1020':
        data = [];
        break;
      case '1021': // 居民卡VIP用户账户
        data = [
          H5Config("ab", null, "居民卡VIP用户账户"),
          H5Config("text", null,
              "益阳居民卡用户可以通过购买开通“居民卡VIP用户”服务，“居民卡VIP用户”服务购买价格为居民卡移动消费券1000点/年（1250点移动积分）。购买后服务将绑定智慧益阳APP您当前登录的居民卡账户。"),
          H5Config("a", null, "一、购买“居民卡VIP用户”仅需3步"),
          H5Config("b", null, "第一步：移动积分余额查询"),
          H5Config("text", null,
              "移动用户通过点击下方“一键查询移动积分余额”按钮或编辑短信“JF”发送到10086，查询移动积分余额。"),
          H5Config("r", null, "一键查询移动积分余额"),
          H5Config("b", null, "第二步：一键兑换移动消费券"),
          H5Config("text", null,
              "点击“一键兑换移动消费券”按钮或编辑短信DH236984发送到10658999，使用1250点移动积分兑换“1000点居民卡移动消费券”。"),
          H5Config("r", null, "一键兑换移动消费券"),
          H5Config("b", null, "第三步：购买居民卡VIP用户"),
          H5Config("text", null,
              "点击下方“购买居民卡VIP用户”按钮，使用1000点居民卡移动消费券购买“居民卡VIP用户”服务。"),
          H5Config("r", null, "购买居民卡VIP用户"),
          H5Config("a", null, "二、“居民卡VIP用户”服务权益"),
          H5Config("text", null, "权益一：免费使用智慧益阳APP提供的公共缴费服务和全部缴费支付方式。"),
          H5Config("text", null, "权益二：使用第三方支付方式（微信支付、支付宝）在智慧益阳APP进行缴费时免除服务费。"),
          H5Config("text", null, "更多权益陆续增加中，敬请期待。"),
          H5Config("a", null, "三、法律声明"),
          H5Config("text", null, "1. 益阳居民卡运营服务有限公司有权变更“居民卡VIP用户”权益。"),
          H5Config("text", null,
              "2. “居民卡VIP用户”权益发生变更时，益阳居民卡运营服务有限公司将通过智慧益阳APP发布权益变更公告。"),
          H5Config("text", null, "3. 益阳居民卡运营服务有限公司具有对“居民卡VIP用户”权益及服务享有最终解释权。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1022': // 公积金账户
        data = [
          H5Config(
              "text", null, "益阳居民卡用户可以在APP和“一公里便民服务网点”商户处的商户终端，办理公积金查询业务。"),
          H5Config("r", null, "办理个人公积金查询"),
          H5Config("ab", null, "住房公积金缴存须知"),
          H5Config("b", null, "一、缴存对象"),
          H5Config("text", null,
              "国家机关、国有企业、城镇集体企业、外商投资企业、城镇私营企业及其他城镇企业、事业单位、民办非企业单位、社会团体（以下统称单位）及其在职职工。"),
          H5Config("text", null, "城镇个体工商户、自由职业人员和进城务工人员也可申请缴存住房公积金。"),
          H5Config("b", null, "二、缴存比例和基数"),
          H5Config("text", null,
              "1、缴存基数：为职工本人上一年度月平均工资。月平均工资由计时工资、计件工资、奖金、津贴和补贴、加班加点工资和特殊情况下支付的工资组成，这六个部分无论以货币或实物形式支付给职工的，都应计入职工工资总额。单位和职工缴存住房公积金的月工资基数，最高不得高于全市职工月平均工资的3倍。"),
          H5Config(
              "text", null, "2、缴存比例：我市住房公积金最低缴存比例为单位和职工各5%，最高缴存比例为单位和职工各12%。"),
          H5Config(
              "text", null, "3、住房公积金缴存计算公式：住房公积金月缴存额=上年度月平均工资基数×缴存比例+单位等额缴存部分"),
          H5Config("text", null,
              "4、缴存金额：我市对住房公积金缴存实行限高保低政策，最高缴存额和最低缴存额以每年度住房公积金中心向社会发布的标准为准。"),
          H5Config("b", null, "三、缴存程序"),
          H5Config("text", null, "1、缴存登记：单位到住房公积金管理中心（以下简称中心）办理住房公积金缴存登记。"),
          H5Config("text", null, "2、银行开户：单位经中心审核后，到受委托银行为职工办理住房公积金帐户设立手续。"),
          H5Config("text", null,
              "3、按月缴存：住房公积金应按月缴存。职工个人缴存的住房公积金，由所在单位每月从其工资中代扣代缴；单位应于每月发放职工工资之日起5日内将单位缴存和为职工代缴的住房公积金汇缴到住房公积金专户内，由受委托银行计入职工住房公积金帐户。"),
          H5Config("text", null, "4、城镇个体工商户、自由职业人员和进城务工人员参照上述程序缴存。"),
          H5Config("b", null, "四、住房公积金联名卡的领取和发放"),
          H5Config("text", null,
              "单位和职工缴存的住房公积金存入职工住房公积金帐户后，受委托银行向职工发放《住房公积金联名卡》。单位汇缴的，由单位经办人员统一领取并及时发放给职工，以便于职工查询和办理提取、贷款等手续；城镇个体工商户、自由职业人员和进城务工人员缴存住房公积金，直接在受委托银行领取联名卡。"),
          H5Config("b", null, "五、转移和封存"),
          H5Config("text", null,
              "1、单位合并、分立、撤销、解散或者破产的，应当自发生上述情况之日起30日内由原单位或者清算组织到中心办理变更登记或注销登记，并自办妥变更登记或者注销登记之日起20日内持中心的审核文件，到受委托银行为本单位职工办理住房公积金帐户转移或者封存手续。"),
          H5Config("text", null,
              "2、单位与职工终止劳动关系的，单位应当自劳动关系终止之日起30日内到中心办理变更登记，并持中心的审核文件，到受委托银行办理职工住房公积金帐户转移或者封存手续。"),
          H5Config("text", null, ""),
        ];
        break;
      case '1023':
        data = [];
        break;
      case '1024': // 医疗保险账户
        data = [
          H5Config(
              "text", null, "益阳居民卡用户可以在APP和“一公里便民服务网点”商户处的商户终端，办理个人和企业医保查询业务。"),
          H5Config("r", null, "办理个人医保查询"),
          H5Config("r", null, "办理企业医保查询"),
          H5Config("ab", null, "城镇职工基本医疗保险"),
          H5Config("b", null, "（一）基本政策"),
          H5Config("text", null,
              "1、针对人群：城镇所有用人单位，包括企业、机关、事业单位、社会团体、民办非企业单位、民营企业、个体经济等从业人员。"),
          H5Config("text", null,
              "2、缴费基数：以上年度本单位平均工资总额为基数，用人单位职工年平均工资高于全市上年度全部职工年平均工资300%以上部分不作缴费基数，低于平均工资的和以灵活就业人员身份参保的，按全市上年度全部职工平均工资为基数。"),
          H5Config("text", null,
              "3、缴费比例：医疗保险费由单位缴费和个人缴费相结合，单位缴费比例6%，个人缴费2%。不建个人帐户的灵活就业人员，缴费比例为5%。"),
          H5Config("b", null, "（二）参保流程"),
          H5Config("text", null,
              "1、用人单位：单位出具参加医疗工伤生育保险的申请、营业执照（法人证书）、机构代码证和银行开户许可证的原件和复印件、参保职工花名册、上年度财务决算报表和最近一个月工资发放表的复印件。经办机构确认符合政策并实地核实单位人数和缴费基数后，即可缴费参保。"),
          H5Config("text", null,
              "2、灵活就业人员：城镇灵活就业人员携带证明本人身份的相关有效证件（附复印件）到医保经办机构填报《城镇灵活就业人员参加医疗保险登记表》，即可缴费参保。"),
          H5Config("text", null, ""),
        ];
    }

    List<Widget> dataC = List();
    dataC
      ..add(Divider(height: 1.0))
      ..add(Padding(
        padding: EdgeInsets.only(top: AppSize.ufp875, bottom: AppSize.ufp875),
        child: Text(
          "使用说明",
          style: TextStyle(fontSize: AppSize.ufp875),
        ),
      ));
    for (var i = 0; i < data.length; i++) {
      if (data[i].abtr == "ab") {
        dataC..add(Text("${data[i].text}", style: abstyle));
      } else if (data[i].abtr == "a") {
        dataC..add(Text("${data[i].text}", style: astyle));
      } else if (data[i].abtr == "b") {
        dataC..add(Text("         ${data[i].text}", style: bstyle));
      } else if (data[i].abtr == "text") {
        dataC..add(Text("         ${data[i].text}", style: tstyle));
      } else if (data[i].abtr == "r") {
        dataC
          ..add(Center(
              child: Padding(
            padding: EdgeInsets.only(top: mt20, bottom: mt20),
            child: RaisedButton(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: AppColors.themeColor,
              child: Text(
                "${data[i].text}",
                style: rstyle,
              ),
              onPressed: () {
                getFun(data[i].text);
              },
            ),
          )));
      } else if (data[i].abtr == "img") {
        dataC
          ..add(Padding(
              padding: EdgeInsets.only(bottom: AppSize.upp375),
              child: Image.asset("${data[i].text}")));
      }
    }
    return dataC;
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return Container(
        color: AppColors.twhite,
        margin: EdgeInsets.only(top: 9.0),
        padding: EdgeInsets.only(left: AppSize.upp875, right: AppSize.upp875),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: getHTML5(),
        ));
  }
}
