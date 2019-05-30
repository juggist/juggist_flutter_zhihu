import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

class TitleState implements Cloneable<TitleState> {
  String title = "";

  TitleState({this.title = ""});

  @override
  TitleState clone() {
    return TitleState()..title = title;
  }
}

TitleState initState(Map<String, dynamic> args) {
  return TitleState();
}

class TitleConnector extends ConnOp<ItemState, TitleState> {
  @override
  TitleState get(ItemState state) {
    return TitleState()..title = state.title;
  }
}
