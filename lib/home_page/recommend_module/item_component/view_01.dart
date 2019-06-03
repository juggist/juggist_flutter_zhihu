import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_flutter/views/j_video_player.dart';

import 'state.dart';

Widget buildView(ItemComponentState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      viewService.buildComponent("accountInfo"),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 180,
          child: JVideoPlayer(
            videoPath: state.videoPath,
            index: 0,
            focuseIndex: 0,
          ),
        ),
      ),
      viewService.buildComponent("content"),
    ],
  );
}
