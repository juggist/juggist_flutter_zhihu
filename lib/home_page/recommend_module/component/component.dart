import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';
class ItemComponent extends Component<ItemState>{


  ItemComponent(Dependent<ItemState> dynamicComponent):super(view:buildView,dependencies:Dependencies<ItemState>(
    slots: <String, Dependent<ItemState>>{
        "dynamicComponent":dynamicComponent
    }
  ));
}