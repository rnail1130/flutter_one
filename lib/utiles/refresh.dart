import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:phone_yiyang/styles/colors.dart';

var str = "Key" + Random().nextInt(10).toString();
GlobalKey<EasyRefreshState> _easyRefreshKey =
    new GlobalKey<EasyRefreshState>(debugLabel: str);
GlobalKey<RefreshHeaderState> _headerKey =
    new GlobalKey<RefreshHeaderState>(debugLabel: str);
GlobalKey<RefreshFooterState> _footerKey =
    new GlobalKey<RefreshFooterState>(debugLabel: str);

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
  print(str);
  return Center(
      child: new EasyRefresh(
    key: _easyRefreshKey,
    autoLoad: true,
    firstRefresh: firstRefresh,
    child: child,
    onRefresh: onRefresh,
    loadMore: loadMore,
    behavior: RefreshBehavior(showLeading: true, showTrailing: true),
    refreshHeader: MaterialHeader(
      backgroundColor: AppColors.themeColor,
      key: _headerKey,
    ),
    refreshFooter: MaterialFooter(
      displacement: 20.0,
      backgroundColor: AppColors.themeColor,
      key: _footerKey,
    ),
  ));
}
