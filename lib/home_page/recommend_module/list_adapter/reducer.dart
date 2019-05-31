import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

import 'action.dart';
import 'package:zhihu_flutter/home_page/recommend_module/state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendListAdapterAction.refresh: _refreshAction,
      RecommendListAdapterAction.add: _addAction,
      RecommendListAdapterAction.remove: _removeAction,
    },
  );
}

RecommendState _refreshAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final List<ItemState> addStates = action.payload;
  return newState
    ..itemStates.clear()
    ..itemStates.addAll(addStates);
}

RecommendState _addAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final List<ItemState> addStates = action.payload;
  return newState..itemStates.add(addStates[0]);
}

RecommendState _removeAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final String uniqueId = action.payload;
  newState.itemStates.removeWhere((state) => state.uniqueId == uniqueId);
  return newState;
}
