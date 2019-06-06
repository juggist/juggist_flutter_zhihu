import 'package:flutter/material.dart';

class GlobalColors {
  static const Color bgColor = Color(0xFFebebeb);
  static const Color fontBlackColor = Color(0xFF1a1a1a);
  static const Color fontUnselectColor = Color(0xFF999999);
  static const Color fontDetailColor = Color(0xFF444444);
  static const Color iconColor = Color(0xFF646464);
  static const Color iconSelectColoro = Color(0xFF0085fe);
}

class Refresh {
  static const String moreInfo = "更新于 %T";

  ///下拉刷新
  static const String refreshText = "下拉刷新";
  static const String refreshReadyText = "释放刷新";
  static const String refreshingText = "正在刷新...";
  static const String refreshedText = "刷新完成";

  ///上拉加载
  static const String loadText = "上拉加载更多";
  static const String loadReadyText = "释放加载更多";
  static const String loadingText = "正在加载中...";
  static const String loadedText = "加载完成";
  static const String noMoreText = "没有更多数据";
}

//设备宽高
class JWindow{
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double statusBarTop = 0;
  static double statusBarBottom = 0;
  static double appBarHeight = 0;

}
