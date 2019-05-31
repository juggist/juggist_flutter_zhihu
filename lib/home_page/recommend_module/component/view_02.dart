import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  print("key 02 = " + state.uniqueId.toString());
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
              Row(
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
