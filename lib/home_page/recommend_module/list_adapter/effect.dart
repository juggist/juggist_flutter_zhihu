import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import 'action.dart';

Effect<RecommendState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendState>>{
    RecommendListAdapterAction.addEffect: _addEffect,
  });
}

void _addEffect(Action action, Context<RecommendState> ctx){
  Function() complete = action.payload;
  complete();
}
