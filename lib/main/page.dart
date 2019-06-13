import 'package:flutter/material.dart';
import 'package:zhihu_flutter/views/tab_bottom.dart';


import '../main.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<bool> selectAbles = List.generate(5, (i) {
    if (i == 0) {
      return true;
    } else {
      return false;
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          children: [
            routes.buildPage("home", null),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.black,
            ),
            Container(
              color: Colors.black,
            ),
            routes.buildPage("mine", null),
          ],
          controller: tabController,
        ),
        bottomNavigationBar:SafeArea(child: TabBar(
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(),
            isScrollable: false,
            controller: tabController,
            tabs: [
              TabBottom(
                index: 0,
                title: "首页",
                iconData: Icons.home,
                selectAble: selectAbles[0],
              ),
              TabBottom(
                index: 1,
                title: "会员",
                iconData: Icons.card_giftcard,
                selectAble: selectAbles[1],
              ),
              TabBottom(
                index: 2,
                iconData: Icons.add_circle,
                size: 40,
                selectAble: selectAbles[2],
              ),
              TabBottom(
                index: 3,
                title: "通知",
                iconData: Icons.notifications,
                selectAble: selectAbles[3],
              ),
              TabBottom(
                index: 4,
                title: "我的",
                iconData: Icons.perm_identity,
                selectAble: selectAbles[4],
              ),
            ])));

  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        for (int i = 0; i < selectAbles.length; i++) {
          if (i == tabController.index) {
            selectAbles[i] = true;
          } else {
            selectAbles[i] = false;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

}
