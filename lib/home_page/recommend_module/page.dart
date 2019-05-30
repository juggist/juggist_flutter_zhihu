import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecommendPage extends Page<RecommendState, Map<String, dynamic>> {

  RecommendPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecommendState>(
                adapter: RecommendListAdapterAdapter(),
                slots: <String, Dependent<RecommendState>>{
                }),
            middleware: <Middleware<RecommendState>>[
            ],);


}
