import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class SearchComponent extends Component<SearchState> {
  SearchComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<SearchState>(
                adapter: null,
                slots: <String, Dependent<SearchState>>{
                }),);

}
