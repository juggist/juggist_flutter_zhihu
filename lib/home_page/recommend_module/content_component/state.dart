import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/state.dart';

class ContentState implements Cloneable<ContentState> {
  String content = "";

  ContentState({this.content = ""});

  @override
  ContentState clone() {
    return ContentState()..content = content;
  }
}

ContentState initState(Map<String, dynamic> args) {
  return ContentState();
}

class ContentConnector extends ConnOp<ItemComponentState,ContentState>{


  @override
  ContentState get(ItemComponentState state) {
    return ContentState()..content = state.content;
  }
}