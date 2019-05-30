import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../global_config.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rect_getter/rect_getter.dart';

Widget buildView(
    RecommendState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  final context = viewService.context;
  int _firstItemIndex = 1; //窗口第一个显示item的下标
  bool _initRootY = false;
  double _rootTop = 0;
  double _rootBottom = 0;
  return Container(
    color: GlobalColors.bgColor,
    child: EasyRefresh(
      behavior: ScrollOverBehavior(),
      key: state.easyRefreshKey,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {});
      },
      loadMore: state.loadMore
          ? () async {
              await Future.delayed(Duration(seconds: 2), () {});
            }
          : null,
      scrollNotificationListener: (ScrollNotification notifaction) {
        if (!_initRootY) {
          _initRootY = true;
          _rootTop = context
              .findRenderObject()
              .getTransformTo(null)
              .getTranslation()
              .y;
          _rootBottom = context
                  .findRenderObject()
                  .getTransformTo(null)
                  .getTranslation()
                  .y +
              context.findRenderObject().semanticBounds.height;
        }
        var itemRect = RectGetter.getRectFromKey(
            state.itemStates[_firstItemIndex].rectKey);

        if (itemRect != null) {
          if (itemRect.top >= (_rootTop)) {
            if (_firstItemIndex > 0) _firstItemIndex--;
          } else if (itemRect.bottom < (_rootTop)) {
            if (_firstItemIndex < (state.itemStates.length - 1))
              _firstItemIndex++;
          }
        }
        print("firstItem : $_firstItemIndex");
      },
      refreshHeader: ClassicsHeader(
        key: state.headerKey,
        refreshText: Refresh.refreshText,
        refreshReadyText: Refresh.refreshReadyText,
        refreshingText: Refresh.refreshingText,
        refreshedText: Refresh.refreshedText,
        moreInfo: Refresh.moreInfo,
        showMore: true,
        bgColor: GlobalColors.bgColor,
        textColor: Colors.black,
        moreInfoColor: Colors.black,
      ),
      refreshFooter: ClassicsFooter(
        key: state.footKey,
        loadText: Refresh.loadText,
        loadReadyText: Refresh.loadReadyText,
        loadingText: Refresh.loadingText,
        loadedText: Refresh.loadedText,
        noMoreText: Refresh.noMoreText,
        moreInfo: Refresh.moreInfo,
        showMore: true,
        bgColor: GlobalColors.bgColor,
        textColor: Colors.black,
        moreInfoColor: Colors.black,
      ),
      emptyWidget: Container(
        width: JWindow.screenWidth,
        height: JWindow.screenHeight -
            JWindow.appBarHeight -
            JWindow.statusBarBottom -
            JWindow.statusBarTop,
        child: Center(
          child: Text(
            "没有更多数据",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),

      ///TODO
      ///因为ListView.separated导致滑动计算item的top不准确，所以替换ListView.builder。
      ///separated由item的margin代替
      child: ListView.builder(
          itemBuilder: adapter.itemBuilder, itemCount: adapter.itemCount),
    ),
  );
}