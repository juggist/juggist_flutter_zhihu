import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/accountinfo_component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/accountinfo_component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/content_component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/content_component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/state.dart';

import 'view_02.dart';

class ItemComponent_02 extends Component<ItemComponentState> {
  ItemComponent_02()
      : super(
            view: buildView,
            dependencies: Dependencies<ItemComponentState>(
                adapter: null,
                slots: <String, Dependent<ItemComponentState>>{
                  "accountInfo":AccountInfoConnector() + AccountInfoComponent(),
                  "content":ContentConnector() + ContentComponent(),
                }),);

}
