import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

enum RecommendListAdapterAction { refresh, add, remove }

class RecommendListAdapterActionCreator {
  static Action refreshAction(List<ItemState> states) {
    return Action(RecommendListAdapterAction.refresh, payload: states);
  }

  static Action addAction(List<ItemState> states) {
    return Action(RecommendListAdapterAction.add, payload: states);
  }

  static Action removeAction(String uniqueId) {
    return Action(RecommendListAdapterAction.remove, payload: uniqueId);
  }
}
