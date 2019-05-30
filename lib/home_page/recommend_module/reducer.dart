import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendAction.initRect: _rootBottomAction,
    },
  );
}

RecommendState _rootBottomAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  final Map<String, double> payload = action.payload;
  return newState
    ..initRootY = true
    ..rootTop = payload["rootTop"]
    ..rootBottom = payload["rootBottom"];
}
