import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabFrist/tab_first_body_topPart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:phone_yiyang/styles/colorZ.dart';
import 'package:phone_yiyang/utiles/data_config.dart';
import 'package:phone_yiyang/utiles/net/api.dart';
import 'CreateWidget.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextStyle font1 = TextStyle(fontSize:12.0,color: Color(0xFF0076CB));
  TextStyle font2 = TextStyle(fontSize: 12.0);
/*  Future<Null> _onRefresh() async {
    buids();
    await Future.delayed(Duration(seconds: 1), () {

    });
  }*/
  Widget bilrs(String str){
    return InkWell(
      onTap: (){print(2123);},
      child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            image: DecorationImage(
                image: AssetImage("assets/images/index/newNewsBgc.png")
            ),
          ),

          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Text('最新消息：',style: font1,)
              ),
              Flexible(
                  child: Text(str,style: font2,overflow: TextOverflow.ellipsis,)
              ),
            ],
          )

      ),
    );
  }
  var _futureBuilderFuture;
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
        return Center(
          child: Text(HttpManager.loading,style: AppContent.moreMinText,),
        );
      case ConnectionState.done://请求成功
      if(snapshot.data == null){
        return bilrs("");
      }
        Map NewMap = snapshot.data;
        return bilrs(NewMap["d"]["Result"][0]["Title"]);

      default:
        return null;
    }
  }
  Widget buids (){
    return FutureBuilder(
      builder: _buildFuture,
      future:  _futureBuilderFuture,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureBuilderFuture = getPageData.getdata();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //最新消息
        buids(),
        //轮播图
        sliders(),
        //topone
        TopPart(),
        //Content
        CreateWidget(DataConfig.middleData,data_list: DataConfig.middleData_list,),//居民卡服务
        Container(
          height: 10.0,
          color: Colors.grey[100],
        ),
        CreateWidget(DataConfig.difangData,data_list: DataConfig.difangData_list,),//公共缴费服务
        Container(
          height: 10.0,
          color: Colors.grey[100],
        ),
        CreateWidget(DataConfig.gonggjfeiData,data_list: DataConfig.gonggjfeiData_list,),//地方商业服务
        Container(
          height: 10.0,
          color: Colors.grey[100],
        ),
        CreateWidget(DataConfig.wuyuanData,data_list: DataConfig.wuyuanData_list,),//益阳居民卡
        Container(
          height: 10.0,
          color: Colors.grey[100],
        ),
        CreateWidget(DataConfig.shiyuData),//多彩益阳
      ],
    );
  }
  Widget sliders (){
    Widget content;
    content =  Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 1,
/*          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),*/
          loop: false,
          scrollDirection: Axis.vertical,
          autoplay: false,
          onTap: (index) => print('点击了第$index个'),
        ));
    return content;
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://60.247.61.162:8019/Upload/Images/ModelImages/Img-20190419173341.jpg",
      fit: BoxFit.fill,
    ));
  }
}
//页面获取数据
class getPageData {
  static getdata () async {
    var res = await httpManager.netFetch(hostAddres.getNewMessageUrl(),{"pageIndex":1}, null,  null);
    Map NewMap = json.decode(res.data.toString());
    return NewMap;
  }
}