import 'package:fish_redux/fish_redux.dart';

import '../../mock.dart';
import 'component/state.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:flutter/material.dart';
class RecommendState implements Cloneable<RecommendState> {
  List<ItemState> itemStates;
  final double itemSeparated = 12;

  bool loadMore = true;
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> footKey = GlobalKey<RefreshFooterState>();

  //_itemGlobalKeyList记录当前位置的key，方便根据key查到item widget
  //_focuseIndex获取焦点的下标
  List<GlobalKey> itemGlobalKeyList = List<GlobalKey>();
  int firstItemIndex = 1;

  //_initRootY是否初始化了root布局相对屏幕的坐标
  //_rootTop,_rootBottom记录root布局相对屏幕的坐标y轴top和bottom的坐标
  bool initRootY = false;
  double rootTop = 0;
  double rootBottom = 0;
  @override
  RecommendState clone() {
    return RecommendState()..itemStates = itemStates;
  }
}

RecommendState initState(Map<String, dynamic> args) {
  final List<ItemState> states = List<ItemState>();
  RecommendData.initData.forEach((data){
    ItemState state = ItemState(title:data["title"],userAvatarPath: data["userAvatarPath"],userName: data["userName"],
    userPortrait: data["userPortrait"],content: data["content"],agreeNum: data["agreeNum"],commentNum: data["commentNum"],
    videoPath: data["videoPath"],picPath: data["picPath"]);
    states.add(state);
  });

  return RecommendState()..itemStates = states
  ..initRootY = false
  ..rootTop = 0
  ..rootBottom = 0
  ;
}

