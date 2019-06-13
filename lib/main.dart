import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/test.dart';
import 'home_page/page.dart';
import 'main/page.dart';
import 'mine_page/page.dart';

void main() {
  runApp(App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

final routes = HybridRoutes(routes: [
  PageRoutes(pages: <String, Page<Object, dynamic>>{
    "home": HomeIndexPage(),
    "mine": MinePage(),
  }),
]);

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _createRootWidget();
  }
}

Widget _createRootWidget() {
  final debug = true;

  return MaterialApp(
    debugShowCheckedModeBanner: debug,
    showPerformanceOverlay: debug,
    // 使用了saveLayer的图形会显示为棋盘格式并随着页面刷新而闪烁
    checkerboardOffscreenLayers: debug,
    // 做了缓存的静态图片在刷新页面时不会改变棋盘格的颜色；如果棋盘格颜色变了说明被重新缓存了，这是我们要避免的
    checkerboardRasterCacheImages: debug,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      buttonTheme: ButtonThemeData(
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ), //配置button没有最小宽高限制
    ),
    home: MainPage(),
//    home: routes.buildPage("home", null),
  );
}
