import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MineState> buildReducer() {
  return asReducer(
    <Object, Reducer<MineState>>{
      MineAction.updatePinedBarStatus: _updatePinedBarStatus,
    },
  );
}

MineState _updatePinedBarStatus(MineState state, Action action) {
  final MineState newState = state.clone();
  final int pinedBarStatus = action.payload;
  return newState..pinedBarStatus = pinedBarStatus;
}
