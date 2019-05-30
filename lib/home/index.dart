import 'package:flutter/material.dart';
import '../global_config.dart';
import 'page_follow.dart';
import 'page_hotbrand.dart';
import 'package:zhihu_flutter/home/recommend/index.dart';

class IndexHome extends StatefulWidget {

  @override
  _IndexHomeState createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    AppBar _appBar = AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: _searchBar(),
      bottom: _tabCard(),
    );
    JWindow.screenWidth = _mediaQueryData.size.width;
    JWindow.screenHeight = _mediaQueryData.size.height;
    JWindow.appBarHeight = _appBar.preferredSize.height;
    JWindow.statusBarTop = _mediaQueryData.padding.top;
    JWindow.statusBarBottom = _mediaQueryData.padding.bottom;

    return

      DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: GlobalColors.bgColor,
          appBar: _appBar,
          body: TabBarView(
              children: [FollowPage(), RecommendPage(), HotBrandPage()]),
        ));
  }

  //搜索栏
  Widget _searchBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 38,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 5),
            child: FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.search,
                size: 30,
                color: GlobalColors.iconColor,
              ),
              label: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "i am ironMan",
                  style: TextStyle(
                      fontSize: 20,
                      color: GlobalColors.iconColor,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: GlobalColors.bgColor,
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.assignment,
              color: GlobalColors.iconColor,
              size: 28,
            ),
            onPressed: null,
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.center),
      ],
    );
  }

  //顶部Tab页卡
  Widget _tabCard() {
    return TabBar(
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
