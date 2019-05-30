import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'package:zhihu_flutter/global_config.dart';

Widget buildView(ContentState state, Dispatch dispatch, ViewService viewService) {
  return  Text(
    state.content,
    style: TextStyle(fontSize: 16, color: GlobalColors.fontDetailColor),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}
