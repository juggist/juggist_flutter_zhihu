import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendAction.updateFocuseIndex: _updateFocuseIndex,
    },
  );
}

RecommendState _updateFocuseIndex(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final releaseFocuseIndex = action.payload["releaseFocuseIndex"];
  final inFocuseIndex = action.payload["inFocuseIndex"];
  return newState
    ..itemStates[releaseFocuseIndex].firstItemIndex = false
    ..itemStates[inFocuseIndex].firstItemIndex = true;
}