import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:phone_yiyang/styles/colors.dart';

///  child, Widget组件
///  _easyRefreshKey, 创建 GlobalKey<EasyRefreshState>(debugLabel: “唯三字符串” ); 对象传
///   _headerKey, 创建 GlobalKey<RefreshHeaderState>(debugLabel: “唯三字符串” ); 对象传
///   _footerKey, 创建 GlobalKey<RefreshFooterState>(debugLabel: “唯三字符串” ); 对象传
///  onRefresh, 下拉刷新方法
///  loadMore, 上滑加载更多方法
///  bool firstRefresh, 是否自动执行一次下拉刷新方法
/// 多个下拉刷新组件是调用 setdebugLabelKey 方法创建新的组件
/// .触发刷新和加载动作
/// _easyRefreshKey.currentState.callRefresh();
/// _easyRefreshKey.currentState.callLoadMore();
///
Widget easyRefresh(
  _easyRefreshKey,
  _headerKey,
  _footerKey,
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

    refreshHeader: BallPulseHeader(
      key: _headerKey,
    ),
    refreshFooter: BallPulseFooter(
      key: _footerKey,
    ),
    
    // refreshHeader: MaterialHeader(
    //   key: _headerKey,
    // ),
    // refreshFooter: MaterialFooter(
    //   displacement: 20.0,
    //   key: _footerKey,
    // ),
  
  ));
}
