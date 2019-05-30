import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_flutter/global_config.dart';

import 'state.dart';

Widget buildView(AccountInfoState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(state.userAvatarPath),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              state.userName,
              style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.iconColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          /**
           * TODO
           * question:A RenderFlex overflowed by 66 pixels on the right
           * answer:https://blog.csdn.net/qq_32319999/article/details/80420775
           * */
          Expanded(
            child: Text(
              state.userPortrait,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14, color: GlobalColors.fontUnselectColor),
            ),
          ),
        ],
      ));
}
