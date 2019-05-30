import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeIndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeIndexState>>{
      ListAdapterAction.action: _onAction,
    },
  );
}

HomeIndexState _onAction(HomeIndexState state, Action action) {
  final HomeIndexState newState = state.clone();
  return newState;
}
