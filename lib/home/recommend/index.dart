import 'dart:async';

import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../views/j_video_player.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zhihu_flutter/mock.dart';
import '../config.dart';

//第二页卡
class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() {
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage> {
  List<Map<String, String>> _mockData = List<Map<String, String>>();
  bool _loadMore = true;
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footKey = GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _mockData.addAll(RecommendData.initData);
      if (_mockData.length == 0) {
        _loadMore = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgColor,
      child: EasyRefresh(
        behavior: ScrollOverBehavior(),
        key: _easyRefreshKey,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _mockData.clear();
              _mockData.addAll(RecommendData.initData);
              _loadMore = true;
              _easyRefreshKey.currentState.waitState(() {
                setState(() {});
              });
            });
          });
        },
        loadMore: _loadMore
            ? () async {
                await Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    _mockData.addAll(RecommendData.addData);
                    _easyRefreshKey.currentState.waitState(() {
                      setState(() {});
                    });
                  });
                });
              }
            : null,
        scrollNotificationListener: (ScrollNotification notifaction) {
//          print("before : " + notifaction.metrics.extentBefore.toString());
//          print("after : " + notifaction.metrics.extentAfter.toString());
//          print("inside : " + notifaction.metrics.extentInside.toString());
//          print("outOfRange : " + notifaction.metrics.outOfRange.toString());
//          print("atEdge : " + notifaction.metrics.atEdge.toString());
//          print("maxScrollExtent : " +
//              notifaction.metrics.maxScrollExtent.toString());
//          print("minScrollExtent : " +
//              notifaction.metrics.minScrollExtent.toString());
//          print("pixels : " + notifaction.metrics.pixels.toString());
//          print("viewportDimension : " +
//              notifaction.metrics.viewportDimension.toString());
//          print("=======areaHeight : " +
//              (JWindow.screenHeight -
//                      JWindow.appBarHeight -
//                      JWindow.statusBarTop)
//                  .toString());
        },
        refreshHeader: ClassicsHeader(
          key: _headerKey,
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
          key: _footKey,
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
        child: ListView.separated(
            padding: EdgeInsets.only(top: 12),
            itemBuilder: (BuildContext context, int index) {
              return ListItem(
                index: index,
                data: _mockData[index],
              )
//                GestureDetector(
//                child: Container(
//                  padding: EdgeInsets.fromLTRB(22, 20, 22, 4),
//                  color: Colors.white,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      _title(index),
//                      _combineAccoutnInfoAndContent(index),
//                      _operate(index),
//                    ],
//                  ),
//                ),
//                onTap: () {
//                },
//              )
                  ;
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 12,
                color: GlobalColors.bgColor,
              );
            },
            itemCount: _mockData.length),
      ),
    );
  }

//  ///标题
//  Widget _title(int index) {
//    return Text(
//      _mockData[index]["title"],
//      maxLines: 2,
//      overflow: TextOverflow.ellipsis,
//      style: TextStyle(
//          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
//    );
//  }
//
//  ///账号详情
//  Widget _accountInfo(int index) {
//    return Padding(
//        padding: EdgeInsets.only(top: 12, bottom: 12),
//        child: Row(
//          children: <Widget>[
//            CircleAvatar(
//              radius: 15,
//              backgroundImage: NetworkImage(_mockData[index]["userAvatarPath"]),
//            ),
//            Padding(
//              padding: EdgeInsets.only(left: 8, right: 8),
//              child: Text(
//                _mockData[index]["userName"],
//                style: TextStyle(
//                    fontSize: 14,
//                    color: GlobalColors.iconColor,
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//            /**
//             * TODO
//             * question:A RenderFlex overflowed by 66 pixels on the right
//             * answer:https://blog.csdn.net/qq_32319999/article/details/80420775
//             * */
//            Expanded(
//              child: Text(
//                _mockData[index]["userPortrait"],
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontSize: 14, color: GlobalColors.fontUnselectColor),
//              ),
//            ),
//          ],
//        ));
//  }
//
//  ///内容
//  Widget _content(int index) {
//    return Text(
//      _mockData[index]["content"],
//      style: TextStyle(fontSize: 16, color: GlobalColors.fontDetailColor),
//      maxLines: 2,
//      overflow: TextOverflow.ellipsis,
//    );
//  }
//
//  ///操作
//  Widget _operate(int index) {
//    return Padding(
//        padding: EdgeInsets.only(top: 0),
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              child: Text(
//                _mockData[index]["agreeNum"].toString() +
//                    "赞同 " +
//                    _mockData[index]["commentNum"] +
//                    "评论",
//                style: TextStyle(
//                    fontSize: 14, color: GlobalColors.fontUnselectColor),
//              ),
//            ),
//            PopupMenuButton(
//              itemBuilder: (BuildContext context) {
//                return <PopupMenuItem<operate>>[
//                  PopupMenuItem(
//                    child: Text("屏蔽这个问题"),
//                    value: operate.shield_this_question,
//                  ),
//                  PopupMenuItem(
//                    child: Text("设置屏蔽关键词"),
//                    value: operate.setting_shield_key,
//                  ),
//                  PopupMenuItem(
//                    child: Text("举报"),
//                    value: operate.report,
//                  )
//                ];
//              },
//              icon: Icon(
//                Icons.more_horiz,
//                color: GlobalColors.fontUnselectColor,
//              ),
//              onSelected: (operate value) {
//                switch (value) {
//                  case operate.shield_this_question:
//                    setState(() {
//                      _mockData.removeAt(index);
//                      if (_mockData.length == 0) {
//                        _loadMore = false;
//                      }
//                    });
//                    break;
//                  case operate.setting_shield_key:
//                    break;
//                  case operate.report:
//                    break;
//                }
//              },
//            ),
//          ],
//        ));
//  }
//
//  ///整合accountInfo和content布局
//  ///并整合视频或者图片的布局
//  Widget _combineAccoutnInfoAndContent(int index) {
//    if (_mockData[index]["videoPath"].isNotEmpty) {
//      print("video:position = $index");
//      //case 1:存在视频（优先）
//      return Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          _accountInfo(index),
//          Padding(
//            padding: EdgeInsets.only(bottom: 10),
//            child: SizedBox(
//              height: 180,
//              child: JVideoPlayer(
//                videoPath: _mockData[index]["videoPath"],
//              ),
//            ),
//          ),
//          _content(index),
//        ],
//      );
//    } else if (_mockData[index]["picPath"].isNotEmpty) {
//      //case 2:不存在视频，存在图片
//      return Row(
//        children: <Widget>[
//          Expanded(
//              child: Column(
//            children: <Widget>[_accountInfo(index), _content(index)],
//          )),
//          Padding(
//            padding: EdgeInsets.only(bottom: 4),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(4),
//              child: Image(
//                width: 125,
//                height: 80,
//                fit: BoxFit.cover,
//                image: NetworkImage(_mockData[index]["picPath"]),
//              ),
//            ),
//          ),
//        ],
//        crossAxisAlignment: CrossAxisAlignment.end,
//      );
//    } else {
//      //case 3:不存在视频或者图片
//      return Column(
//        children: <Widget>[
//          _accountInfo(index),
//          _content(index),
//        ],
//      );
//    }
//  }
}

