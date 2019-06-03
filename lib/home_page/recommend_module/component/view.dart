import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../global_config.dart';
import '../config.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    key: ValueKey(state.uniqueId),
    child: RectGetter(
        key: state.rectKey,
        child: Container(
          margin: EdgeInsets.only(top: state.marginTop),
          padding: EdgeInsets.fromLTRB(22, 20, 22, 4),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                state.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              viewService.buildComponent("dynamicComponent"),
              Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          state.agreeNum + "赞同 " + state.commentNum + "评论",
                          style: TextStyle(
                              fontSize: 14,
                              color: GlobalColors.fontUnselectColor),
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
                              dispatch(ItemActionCreator.shieldAction(state.uniqueId));
                              break;
                            case operate.setting_shield_key:
                              break;
                            case operate.report:
                              break;
                          }
                        },
                      ),
                    ],
                  )),
            ],
          ),
        )),
    onTap: () {
    },
  );
}
