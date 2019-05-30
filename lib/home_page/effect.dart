import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeIndexState> buildEffect() {
  return combineEffects(<Object, Effect<HomeIndexState>>{
    ListAdapterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeIndexState> ctx) {
}
