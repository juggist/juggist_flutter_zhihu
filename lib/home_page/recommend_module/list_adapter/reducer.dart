import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

import 'action.dart';
import 'package:zhihu_flutter/home_page/recommend_module/state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendListAdapterAction.add: _addAction,
      RecommendListAdapterAction.remove: _removeAction,
    },
  );
}

RecommendState _addAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final List<ItemState> addStates = action.payload;
  newState.itemStates.addAll(addStates);
  return newState;
}

RecommendState _removeAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final String uniqueId = action.payload;
  newState.itemStates
      .removeWhere((state) => state.uniqueId == uniqueId);
  return newState;
}
