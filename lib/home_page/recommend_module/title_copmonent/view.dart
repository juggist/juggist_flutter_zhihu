import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(TitleState state, Dispatch dispatch, ViewService viewService) {
  return Text(
    state.title,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
