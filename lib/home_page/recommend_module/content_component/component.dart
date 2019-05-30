import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class ContentComponent extends Component<ContentState> {
  ContentComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<ContentState>(
                adapter: null,
                slots: <String, Dependent<ContentState>>{
                }),);

}
