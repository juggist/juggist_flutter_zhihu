import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<OperateState> buildReducer() {
  return asReducer(
    <Object, Reducer<OperateState>>{
      OperateAction.shield: _shieldAction,
    },
  );
}

OperateState _shieldAction(OperateState state, Action action) {
  final OperateState newState = state.clone();

  return newState;
}
