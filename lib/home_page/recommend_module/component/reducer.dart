import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
    },
  );
}

