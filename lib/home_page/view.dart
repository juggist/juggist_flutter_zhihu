import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_flutter/home_page/recommend_module/page.dart';

import 'state.dart';
import 'package:zhihu_flutter/global_config.dart';

Widget buildView(
    HomeIndexState state, Dispatch dispatch, ViewService viewService) {
  MediaQueryData _mediaQueryData = MediaQuery.of(viewService.context);

  AppBar _appBar = AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    title: viewService.buildComponent("search"),
    bottom: TabBar(
      tabs: [
        Tab(
          text: "关注",
        ),
        Tab(
          text: "推荐",
        ),
        Tab(
          text: "热榜",
        )
      ],
      indicatorColor: GlobalColors.fontBlackColor,
      indicatorWeight: 2 /*高度*/,
      indicatorSize:
          TabBarIndicatorSize.label /*label:与label长度一致，tab:与tab长度一致*/,
      labelStyle: TextStyle(fontSize: 18),
      labelColor: GlobalColors.fontBlackColor,
      unselectedLabelColor: GlobalColors.fontUnselectColor,
      unselectedLabelStyle: TextStyle(fontSize: 18),
    ),
  );
  JWindow.screenWidth = _mediaQueryData.size.width;
  JWindow.screenHeight = _mediaQueryData.size.height;
  JWindow.appBarHeight = _appBar.preferredSize.height;
  JWindow.statusBarTop = _mediaQueryData.padding.top;
  JWindow.statusBarBottom = _mediaQueryData.padding.bottom;
  print("appBarHeight = " + _appBar.preferredSize.height.toString() + " ; statusBarTop = " +_mediaQueryData.padding.top.toString());
  return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: GlobalColors.bgColor,
        appBar: _appBar,
        body: TabBarView(children: [
          RecommendPage().buildPage(null),
          RecommendPage().buildPage(null),
          RecommendPage().buildPage(null)
        ]),
      ));
}
