import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<OperateState> buildEffect() {
  return combineEffects(<Object, Effect<OperateState>>{
//    OperateAction.action: _onAction,
  });
}

void _onAction(Action action, Context<OperateState> ctx) {
}
