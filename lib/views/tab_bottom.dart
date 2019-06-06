import 'package:flutter/material.dart';

import '../global_config.dart';

//首页底部按钮
class TabBottom extends StatelessWidget {
  bool selectAble;
  String title;
  IconData iconData;
  int index;
  double size;

  TabBottom({
    @required this.index,
    this.title,
    @required this.iconData,
    this.size = 25,
    @required this.selectAble,
  })  : assert(index != null),
        assert(iconData != null),
        assert(selectAble != null);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: size,
            color: selectAble
                ? GlobalColors.iconSelectColoro
                : GlobalColors.fontUnselectColor,
          ),
          title != null
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    color: selectAble
                        ? GlobalColors.iconSelectColoro
                        : GlobalColors.fontUnselectColor,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
