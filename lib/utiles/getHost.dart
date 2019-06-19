import 'config.dart';

class hostAddres {
  static const Weathers = "/Index.aspx/Weather"; //
  static const LocalMessage = "/Index.aspx/LatestNews";
  static const NewMessage = "/Index.aspx/HotNewsList";
  static const Deatil = "/Article.aspx/FindArticle";
  static const GetBusinessList = "/BindCardAccount.aspx/GetBusinessList";
  static const GetCardAccountsDetail =
      "/BindCardAccount.aspx/GetCardAccountsDetail";
  static const GetPhoneIP = "/BindCardAccount.aspx/GetPhoneIP";
  static const GetNewLogin = "/Member.aspx/NewLogin";
  static const GetAllTickets = "/TicketPackages.aspx/GetAllTickets";
  static const GetMobleCouponInfo =
      "/MobileIntegration.aspx/GetMobleCouponInfo";
  static const GetMyTickets = "/TicketPackages.aspx/GetMyRecordsInfo";
  static const GetTicketDetailInfo = "/TicketPackages.aspx/GetTicketDetailInfo";
  static const GetPaymentAccountList = "/PaymentAccount.aspx/GetBusinessList";
  static const GetUserCheck = "/Member.aspx/NewLogin";
  static const GetCode = "/Member.aspx/SendMsg";
  static const GetNewCode = "/Member.aspx/NewSendMsg";
  static const GetConsumePoints = "/BindCardAccount.aspx/GetConsumePoints";
  static const SendConsumeValidCode = "/BindCardAccount.aspx/SendConsumeValidCode";
  static const GetLandScapeList = "/Index.aspx/LandScapeList";

  static const GetRegister = "/Member.aspx/RegisterNew";
  static const GetFindPassword = "/Member.aspx/FindPasswordMegValid";
  static const GetFindPasswordFinal = "/Member.aspx/UpdatePassword";

  static const MerchantsApply = "/Member.aspx/MerchantsApply";
  static const GetUpdatePassword = "/Member.aspx/UpdatePassword";
  static const GetUpdateEmail = "/PersonCenter.aspx/BindInformation";
  static const GetGoverment = "/Government.aspx/FindGovMatters";
  static const Getzhuti = "/Government.aspx/FindGovClassifycation";
  static const Getxiangqing = "/Government.aspx/FindGovMatters";


  ///获取天气的接口
  static getWeatherUrl() {
    return config.API_VER + Weathers;
  }

  //获取地方资讯的接口
  static getLocalMessageUrl() {
    return config.API_VER + LocalMessage;
  }

  //获取最新消息的接口
  static getNewMessageUrl() {
    return config.API_VER + NewMessage;
  }

  //获取文章的详细内容接口
  static getDeatilUrl() {
    return config.API_VER + Deatil;
  }

  ///获取绑卡账户列表的接口
  static getBusinessList() {
    return config.API_VER + GetBusinessList;
  }

  ///获取绑卡账户详情的接口
  static getBusinessDetail() {
    return config.API_VER + GetCardAccountsDetail;
  }

  ///获取绑卡账户详情手机ip地址的接口
  static getBusinessPhoneIP() {
    return config.API_VER + GetPhoneIP;
  }

  ///获取登录的接口地址
  static getNewLogin() {
    return config.API_VER + GetNewLogin;
  }

  ///票券卡包 index页面列表“All”
  static getAllTicketsApi() {
    return config.API_VER + GetAllTickets;
  }
  ///票券卡包 index页面列表“Moble”
  static getMobleCouponInfoApi() {
    return config.API_VER + GetMobleCouponInfo;
  }

  ///票券卡包 订单记录 - 历史记录
  static getMyTicketsApi() {
    return config.API_VER + GetMyTickets;
  }

  ///票券卡包 详情
  static getTicketDetailInfoApi() {
    return config.API_VER + GetTicketDetailInfo;
  }

  /// 缴费账户-列表
  static getPaymentAccountList() {
    return config.API_VER + GetPaymentAccountList;
  }

  ///用户登陆
  static getLoginUrl() {
    return config.API_VER + GetUserCheck;
  }

  ///获取验证码
  static getCodeUrl() {
    return config.API_VER + GetCode;
  }
  ///获取注册验证码
  static getNewCodeUrl() {
    return config.API_VER + GetNewCode;
  }
  ///获取注册接口
  static getRegistUrl() {
    return config.API_VER + GetRegister;
  }
  ///获取找回密码验证
  static getFindPasswordUrl() {
    return config.API_VER + GetFindPassword;
  }
  ///修改密码
  static getEditPasswordUrl() {
    return config.API_VER + GetFindPasswordFinal;
  }
  ///修改智慧益阳app密码
  static getUpPasswordUrl() {
    return config.API_VER + GetUpdatePassword;
  }
  ///修改邮箱
  static getUpEmialUrl() {
    return config.API_VER + GetUpdateEmail;
  }
  /// 购买VIP账户
  static getConsumePoints() {
    return config.API_VER + GetConsumePoints;
  }
  /// 获取购买VIP账户的验证码
  static sendConsumeValidCode() {
    return config.API_VER + SendConsumeValidCode;
  }

  /// 多彩益阳
  static getLandScapeListApi() {
    return config.API_VER + GetLandScapeList;
  }
  /// 申请加入
  static getMerchantsApply() {
    return config.API_VER + MerchantsApply;
  }
  /// 获取政务查询列表
  static getGovermentUrl() {
    return config.API_VER + GetGoverment;
  }
  /// 获取个人办事
  static getGerenbanshiUrl() {
    return config.API_VER + Getzhuti;
  }
  /// 获取个人办事详情
  static getMattersUrl() {
    return config.API_VER + Getxiangqing;
  }
}
