import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

///  child, Widget组件
///  onRefresh, 下拉刷新方法
///  loadMore, 上滑加载更多方法
///  bool firstRefresh, 是否自动执行一次下拉刷新方法
Widget easyRefresh(
  child,
  onRefresh,
  loadMore,
  bool firstRefresh,
) {
  return Center(
      child: new EasyRefresh(
    key: _easyRefreshKey,
    autoLoad: true,
    firstRefresh: firstRefresh,
    child: child,
    onRefresh: onRefresh,
    loadMore: loadMore,
    behavior: RefreshBehavior(showLeading: true, showTrailing: true),
    refreshHeader: ClassicsHeader(
      key: _headerKey,
      refreshText: ("pullToRefresh"),
      refreshReadyText: ("releaseToRefresh"),
      refreshingText: ("refreshing") + "...",
      refreshedText: ("refreshed"),
      moreInfo: ("updateAt"),
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.black54,
      showMore: true,
    ),
    refreshFooter: ClassicsFooter(
      key: _footerKey,
      loadText: ("pushToLoad"),
      loadReadyText: ("releaseToLoad"),
      loadingText: ("loading"),
      loadedText: ("loaded"),
      noMoreText: ("noMore"),
      moreInfo: ("updateAt"),
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.black54,
      showMore: true,
    ),
  ));
}
