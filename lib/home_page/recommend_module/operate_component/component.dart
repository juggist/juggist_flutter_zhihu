import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class OperateComponent extends Component<OperateState> {
  OperateComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<OperateState>(
                adapter: null,
                slots: <String, Dependent<OperateState>>{
                }),);

}
