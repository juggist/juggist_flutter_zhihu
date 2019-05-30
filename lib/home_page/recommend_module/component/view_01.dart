import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import 'action.dart';
import 'state.dart';
import 'package:zhihu_flutter/views/j_video_player.dart';


Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    key: ValueKey(state.uniqueId),
    child: RectGetter(
        key:state.rectKey,
        child: Container(
          margin: EdgeInsets.only(top: state.marginTop),
          padding: EdgeInsets.fromLTRB(22, 20, 22, 4),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              viewService.buildComponent("title"),
              Column(
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
              ),
              viewService.buildComponent("operate"),
            ],
          ),
        )),
    onTap: () {
      dispatch(ItemActionCreator.onAction());
    },
  );
}
