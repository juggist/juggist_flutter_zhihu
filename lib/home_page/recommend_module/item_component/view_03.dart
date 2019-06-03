import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/state.dart';

Widget buildView(ItemComponentState state, Dispatch dispatch, ViewService viewService) {
  return  Column(
    children: <Widget>[
      viewService.buildComponent("accountInfo"),
      viewService.buildComponent("content"),
    ],
  );
}
