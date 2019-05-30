import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../../global_config.dart';
import 'state.dart';

Widget buildView(SearchState state, Dispatch dispatch, ViewService viewService) {
  return  Row(
    children: <Widget>[
      Expanded(
        child: Container(
          height: 38,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 5),
          child: FlatButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.search,
              size: 30,
              color: GlobalColors.iconColor,
            ),
            label: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                state.searchTip,
                style: TextStyle(
                    fontSize: 20,
                    color: GlobalColors.iconColor,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: GlobalColors.bgColor,
              borderRadius: BorderRadius.all(Radius.circular(6))),
        ),
      ),
      IconButton(
          icon: Icon(
            Icons.assignment,
            color: GlobalColors.iconColor,
            size: 28,
          ),
          onPressed: null,
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.center),
    ],
  );
}
