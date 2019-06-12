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
  static const GetMyTickets = "/TicketPackages.aspx/GetMyRecordsInfo";
  static const GetTicketDetailInfo = "/TicketPackages.aspx/GetTicketDetailInfo";
  static const GetPaymentAccountList = "/PaymentAccount.aspx/GetBusinessList";

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
}
