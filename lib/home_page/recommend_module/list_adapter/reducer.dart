import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/action.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

import '../../../mock.dart';
import 'action.dart';
import 'package:zhihu_flutter/home_page/recommend_module/state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendListAdapterAction.refresh: _refresh,
      RecommendListAdapterAction.add: _add,
      RecommendListAdapterAction.remove: _remove,
      ItemAction.shield: _remove,
    },
  );
}

RecommendState _refresh(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final List<ItemState> addStates = action.payload;
  return newState
    ..itemStates.clear()
    ..itemStates.addAll(addStates);
}

RecommendState _add(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final List<ItemState> addStates = action.payload;
  return newState..itemStates.addAll(addStates);
}

RecommendState _remove(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final String uniqueId = action.payload;
  newState.itemStates.removeWhere((state) => state.uniqueId == uniqueId);
  return newState;
}
