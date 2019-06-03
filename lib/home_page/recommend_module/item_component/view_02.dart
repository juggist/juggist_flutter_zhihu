import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/state.dart';

Widget buildView(ItemComponentState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    children: <Widget>[
      Expanded(
          child: Column(
            children: <Widget>[
              viewService.buildComponent("accountInfo"),
              viewService.buildComponent("content")
            ],
          )),
      Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image(
            width: 125,
            height: 80,
            fit: BoxFit.cover,
            image: NetworkImage(state.picPath),
          ),
        ),
      ),
    ],
    crossAxisAlignment: CrossAxisAlignment.end,
  );
}
