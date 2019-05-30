import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view_02.dart';
import 'package:zhihu_flutter/home_page/recommend_module/title_copmonent/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/title_copmonent/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/accountinfo_component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/accountinfo_component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/content_component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/content_component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/operate_component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/operate_component/state.dart';

class ItemComponent02 extends Component<ItemState> {
  ItemComponent02()
      : super(
    effect: buildEffect(),
    reducer: buildReducer(),
    view: buildView,
    dependencies: Dependencies<ItemState>(
        adapter: null,
        slots: <String, Dependent<ItemState>>{
          "title":TitleConnector() + TitleComponent(),
          "accountInfo":AccountInfoConnector() + AccountInfoComponent(),
          "content":ContentConnector() + ContentComponent(),
          "operate":OperateConnector() + OperateComponent(),
        }),);

}
