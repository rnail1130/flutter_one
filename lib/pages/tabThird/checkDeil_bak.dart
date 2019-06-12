import 'package:flutter/material.dart';
import 'package:dropdown_menu/dropdown_menu.dart';
class checkDeil extends StatefulWidget {
  @override
  _checkDeilState createState() => _checkDeilState();
}
const List<Map<String, dynamic>> TYPES = [
  {"title": "全部", "id": 0},
  {"title": "城市钱包", "id": 1},
  {"title": "商户点卡", "id": 2},
  {"title": "商户积分", "id": 3},
  {"title": "移动消费券", "id": 4},

];
class _checkDeilState extends State<checkDeil> {
  ScrollController scrollController;
  GlobalKey globalKey;
  @override
  void initState() {
    scrollController = new ScrollController();
    globalKey = new GlobalKey();
    super.initState();
  }
  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: ["全部"],
    );
  }
  Widget buildInnerListHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
          print(
              "menuIndex:$menuIndex index:$index subIndex:$subIndex data:$data");
        },
        child: new Stack(
          children: <Widget>[
            new CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  new SliverList(
                      key: globalKey,
                      delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return new Container(
                              color: Colors.black26,
                            );
                          }, childCount: 1)),
                  new SliverPersistentHeader(
                    delegate: new DropdownSliverChildBuilderDelegate(
                        builder: (BuildContext context) {
                          return new Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: buildDropdownHeader(onTap: this._onTapHead));
                        }),
                    pinned: true,
                    floating: true,
                  ),
                  new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return new Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Text('2123132123')
                            );
                          }, childCount: 100)),
                ]),
            new Padding(
                padding: new EdgeInsets.only(top: 46.0),
                child: buildDropdownMenu())
          ],
        ));
  }
  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
      menus: [
        new DropdownMenuBuilder(
            builder: (BuildContext context) {
              return new DropdownListMenu(
                selectedIndex: 0,
                data: TYPES,
                itemBuilder: buildCheckItem,
              );
            },
            height: kDropdownMenuItemHeight * TYPES.length),
      ],
    );
  }
  void _onTapHead(int index) {
    RenderObject renderObject = globalKey.currentContext.findRenderObject();
    DropdownMenuController controller =
    DefaultDropdownMenuController.of(globalKey.currentContext);
    //
    scrollController
        .animateTo(scrollController.offset + renderObject.semanticBounds.height,
        duration: new Duration(milliseconds: 150), curve: Curves.ease)
        .whenComplete(() {
      controller.show(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          child: Text('1212'),
        ),
        buildInnerListHeaderDropdownMenu(),
      ],
    );
  }
}
