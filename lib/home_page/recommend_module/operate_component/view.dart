import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';
import 'package:zhihu_flutter/global_config.dart';
import 'package:zhihu_flutter/home_page/recommend_module/config.dart';

Widget buildView(OperateState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              state.agreeNum +
                  "赞同 " +
                  state.commentNum +
                  "评论",
              style: TextStyle(
                  fontSize: 14, color: GlobalColors.fontUnselectColor),
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
//                  if (widget.deleteItemListener != null) {
//                    widget.deleteItemListener(widget.index);
//                  }
                  break;
                case operate.setting_shield_key:
                  break;
                case operate.report:
                  break;
              }
            },
          ),
        ],
      ));
}
