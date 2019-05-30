import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<RecommendState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendState>>{
    Lifecycle.initState:_init,
  });
}
void _init(Action action, Context<RecommendState> ctx){

}

