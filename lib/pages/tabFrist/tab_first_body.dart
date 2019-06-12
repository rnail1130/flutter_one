import 'package:flutter/material.dart';
import 'package:phone_yiyang/pages/tabFrist/tab_first_body_topPart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:phone_yiyang/utiles/data_config.dart';
import 'CreateWidget.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextStyle font1 = TextStyle(fontSize:12.0,color: Color(0xFF0076CB));
  TextStyle font2 = TextStyle(fontSize: 12.0);
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
     // backgroundColor: Colors.blue[500],
      onRefresh: _onRefresh,
      child: ListView(
        children: <Widget>[
          //最新消息
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/images/index/newNewsBgc.png")
              ),
            ),

            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("最新消息：",style: font1,),
                  Text("智慧益阳APP全新发布 五大核心功能板块",style: font2,),
                ],
              ),
            ),
          ),
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
      )
    );
  }
  Widget sliders (){
    Widget content;
    content =  Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
          scrollDirection: Axis.horizontal,
          autoplay: true,
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
