import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  print("key 03 = " + state.uniqueId.toString());
  return GestureDetector(
//    key: ValueKey(state.uniqueId),
    child: RectGetter(
        key: state.rectKey,
        child: Container(
          margin: EdgeInsets.only(top: state.marginTop),
          padding: EdgeInsets.fromLTRB(22, 20, 22, 4),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              viewService.buildComponent("title"),
              Column(
                children: <Widget>[
                  viewService.buildComponent("accountInfo"),
                  viewService.buildComponent("content"),
                ],
              ),
              viewService.buildComponent("operate"),
            ],
          ),
        )),
    onTap: () {
      print("height = " +
          viewService.context.findRenderObject().paintBounds.height.toString());
    },
  );
}