class ListItem extends StatefulWidget{
  final int index;
  final Map<String, String> data;

  ListItem({@required this.index, @required this.data});
  @override
  State<StatefulWidget> createState() {
    return ListItemState();
  }

}
class ListItemState extends State<ListItem> {
  WidgetsBinding widgteBinding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(22, 20, 22, 4),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            _combineAccoutnInfoAndContent(),
            _operate(),
          ],
        ),
      ),
      onTap: () {
        print("height = " +
            context.findRenderObject().paintBounds.height.toString());
      },
    );
  }

  ///标题
  Widget _title() {
    return Text(
      widget.data["title"],
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  ///账号详情
  Widget _accountInfo() {
    return Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.data["userAvatarPath"]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                widget.data["userName"],
                style: TextStyle(
                    fontSize: 14,
                    color: GlobalColors.iconColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            /**
             * TODO
             * question:A RenderFlex overflowed by 66 pixels on the right
             * answer:https://blog.csdn.net/qq_32319999/article/details/80420775
             * */
            Expanded(
              child: Text(
                widget.data["userPortrait"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14, color: GlobalColors.fontUnselectColor),
              ),
            ),
          ],
        ));
  }

  ///内容
  Widget _content() {
    return Text(
      widget.data["content"],
      style: TextStyle(fontSize: 16, color: GlobalColors.fontDetailColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  ///操作
  Widget _operate() {
    return Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.data["agreeNum"].toString() + "赞同 " + widget.data["commentNum"] + "评论",
                style: TextStyle(
                    fontSize: 14, color: GlobalColors.fontUnselectColor),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<operate>>[
                  PopupMenuItem(
                    child: Text("屏蔽这个问题"),
                    value: operate.shield_this_question,
                  ),
                  PopupMenuItem(
                    child: Text("设置屏蔽关键词"),
                    value: operate.setting_shield_key,
                  ),
                  PopupMenuItem(
                    child: Text("举报"),
                    value: operate.report,
                  )
                ];
              },
              icon: Icon(
                Icons.more_horiz,
                color: GlobalColors.fontUnselectColor,
              ),
              onSelected: (operate value) {
                switch (value) {
                  case operate.shield_this_question:
//                    setState(() {
//                      _mockData.removeAt(index);
//                      if (_mockData.length == 0) {
//                        _loadMore = false;
//                      }
//                    });
                    break;
                  case operate.setting_shield_key:
                    break;
                  case operate.report:
                    break;
                }
              },
            ),
          ],
        ));
  }

  ///整合accountInfo和content布局
  ///并整合视频或者图片的布局
  Widget _combineAccoutnInfoAndContent() {
    if (widget.data["videoPath"].isNotEmpty) {
      //case 1:存在视频（优先）
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _accountInfo(),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 180,
              child: JVideoPlayer(
                videoPath: widget.data["videoPath"],
              ),
            ),
          ),
          _content(),
        ],
      );
    } else if (widget.data["picPath"].isNotEmpty) {
      //case 2:不存在视频，存在图片
      return Row(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[_accountInfo(), _content()],
          )),
          Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image(
                width: 125,
                height: 80,
                fit: BoxFit.cover,
                image: NetworkImage(widget.data["picPath"]),
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.end,
      );
    } else {
      //case 3:不存在视频或者图片
      return Column(
        children: <Widget>[
          _accountInfo(),
          _content(),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    widgteBinding = WidgetsBinding.instance;
    widgteBinding.addPostFrameCallback((callback){
      if(context.findRenderObject() == null){
        print("render is null");
      }else{
        if(context.findRenderObject().paintBounds == null){
          print("paintBounds is null");
        }else{
          print("paintBounds.height = " + context.findRenderObject().paintBounds.height.toString());
        }
      }
    });
  }
}
