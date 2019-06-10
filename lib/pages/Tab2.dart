import 'package:flutter/material.dart';
import 'package:phone_yiyang/styles/colors.dart';
import 'package:phone_yiyang/utiles/LocalStorage.dart';
import 'package:phone_yiyang/utiles/data_config.dart';

import 'index.dart';

class thirdTabs extends StatelessWidget {
  Widget buildListData(BuildContext context, String strItem, Icon iconItem) {
    return new ListTile(
      isThreeLine: false,
      leading: iconItem,
      title: new Text(strItem),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text(
                'ListViewDemo',
                style: new TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              content: new Text('您选择的item内容为:$strItem'),
            );
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.themeColorLight,Theme.of(context).primaryColor],
                  begin: Alignment.topLeft
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage("http://60.247.61.162:8020/UploadFiles/HeaderImgs/temp_1554116484560.jpg",),
                  ),
                  SizedBox(height: 25.0,),
                  Text("卡号：21354563215465132456",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: Colors.grey[100],
            ),
          buildListData(context,"121231",Icon(Icons.android)),
          Divider(),
          buildListData(context,"121231",Icon(Icons.android)),
        Divider(),
        buildListData(context,"121231",Icon(Icons.android)),
        Divider(),
        buildListData(context,"121231",Icon(Icons.android)),
        Divider(),
      ],
    );
  }
}
class userList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Text('2212'),
    );
  }
}
class thirdTab extends StatelessWidget {
  List<List<String>> userList = DataConfig.userList;
  var titleStyle = TextStyle(fontSize: 16.0,color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: Center(
            child: ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: userList.length,
            ),
          )),
    );
  }
  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        centerTitle: true,    //标题居中
        expandedHeight: 180.0,  //展开高度200
        floating: false,  //不随着滑动隐藏标题
        pinned: true,    //固定在顶部
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.white,), onPressed: (){
            LocalStorage.remove('username');
            Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>BottomNav() ), (Route<dynamic> rout)=>false);
          })
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('高渐离',style: titleStyle,),
          background:Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.themeColorLight,Theme.of(context).primaryColor],
                    begin: Alignment.topLeft
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage("http://60.247.61.162:8020/UploadFiles/HeaderImgs/temp_1554116484560.jpg",),
                ),
                SizedBox(height: 25.0,),
                Text("卡号：21354563215465132456",style: TextStyle(color: Colors.white,fontSize: 16.0),),
              ],
            ),
          ),
        ),
      )
    ];
  }

  Widget _itemBuilder(BuildContext context, int index) {
   // if (index.isEven) return new Divider();
    return ListTile(
      dense: true,
      leading: Image.asset(userList[index][1],width: 25.0,),
      title: Text(userList[index][0],style: TextStyle(fontSize: 14.0),),
      trailing: Icon(Icons.chevron_right),
      onTap: (){},
    );
  }
}

