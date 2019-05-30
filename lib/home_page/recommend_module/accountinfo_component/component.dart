import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class AccountInfoComponent extends Component<AccountInfoState> {
  AccountInfoComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<AccountInfoState>(
                adapter: null,
                slots: <String, Dependent<AccountInfoState>>{
                }),);


}
